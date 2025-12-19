# 🚀 Instrucciones Rápidas - Publicar yadocel.org

## 📋 Lo que tienes:
- ✅ Sitio web completo y funcional
- ✅ Dominio yadocel.org comprado en Cloudflare
- ✅ Código listo para subir a GitHub

---

## 🎯 Pasos para Publicar (30 minutos)

### PASO 1: Crear Cuenta en GitHub (5 min)

1. Ve a: **https://github.com**
2. Click en **"Sign up"** (Registrarse)
3. Usa el email: `info@yadocel.com` o tu email personal
4. Elige un nombre de usuario (ejemplo: `yadocel-leon`)
5. Completa la verificación
6. Confirma tu email

---

### PASO 2: Crear Repositorio en GitHub (3 min)

1. Estando en GitHub, click en el **"+"** (arriba derecha) → **"New repository"**
2. Llena el formulario:
   ```
   Repository name: yadocel-website
   Description: Sitio web YADOCEL - Reparación de celulares León
   Public (debe estar en público)
   NO marques ningún checkbox
   ```
3. Click en **"Create repository"**
4. **NO CIERRES ESTA PÁGINA**, necesitarás la URL

---

### PASO 3: Subir tu Código (5 min)

#### Opción A - Línea de Comandos (Recomendado):

Abre PowerShell o Terminal y ejecuta:

```bash
# Navegar a tu proyecto
cd C:\Users\foro7\yadocel-website

# Verificar que estás en la carpeta correcta
dir

# Conectar con GitHub (reemplaza "TU-USUARIO" con tu usuario de GitHub)
git remote add origin https://github.com/TU-USUARIO/yadocel-website.git

# Subir el código
git push -u origin main
```

GitHub te pedirá usuario y contraseña. **Si la contraseña no funciona**, necesitas crear un **Personal Access Token**:

1. En GitHub: Click en tu foto → Settings
2. Scroll hasta abajo: Developer settings → Personal access tokens → Tokens (classic)
3. Generate new token → Marca "repo" → Generate
4. **COPIA EL TOKEN** (no lo verás de nuevo)
5. Usa el token como contraseña cuando hagas `git push`

#### Opción B - GitHub Desktop (Más Fácil):

1. Descarga GitHub Desktop: **https://desktop.github.com/**
2. Instala e inicia sesión
3. Click en "Add" → "Add existing repository"
4. Selecciona la carpeta: `C:\Users\foro7\yadocel-website`
5. Click en "Publish repository"
6. Asegúrate que NO esté marcado "Keep this code private"
7. Click en "Publish repository"

---

### PASO 4: Activar GitHub Pages (2 min)

1. En tu repositorio de GitHub, ve a **Settings** (arriba)
2. En el menú izquierdo, busca **"Pages"**
3. En "Source":
   - Branch: **main**
   - Folder: **/ (root)**
4. Click en **"Save"**
5. Espera 1-2 minutos

Tu sitio estará temporalmente en: `https://TU-USUARIO.github.io/yadocel-website/`

---

### PASO 5: Conectar tu Dominio yadocel.org (5 min)

#### En GitHub:

1. Estando en Settings → Pages
2. En "Custom domain", escribe: **yadocel.org**
3. Click en **"Save"**
4. **NO MARQUES** "Enforce HTTPS" todavía (lo harás después)

#### En Cloudflare:

1. Ve a: **https://dash.cloudflare.com**
2. Inicia sesión
3. Click en tu dominio: **yadocel.org**
4. Ve a **DNS** → **Records**

#### Agrega estos registros DNS:

**ELIMINA** cualquier registro A o CNAME existente para `@` o `www`

Luego **AGREGA** estos registros (click en "Add record"):

**Registro 1:**
```
Type: A
Name: @
IPv4 address: 185.199.108.153
Proxy status: DNS only (nube GRIS, no naranja)
TTL: Auto
```
Click en "Save"

**Registro 2:**
```
Type: A
Name: @
IPv4 address: 185.199.109.153
Proxy status: DNS only (GRIS)
TTL: Auto
```

