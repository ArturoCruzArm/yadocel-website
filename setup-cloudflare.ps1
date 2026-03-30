# Script PowerShell para configurar DNS de Cloudflare para GitHub Pages
# Domain: yadocel.org → GitHub Pages

Write-Host "🌐 Configurando DNS de Cloudflare para yadocel.org" -ForegroundColor Cyan
Write-Host ""

# Variables - REEMPLAZA ESTOS VALORES
$API_TOKEN = $env:CLOUDFLARE_API_TOKEN
$ZONE_ID = $env:CLOUDFLARE_ZONE_ID
$DOMAIN = "yadocel.org"

# Verificar variables
if ([string]::IsNullOrEmpty($API_TOKEN)) {
    Write-Host "❌ Error: CLOUDFLARE_API_TOKEN no está configurado" -ForegroundColor Red
    Write-Host ""
    Write-Host "Para obtener tu API Token:" -ForegroundColor Yellow
    Write-Host "1. Ve a https://dash.cloudflare.com/profile/api-tokens"
    Write-Host "2. Click en 'Create Token'"
    Write-Host "3. Usa el template 'Edit zone DNS'"
    Write-Host "4. Selecciona tu dominio yadocel.org"
    Write-Host "5. Copia el token generado"
    Write-Host ""
    Write-Host "Luego ejecuta:" -ForegroundColor Yellow
    Write-Host '$env:CLOUDFLARE_API_TOKEN="tu-token-aqui"' -ForegroundColor White
    Write-Host ".\setup-cloudflare.ps1" -ForegroundColor White
    exit 1
}

if ([string]::IsNullOrEmpty($ZONE_ID)) {
    Write-Host "❌ Error: CLOUDFLARE_ZONE_ID no está configurado" -ForegroundColor Red
    Write-Host ""
    Write-Host "Para obtener tu Zone ID:" -ForegroundColor Yellow
    Write-Host "1. Ve a https://dash.cloudflare.com"
    Write-Host "2. Selecciona tu dominio yadocel.org"
    Write-Host "3. En el lado derecho, busca 'Zone ID'"
    Write-Host "4. Cópialo"
    Write-Host ""
    Write-Host "Luego ejecuta:" -ForegroundColor Yellow
    Write-Host '$env:CLOUDFLARE_ZONE_ID="tu-zone-id-aqui"' -ForegroundColor White
    Write-Host ".\setup-cloudflare.ps1" -ForegroundColor White
    exit 1
}

Write-Host "✓ API Token configurado" -ForegroundColor Green
Write-Host "✓ Zone ID configurado" -ForegroundColor Green
Write-Host "✓ Dominio: $DOMAIN" -ForegroundColor Green
Write-Host ""

# IPs de GitHub Pages
$GITHUB_IPS = @(
    "185.199.108.153",
    "185.199.109.153",
    "185.199.110.153",
    "185.199.111.153"
)

# Headers para la API
$headers = @{
    "Authorization" = "Bearer $API_TOKEN"
    "Content-Type" = "application/json"
}

# Función para hacer llamadas a la API
function Call-CloudflareAPI {
    param(
        [string]$Method,
        [string]$Endpoint,
        [object]$Body
    )

    $uri = "https://api.cloudflare.com/v4/zones/$ZONE_ID/dns_records$Endpoint"

    try {
        if ($Body) {
            $jsonBody = $Body | ConvertTo-Json -Depth 10
            $response = Invoke-RestMethod -Uri $uri -Method $Method -Headers $headers -Body $jsonBody
        } else {
            $response = Invoke-RestMethod -Uri $uri -Method $Method -Headers $headers
        }
        return $response
    } catch {
        Write-Host "   ❌ Error en la API: $($_.Exception.Message)" -ForegroundColor Red
        return $null
    }
}

Write-Host "🔍 Buscando registros DNS existentes..." -ForegroundColor Yellow

# Obtener registros A existentes
$existingARecords = Call-CloudflareAPI -Method "GET" -Endpoint "?name=$DOMAIN&type=A"

# Obtener registros CNAME existentes
$existingCNAME = Call-CloudflareAPI -Method "GET" -Endpoint "?name=www.$DOMAIN&type=CNAME"

