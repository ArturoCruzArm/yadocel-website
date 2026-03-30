#!/bin/bash

# Script para configurar DNS de Cloudflare para GitHub Pages
# Domain: yadocel.org → GitHub Pages

echo "🌐 Configurando DNS de Cloudflare para yadocel.org"
echo ""

# Verificar que las variables estén configuradas
if [ -z "$CLOUDFLARE_API_TOKEN" ]; then
    echo "❌ Error: CLOUDFLARE_API_TOKEN no está configurado"
    echo ""
    echo "Para obtener tu API Token:"
    echo "1. Ve a https://dash.cloudflare.com/profile/api-tokens"
    echo "2. Click en 'Create Token'"
    echo "3. Usa el template 'Edit zone DNS'"
    echo "4. Selecciona tu dominio yadocel.org"
    echo "5. Copia el token generado"
    echo ""
    echo "Luego ejecuta:"
    echo "export CLOUDFLARE_API_TOKEN='tu-token-aqui'"
    echo "./setup-cloudflare.sh"
    exit 1
fi

if [ -z "$CLOUDFLARE_ZONE_ID" ]; then
    echo "❌ Error: CLOUDFLARE_ZONE_ID no está configurado"
    echo ""
    echo "Para obtener tu Zone ID:"
    echo "1. Ve a https://dash.cloudflare.com"
    echo "2. Selecciona tu dominio yadocel.org"
    echo "3. En el lado derecho, busca 'Zone ID'"
    echo "4. Cópialo"
    echo ""
    echo "Luego ejecuta:"
    echo "export CLOUDFLARE_ZONE_ID='tu-zone-id-aqui'"
    echo "./setup-cloudflare.sh"
    exit 1
fi

API_TOKEN="$CLOUDFLARE_API_TOKEN"
ZONE_ID="$CLOUDFLARE_ZONE_ID"
DOMAIN="yadocel.org"

# IPs de GitHub Pages
GITHUB_IPS=("185.199.108.153" "185.199.109.153" "185.199.110.153" "185.199.111.153")

echo "✓ API Token configurado"
echo "✓ Zone ID configurado"
echo "✓ Dominio: $DOMAIN"
echo ""

# Función para hacer llamadas a la API
call_api() {
    local method=$1
    local endpoint=$2
    local data=$3

    curl -s -X "$method" \
        "https://api.cloudflare.com/v4/zones/$ZONE_ID/dns_records$endpoint" \
        -H "Authorization: Bearer $API_TOKEN" \
        -H "Content-Type: application/json" \
        ${data:+-d "$data"}
}

echo "🔍 Buscando registros DNS existentes..."

# Obtener registros existentes
existing_records=$(call_api "GET" "?name=$DOMAIN&type=A")
existing_cname=$(call_api "GET" "?name=www.$DOMAIN&type=CNAME")

# Eliminar registros A existentes para @
echo "🗑️  Eliminando registros antiguos..."
echo "$existing_records" | jq -r '.result[].id' 2>/dev/null | while read -r record_id; do
    if [ -n "$record_id" ]; then
        call_api "DELETE" "/$record_id" > /dev/null
        echo "   ✓ Eliminado registro A antiguo"
    fi
done

# Eliminar CNAME existente para www
echo "$existing_cname" | jq -r '.result[].id' 2>/dev/null | while read -r record_id; do
    if [ -n "$record_id" ]; then
        call_api "DELETE" "/$record_id" > /dev/null
        echo "   ✓ Eliminado registro CNAME antiguo"
    fi
done

echo ""
echo "➕ Agregando nuevos registros DNS..."

# Agregar registros A para GitHub Pages
for ip in "${GITHUB_IPS[@]}"; do
    data=$(jq -n \
        --arg name "@" \
        --arg type "A" \
        --arg content "$ip" \
        '{type: $type, name: $name, content: $content, ttl: 1, proxied: false}')

    result=$(call_api "POST" "" "$data")

    if echo "$result" | jq -e '.success' > /dev/null 2>&1; then
        echo "   ✓ Registro A agregado: @ → $ip"
    else
        echo "   ❌ Error agregando registro A: $ip"
        echo "      $(echo "$result" | jq -r '.errors[0].message' 2>/dev/null)"
    fi
done

# Agregar registro CNAME para www
data=$(jq -n \
    --arg name "www" \
    --arg type "CNAME" \
    --arg content "arturoCruzArm.github.io" \
    '{type: $type, name: $name, content: $content, ttl: 1, proxied: false}')

result=$(call_api "POST" "" "$data")

if echo "$result" | jq -e '.success' > /dev/null 2>&1; then
    echo "   ✓ Registro CNAME agregado: www → ArturoCruzArm.github.io"
else
    echo "   ❌ Error agregando registro CNAME"
    echo "      $(echo "$result" | jq -r '.errors[0].message' 2>/dev/null)"
fi

echo ""
echo "✅ Configuración DNS completada!"
echo ""
echo "📋 Registros configurados:"
echo "   @ (A) → 185.199.108.153"
echo "   @ (A) → 185.199.109.153"
echo "   @ (A) → 185.199.110.153"
echo "   @ (A) → 185.199.111.153"
echo "   www (CNAME) → ArturoCruzArm.github.io"
echo ""
echo "⏱️  La propagación DNS puede tomar:"
echo "   - 5-10 minutos (típico)"
echo "   - Hasta 48 horas (máximo)"
echo ""
echo "🔍 Verificar propagación:"
echo "   https://dnschecker.org/#A/yadocel.org"
echo ""
echo "🌐 Tu sitio estará disponible en:"
echo "   http://yadocel.org (en 10-15 minutos)"
echo "   https://yadocel.org (después de 24 horas - certificado SSL)"
echo ""
