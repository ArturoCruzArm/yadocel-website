# Guía: Conectar yadocel.org (Cloudflare) con GitHub Pages

## Resumen
Esta guía te ayudará a conectar tu dominio `yadocel.org` comprado en Cloudflare con tu sitio alojado en GitHub Pages.

---

## Paso 1: Subir el Código a GitHub

### Crear el Repositorio en GitHub:

1. Ve a [github.com](https://github.com) e inicia sesión (o crea una cuenta)
2. Click en el botón **"+"** → **"New repository"**
3. Configura el repositorio:
   - **Repository name:** `yadocel-website` (o `yadocel.org`)
   - **Description:** "Sitio web oficial de YADOCEL - Reparación de celulares en León"
   - **Visibility:** Public (debe ser público para GitHub Pages gratis)
   - NO marques "Add a README file" (ya tienes uno)
4. Click en **"Create repository"**

### Subir tu Código:

En tu terminal/PowerShell, navega a la carpeta del proyecto y ejecuta:

```bash
# Navegar a la carpeta del proyecto
cd C:\Users\foro7\yadocel-website

# Verificar el repositorio git
git status

# Agregar el repositorio remoto (reemplaza TU-USUARIO con tu usuario de GitHub)
git remote add origin https://github.com/TU-USUARIO/yadocel-website.git

# Cambiar a rama main
git branch -M main

# Subir el código
git push -u origin main
```

**Nota:** GitHub te pedirá autenticación. Usa tu usuario y contraseña, o mejor aún, un Personal Access Token.

---

## Paso 2: Activar GitHub Pages

1. En tu repositorio de GitHub, ve a **Settings** (Configuración)
2. En el menú lateral, busca **Pages** (bajo "Code and automation")
3. En "Build and deployment":
   - **Source:** Deploy from a branch
   - **Branch:** Selecciona `main` y carpeta `/ (root)`
   - Click en **Save**
4. GitHub comenzará a construir tu sitio
5. Después de 1-2 minutos, verás un mensaje: "Your site is live at `https://TU-USUARIO.github.io/yadocel-website/`"

### Crear archivo CNAME:

Para que GitHub Pages reconozca tu dominio personalizado, crea un archivo `CNAME`:

```bash
cd C:\Users\foro7\yadocel-website
echo yadocel.org > CNAME
git add CNAME
git commit -m "Add CNAME for custom domain"
git push
```

---

## Paso 3: Configurar DNS en Cloudflare

### Agregar Registros DNS:

1. Ve a [dash.cloudflare.com](https://dash.cloudflare.com)
2. Selecciona tu dominio: **yadocel.org**
3. Ve a **DNS** → **Records**
4. Elimina cualquier registro A o CNAME existente para `@` y `www`

### Agregar los siguientes registros:

#### Para el dominio principal (yadocel.org):

**Registros A** - Agrega estos 4 registros:

```
Type: A
Name: @
IPv4 address: 185.199.108.153
TTL: Auto
Proxy status: DNS only (nube gris, NO naranja)
```

```
Type: A
Name: @
IPv4 address: 185.199.109.153
TTL: Auto
Proxy status: DNS only (nube gris)
```

```
Type: A
Name: @
IPv4 address: 185.199.110.153
TTL: Auto
Proxy status: DNS only (nube gris)
```

```
Type: A
Name: @
IPv4 address: 185.199.111.153
TTL: Auto
Proxy status: DNS only (nube gris)
```

#### Para www.yadocel.org:

**Registro CNAME:**

```
Type: CNAME
Name: www
Target: TU-USUARIO.github.io
TTL: Auto
Proxy status: DNS only (nube gris)
```

**IMPORTANTE:** Reemplaza `TU-USUARIO` con tu nombre de usuario real de GitHub.

### Ejemplo de cómo se verá:

```
Type    Name    Content                   Proxy Status
A       @       185.199.108.153          DNS only
A       @       185.199.109.153          DNS only
A       @       185.199.110.153          DNS only
A       @       185.199.111.153          DNS only
CNAME   www     tu-usuario.github.io     DNS only
```

---

## Paso 4: Configurar Dominio Personalizado en GitHub

1. Vuelve a tu repositorio en GitHub
2. Ve a **Settings** → **Pages**
3. En "Custom domain", escribe: `yadocel.org`
4. Click en **Save**
5. GitHub verificará el dominio (puede tomar 10-15 minutos)
6. Una vez verificado, marca la casilla **"Enforce HTTPS"** (forzar HTTPS)

---

## Paso 5: Activar Proxy de Cloudflare (Opcional pero Recomendado)

Una vez que tu sitio esté funcionando (después de 24-48 horas), puedes activar el proxy de Cloudflare para mayor velocidad y seguridad:

1. En Cloudflare → DNS → Records
2. Click en la nube gris junto a cada registro para volverla **naranja** (Proxied)
3. Esto activará:
   - CDN (sitio más rápido)
   - Protección DDoS
   - SSL automático
   - Caché optimizado

### Configuración SSL/TLS en Cloudflare:

1. Ve a **SSL/TLS** en el menú de Cloudflare
2. Selecciona modo: **"Full"** o **"Full (strict)"**
3. Activa:
   - Always Use HTTPS: ON
   - Automatic HTTPS Rewrites: ON

---

## Paso 6: Optimizaciones de Cloudflare

### Cache:

1. Ve a **Caching** → **Configuration**
2. Activa **"Development Mode"** temporalmente mientras haces cambios
3. Desactívalo cuando termines

### Reglas de Página (Page Rules):

Crea una regla para optimizar el rendimiento:

1. Ve a **Rules** → **Page Rules**
2. Click en "Create Page Rule"
3. URL: `yadocel.org/*`
4. Configuración:
   - Cache Level: Standard
   - Browser Cache TTL: 4 hours
   - Always Online: ON
5. Save

---

## Verificación y Testing

### Verificar que todo funciona:

1. **Verifica DNS** (puede tomar hasta 48 horas):
   ```bash
   nslookup yadocel.org
   ```
   Debe mostrar las IPs de GitHub (185.199.108.153, etc.)

2. **Verifica www**:
   ```bash
   nslookup www.yadocel.org
   ```
   Debe mostrar tu-usuario.github.io

3. **Prueba en el navegador**:
   - http://yadocel.org
   - https://yadocel.org
   - http://www.yadocel.org
   - https://www.yadocel.org

   Todos deben redirigir a: **https://yadocel.org**

### Herramientas de Verificación:

- [DNS Checker](https://dnschecker.org/) - Verifica propagación DNS
- [What's My DNS](https://www.whatsmydns.net/) - Verifica DNS global
- [SSL Labs](https://www.ssllabs.com/ssltest/) - Verifica SSL después de activar

---

## Tiempos de Propagación

- **GitHub Pages:** 10-15 minutos
- **DNS de Cloudflare:** 5-10 minutos
- **Propagación global:** 24-48 horas (aunque usualmente es más rápido)

**Durante este tiempo, el sitio puede no estar accesible o mostrar errores. Es normal.**

---

## Solución de Problemas Comunes

### Error: "Improper configured"
- Verifica que los registros DNS estén correctos
- Espera 15-30 minutos para propagación

### Error 404 o página en blanco
- Verifica que el archivo CNAME esté en la raíz del repositorio
- Verifica que GitHub Pages esté activado
- Revisa los archivos en el repositorio

### El sitio muestra código HTML
- GitHub Pages no está activado correctamente
- El branch seleccionado no es correcto

### HTTPS no funciona
- Espera 24 horas para que se genere el certificado
- Verifica que "Enforce HTTPS" esté marcado en GitHub

### www no funciona
- Verifica el registro CNAME en Cloudflare
- Espera propagación DNS

---

## Actualizar el Sitio

Después de hacer cambios en tu código:

```bash
cd C:\Users\foro7\yadocel-website
git add .
git commit -m "Descripción de los cambios"
git push
```

El sitio se actualizará automáticamente en 1-2 minutos.

---

## Checklist Final ✅

- [ ] Repositorio creado en GitHub
- [ ] Código subido con `git push`
- [ ] GitHub Pages activado
- [ ] Archivo CNAME creado
- [ ] 4 registros A agregados en Cloudflare
- [ ] Registro CNAME para www agregado
- [ ] Proxy status en "DNS only" (gris) inicialmente
- [ ] Dominio personalizado configurado en GitHub
- [ ] HTTPS forzado en GitHub
- [ ] Sitio accesible en yadocel.org
- [ ] www.yadocel.org redirige correctamente
- [ ] SSL/TLS configurado en Cloudflare
- [ ] Optimizaciones de Cloudflare aplicadas

---

## Contactos y Recursos

- **GitHub Docs:** [docs.github.com/pages](https://docs.github.com/pages)
- **Cloudflare Docs:** [developers.cloudflare.com](https://developers.cloudflare.com)
- **DNS Checker:** [dnschecker.org](https://dnschecker.org)

---

## Próximos Pasos

Una vez que tu sitio esté online:

1. **Verifica en Google Search Console**
2. **Agrega Google Analytics**
3. **Crea sitemap.xml**
4. **Registra en Google My Business**
5. **Comparte en redes sociales**

---

**¡Tu sitio estará en línea en yadocel.org dentro de 24-48 horas!** 🎉

Si tienes problemas, revisa la sección de "Solución de Problemas" o contacta soporte.
