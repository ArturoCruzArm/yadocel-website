# Configurar yadocel.org con API de Cloudflare

## Paso 1: Obtener API Token de Cloudflare

1. Ve a: **https://dash.cloudflare.com/profile/api-tokens**
2. Click en **"Create Token"**
3. Busca el template **"Edit zone DNS"** y click en **"Use template"**
4. Configuración:
   - **Token name:** GitHub Pages DNS
   - **Permissions:** Zone - DNS - Edit
   - **Zone Resources:** Include - Specific zone - **yadocel.org**
5. Click en **"Continue to summary"**
6. Click en **"Create Token"**
7. **¡COPIA EL TOKEN!** (no podrás verlo de nuevo)

Ejemplo de token: `abc123XYZ...`

## Paso 2: Obtener Zone ID

1. Ve a: **https://dash.cloudflare.com**
2. Click en tu dominio: **yadocel.org**
3. En el panel derecho (Overview), busca **"Zone ID"**
4. Cópialo

Ejemplo de Zone ID: `1234567890abcdef...`

## Paso 3: Ejecutar el Script

### Opción A: Bash/Git Bash (Recomendado)

```bash
# Navegar a la carpeta
cd C:/Users/foro7/yadocel-website

# Configurar las variables
export CLOUDFLARE_API_TOKEN="tu-token-aqui"
export CLOUDFLARE_ZONE_ID="tu-zone-id-aqui"

# Dar permisos de ejecución
chmod +x setup-cloudflare.sh

# Ejecutar el script
./setup-cloudflare.sh
```

### Opción B: PowerShell

```powershell
# Navegar a la carpeta
cd C:\Users\foro7\yadocel-website

# Configurar las variables
$env:CLOUDFLARE_API_TOKEN="tu-token-aqui"
$env:CLOUDFLARE_ZONE_ID="tu-zone-id-aqui"

# Ejecutar con bash
bash setup-cloudflare.sh
```

## ¿Qué hace el script?

El script automáticamente:
1. ✅ Elimina registros DNS antiguos
2. ✅ Agrega 4 registros A apuntando a GitHub Pages:
   - @ → 185.199.108.153
   - @ → 185.199.109.153
   - @ → 185.199.110.153
   - @ → 185.199.111.153
3. ✅ Agrega registro CNAME para www:
   - www → ArturoCruzArm.github.io
4. ✅ Configura todos como "DNS only" (sin proxy)

## Resultado Esperado

```
🌐 Configurando DNS de Cloudflare para yadocel.org

✓ API Token configurado
✓ Zone ID configurado
✓ Dominio: yadocel.org

🔍 Buscando registros DNS existentes...
🗑️  Eliminando registros antiguos...
   ✓ Eliminado registro A antiguo

➕ Agregando nuevos registros DNS...
   ✓ Registro A agregado: @ → 185.199.108.153
   ✓ Registro A agregado: @ → 185.199.109.153
   ✓ Registro A agregado: @ → 185.199.110.153
   ✓ Registro A agregado: @ → 185.199.111.153
   ✓ Registro CNAME agregado: www → ArturoCruzArm.github.io

✅ Configuración DNS completada!
```

## Verificación

### 1. Verificar DNS inmediatamente:

```bash
# Linux/Mac/Git Bash
nslookup yadocel.org

# Debe mostrar las IPs de GitHub (185.199.108.153, etc.)
```

### 2. Verificar propagación global:

Ve a: **https://dnschecker.org/**
- Ingresa: `yadocel.org`
- Tipo: `A`
- Click en "Search"

Deberías ver las 4 IPs de GitHub en verde en la mayoría de ubicaciones.

### 3. Probar el sitio:

Después de 10-15 minutos:
- **http://yadocel.org** ← Debe funcionar

Después de 24 horas (certificado SSL):
- **https://yadocel.org** ← HTTPS habilitado

## Activar HTTPS (Después de 24 horas)

Una vez que http://yadocel.org funcione:

```bash
cd C:/Users/foro7/yadocel-website

# Forzar HTTPS en GitHub Pages
gh api repos/ArturoCruzArm/yadocel-website/pages \
  -X PUT \
  -F https_enforced=true
```

Luego en Cloudflare:
1. Ve a **SSL/TLS**
2. Modo: **Full** o **Full (strict)**
3. Activa **Always Use HTTPS**

## Activar Proxy de Cloudflare (Opcional)

Después de verificar que todo funciona (24-48 horas), puedes activar el proxy:

```bash
# Esto requiere actualizar los registros para usar proxied: true
# Por ahora, hazlo manualmente en el dashboard de Cloudflare
# (Click en la nube gris para volverla naranja)
```

Beneficios del proxy:
- ⚡ CDN (más rápido)
- 🛡️ Protección DDoS
- 📊 Analytics
- 🗜️ Compresión automática

## Solución de Problemas

### "Permission denied"
→ Verifica que el API Token tenga permisos de "Zone - DNS - Edit"

### "Zone not found"
→ Verifica el Zone ID (debe ser del dominio yadocel.org)

### "jq: command not found"
→ Instala jq:
```bash
# Windows (con Chocolatey)
choco install jq

# O descarga desde: https://stedolan.github.io/jq/download/
```

### El sitio no funciona después de 1 hora
→ Verifica DNS con: https://dnschecker.org/
→ Puede tomar hasta 48 horas en casos raros

### Error 522 en Cloudflare
→ DNS aún no ha propagado, espera más tiempo

## Resumen de Comandos

```bash
# Configuración completa en 3 pasos:
cd C:/Users/foro7/yadocel-website
export CLOUDFLARE_API_TOKEN="tu-token"
export CLOUDFLARE_ZONE_ID="tu-zone-id"
./setup-cloudflare.sh
```

¡Listo! Tu sitio estará en **yadocel.org** 🎉