**Registro 3:**
```
Type: A
Name: @
IPv4 address: 185.199.110.153
Proxy status: DNS only (GRIS)
TTL: Auto
```

**Registro 4:**
```
Type: A
Name: @
IPv4 address: 185.199.111.153
Proxy status: DNS only (GRIS)
TTL: Auto
```

**Registro 5 (para www):**
```
Type: CNAME
Name: www
Target: TU-USUARIO.github.io
Proxy status: DNS only (GRIS)
TTL: Auto
```

**⚠️ IMPORTANTE:** Reemplaza `TU-USUARIO` con tu nombre de usuario real de GitHub.

---

### PASO 6: Esperar y Verificar (10 min - 48 horas)

1. **Espera 10-15 minutos** mínimo
2. Prueba: **http://yadocel.org**
3. Si no funciona todavía, es normal. Puede tomar hasta 48 horas.

#### Verifica la propagación DNS:

Ve a: **https://dnschecker.org/**
- Escribe: `yadocel.org`
- Click en "Search"
- Deberías ver las IPs de GitHub (185.199.108.153, etc.)

---

### PASO 7: Activar HTTPS (Después de 24 horas)

Una vez que `http://yadocel.org` funcione:

1. Ve a GitHub → Settings → Pages
2. Marca la casilla: **"Enforce HTTPS"**
3. Ve a Cloudflare → SSL/TLS
4. Selecciona: **"Full"** o **"Full (strict)"**
5. Activa:
   - Always Use HTTPS: **ON**
   - Automatic HTTPS Rewrites: **ON**

---

## ✅ Checklist Final

- [ ] Cuenta de GitHub creada
- [ ] Repositorio creado en GitHub
- [ ] Código subido con `git push`
- [ ] GitHub Pages activado (Settings → Pages)
- [ ] Dominio personalizado configurado (yadocel.org)
- [ ] 4 registros A agregados en Cloudflare
- [ ] 1 registro CNAME para www agregado
- [ ] Todas las nubes en **GRIS** (DNS only)
- [ ] Esperado al menos 10 minutos
- [ ] Verificado en http://yadocel.org
- [ ] (Después de 24h) HTTPS activado

---

## 🎨 Próximas Personalizaciones

Una vez que el sitio esté online:

### 1. Agregar Logo
```bash
# Coloca tu logo en images/logo.png
# Luego actualiza y sube:
cd C:\Users\foro7\yadocel-website
git add images/logo.png
git commit -m "Add logo"
git push
```

### 2. Agregar Fotos
- Coloca fotos en `images/`
- Edita `index.html` para incluirlas
- Sube los cambios con git

### 3. Actualizar Colores
- Edita `css/styles.css`
- Busca la sección `:root` (línea 8)
- Cambia los colores
- Sube los cambios

---

## 🆘 Problemas Comunes

### "El repositorio no se encuentra"
→ Verifica que el repositorio sea **público** (no privado)

### "Permission denied"
→ Usa un Personal Access Token como contraseña

### "404 - No se encuentra"
→ Verifica que GitHub Pages esté activado (Settings → Pages)

### "El dominio no funciona"
→ Espera 24-48 horas para propagación DNS

### "HTTPS no funciona"
→ Espera 24 horas para el certificado SSL

---

## 📞 URLs Importantes

- **Tu sitio (temporal):** `https://TU-USUARIO.github.io/yadocel-website/`
- **Tu sitio (final):** `https://yadocel.org`
- **GitHub:** `https://github.com/TU-USUARIO/yadocel-website`
- **Cloudflare Dashboard:** `https://dash.cloudflare.com`

---

## 📚 Documentación Completa

Para más detalles, consulta:
- **CLOUDFLARE-GITHUB-SETUP.md** - Guía completa paso a paso
- **README.md** - Documentación del proyecto
- **QUICK-START.md** - Opciones de despliegue alternativas
- **CUSTOMIZATION-GUIDE.md** - Cómo personalizar el sitio

---

## 🎉 ¡Listo!

Una vez completados todos los pasos, tu sitio estará en:

### ✨ https://yadocel.org ✨

**YADOCEL** - Tu negocio online, 24/7

---

**Última actualización:** Diciembre 2024
