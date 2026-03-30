# Inicio Rápido - YADOCEL Website

## Opción 1: Despliegue Inmediato en Netlify (Recomendado) ⚡

### Paso 1: Crear Cuenta en GitHub
1. Ve a [github.com](https://github.com) y crea una cuenta gratis
2. Confirma tu email

### Paso 2: Subir el Código
```bash
# En tu terminal, navega a la carpeta del proyecto
cd /ruta/a/yadocel-website

# Si no está configurado git, ejecuta:
git remote add origin https://github.com/TU-USUARIO/yadocel-website.git
git branch -M main
git push -u origin main
```

O usa GitHub Desktop:
1. Descarga [GitHub Desktop](https://desktop.github.com/)
2. Arrastra la carpeta `yadocel-website`
3. Click en "Publish repository"

### Paso 3: Desplegar en Netlify
1. Ve a [netlify.com](https://netlify.com) y regístrate con GitHub
2. Click en "Add new site" → "Import an existing project"
3. Selecciona tu repositorio `yadocel-website`
4. Click en "Deploy site"
5. ¡Listo! Tu sitio estará en línea en 1-2 minutos

Tu URL será algo como: `yadocel-leon.netlify.app`

### Paso 4: Personalizar Dominio (Opcional)
1. En Netlify: Site settings → Domain management
2. Click "Add custom domain"
3. Compra un dominio o conecta uno existente
4. Ejemplo: `yadocel.com` o `yadocelreparaciones.com`

---

## Opción 2: Despliegue en Vercel 🚀

1. Ve a [vercel.com](https://vercel.com)
2. Regístrate con GitHub
3. Click "Add New" → "Project"
4. Importa tu repositorio
5. Click "Deploy"
6. ¡Listo en 30 segundos!

---

## Opción 3: GitHub Pages (Gratis y Simple) 📄

```bash
# Subir a GitHub
git remote add origin https://github.com/TU-USUARIO/yadocel-website.git
git branch -M main
git push -u origin main
```

Luego en GitHub:
1. Ve a Settings → Pages
2. Source: "main" branch
3. Folder: "/ (root)"
4. Save

Tu sitio estará en: `https://TU-USUARIO.github.io/yadocel-website/`

---

## Opción 4: Hosting Tradicional 🖥️

Si ya tienes hosting (GoDaddy, Hostinger, etc.):

1. Descarga todos los archivos del proyecto
2. Conéctate por FTP:
   - Host: ftp.tudominio.com
   - Usuario: tu usuario
   - Contraseña: tu contraseña
3. Sube todos los archivos a `public_html/`
4. Accede a `tudominio.com`

---

## Primeras Personalizaciones 🎨

Después de desplegar, personaliza estos elementos clave:

### 1. Información de Contacto
En `index.html`, busca y reemplaza:
- Números de teléfono
- Dirección
- Horarios

### 2. Colores de la Marca
En `css/styles.css` línea 8:
```css
--primary-color: #2563eb;  /* Tu color principal */
```

### 3. Agregar Logo
1. Coloca tu logo en `images/logo.png`
2. Actualiza la referencia en `index.html`

### 4. Google Maps
Actualiza la URL del mapa con tu ubicación exacta

---

## Comandos Git Útiles 💻

### Hacer cambios y actualizar el sitio:
```bash
# Ver cambios
git status

# Guardar cambios
git add .
git commit -m "Descripción de los cambios"

# Subir a GitHub (se actualizará automáticamente)
git push
```

### Descargar cambios:
```bash
git pull
```

---

## Checklist Post-Despliegue ✅

- [ ] Sitio accesible desde la URL
- [ ] Se ve bien en móvil y desktop
- [ ] WhatsApp funciona correctamente
- [ ] Todos los enlaces funcionan
- [ ] Formulario redirige a WhatsApp
- [ ] Mapa muestra la ubicación correcta
- [ ] Números de teléfono correctos
- [ ] Colores de marca aplicados
- [ ] Logo visible (si aplica)

---

## Próximos Pasos 🚀

1. **SEO:**
   - Registra tu sitio en [Google Search Console](https://search.google.com/search-console/)
   - Crea perfil en [Google My Business](https://business.google.com/)

2. **Analíticas:**
   - Instala [Google Analytics](https://analytics.google.com/)
   - Monitorea visitas y comportamiento

3. **Redes Sociales:**
   - Comparte la URL en Facebook, Instagram
   - Agrega el link a tu bio de redes sociales
   - Publica contenido regularmente

4. **Contenido:**
   - Agrega fotos de tus trabajos
   - Recolecta testimonios de clientes
   - Actualiza precios y servicios

5. **Marketing:**
   - Tarjetas de presentación con la URL
   - Código QR para el sitio
   - Promociones exclusivas en el sitio

---

## ¿Problemas? 🆘

### El sitio no se ve bien en móvil
- Abre las herramientas de desarrollador (F12)
- Activa el modo responsive
- Verifica el diseño

### Los cambios no se reflejan
- Borra el caché del navegador (Ctrl + F5)
- En Netlify/Vercel, espera 1-2 minutos

### Error al subir a GitHub
```bash
# Verifica el repositorio remoto
git remote -v

# Si no está configurado:
git remote add origin URL-DE-TU-REPO
```

---

## Recursos Adicionales 📚

- [README.md](README.md) - Documentación completa
- [CUSTOMIZATION-GUIDE.md](CUSTOMIZATION-GUIDE.md) - Guía de personalización detallada
- [YouTube: Cómo usar GitHub](https://www.youtube.com/results?search_query=github+tutorial+español)
- [YouTube: Desplegar en Netlify](https://www.youtube.com/results?search_query=netlify+tutorial+español)

---

## Soporte 💬

Para dudas técnicas o actualizaciones del sitio, contacta al desarrollador.

**¡Tu sitio está listo para recibir clientes!** 🎉

---

**YADOCEL** - Portal Padilla #111, León, Gto.
📱 477 206 7575 | 477 573 1618