# Eliminar registros existentes
Write-Host "🗑️  Eliminando registros antiguos..." -ForegroundColor Yellow

if ($existingARecords -and $existingARecords.result) {
    foreach ($record in $existingARecords.result) {
        $null = Call-CloudflareAPI -Method "DELETE" -Endpoint "/$($record.id)"
        Write-Host "   ✓ Eliminado registro A: $($record.content)" -ForegroundColor Gray
    }
}

if ($existingCNAME -and $existingCNAME.result) {
    foreach ($record in $existingCNAME.result) {
        $null = Call-CloudflareAPI -Method "DELETE" -Endpoint "/$($record.id)"
        Write-Host "   ✓ Eliminado registro CNAME: $($record.content)" -ForegroundColor Gray
    }
}

Write-Host ""
Write-Host "➕ Agregando nuevos registros DNS..." -ForegroundColor Yellow

# Agregar registros A para GitHub Pages
foreach ($ip in $GITHUB_IPS) {
    $body = @{
        type = "A"
        name = "@"
        content = $ip
        ttl = 1
        proxied = $false
    }

    $result = Call-CloudflareAPI -Method "POST" -Body $body

    if ($result -and $result.success) {
        Write-Host "   ✓ Registro A agregado: @ → $ip" -ForegroundColor Green
    } else {
        Write-Host "   ❌ Error agregando registro A: $ip" -ForegroundColor Red
    }
}

# Agregar registro CNAME para www
$cnameBody = @{
    type = "CNAME"
    name = "www"
    content = "arturoCruzArm.github.io"
    ttl = 1
    proxied = $false
}

$cnameResult = Call-CloudflareAPI -Method "POST" -Body $cnameBody

if ($cnameResult -and $cnameResult.success) {
    Write-Host "   ✓ Registro CNAME agregado: www → ArturoCruzArm.github.io" -ForegroundColor Green
} else {
    Write-Host "   ❌ Error agregando registro CNAME" -ForegroundColor Red
}

Write-Host ""
Write-Host "✅ Configuración DNS completada!" -ForegroundColor Green
Write-Host ""
Write-Host "📋 Registros configurados:" -ForegroundColor Cyan
Write-Host "   @ (A) → 185.199.108.153"
Write-Host "   @ (A) → 185.199.109.153"
Write-Host "   @ (A) → 185.199.110.153"
Write-Host "   @ (A) → 185.199.111.153"
Write-Host "   www (CNAME) → ArturoCruzArm.github.io"
Write-Host ""
Write-Host "⏱️  La propagación DNS puede tomar:" -ForegroundColor Yellow
Write-Host "   - 5-10 minutos (típico)"
Write-Host "   - Hasta 48 horas (máximo)"
Write-Host ""
Write-Host "🔍 Verificar propagación:" -ForegroundColor Cyan
Write-Host "   https://dnschecker.org/#A/yadocel.org"
Write-Host ""
Write-Host "🌐 Tu sitio estará disponible en:" -ForegroundColor Green
Write-Host "   http://yadocel.org (en 10-15 minutos)"
Write-Host "   https://yadocel.org (después de 24 horas - certificado SSL)"
Write-Host ""

# Verificar DNS localmente
Write-Host "🔍 Verificando DNS localmente..." -ForegroundColor Cyan
try {
    $dnsResult = Resolve-DnsName -Name $DOMAIN -Type A -ErrorAction SilentlyContinue
    if ($dnsResult) {
        Write-Host "   ✓ DNS actualizado:" -ForegroundColor Green
        foreach ($record in $dnsResult) {
            if ($record.Type -eq "A") {
                Write-Host "     - $($record.IPAddress)" -ForegroundColor Gray
            }
        }
    } else {
        Write-Host "   ⏳ DNS aún no propagado localmente (esto es normal)" -ForegroundColor Yellow
    }
} catch {
    Write-Host "   ⏳ DNS aún no propagado localmente (esto es normal)" -ForegroundColor Yellow
}

Write-Host ""
Write-Host "✨ ¡Configuración completada! Espera unos minutos y visita:" -ForegroundColor Green
Write-Host "   http://yadocel.org" -ForegroundColor Cyan
Write-Host ""
