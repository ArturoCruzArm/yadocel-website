# YADOCEL - Sitio Web Profesional

Sitio web moderno y responsive para YADOCEL, negocio de reparación de celulares, tablets y computadoras ubicado en León, Guanajuato.

## Información del Negocio

- **Nombre:** YADOCEL
- **Dirección:** Portal Padilla #111, Zona Centro, Zona Peatonal, León, Gto.
- **Teléfonos:**
  - 477 206 7575 (Eduardo Yado)
  - 477 573 1618 (Danae Arriaga)
- **WhatsApp:** 477 206 7575
- **Horarios:**
  - Lunes a Sábado: 10:00 AM - 8:30 PM
  - Domingo: 10:00 AM - 6:00 PM

## Características del Sitio

### Diseño y Funcionalidades

- **Diseño Responsive:** Adaptable a todos los dispositivos (móvil, tablet, desktop)
- **Navegación Intuitiva:** Menú fijo con navegación suave
- **SEO Optimizado:** Meta tags y estructura optimizada para buscadores
- **Integración con WhatsApp:** Botón flotante y formulario que redirige a WhatsApp
- **Google Maps:** Mapa interactivo con la ubicación del negocio
- **Sección de Servicios:** Detalle de reparaciones de celulares, tablets y computadoras
- **Catálogo de Productos:** Showcase de accesorios disponibles
- **Formulario de Contacto:** Envío directo a WhatsApp con información organizada
- **Animaciones Modernas:** Efectos visuales al hacer scroll
- **Botón de Volver Arriba:** Navegación rápida en páginas largas

### Secciones Incluidas

1. **Hero/Inicio:** Presentación impactante con llamados a la acción
2. **Servicios:** Detalle de reparaciones y servicios ofrecidos
3. **Productos:** Catálogo de accesorios
4. **Nosotros:** Ventajas competitivas y diferenciadores
5. **Contacto:** Información completa, formulario y mapa
6. **Footer:** Links rápidos y redes sociales

## Estructura de Archivos

```
yadocel-website/
│
├── index.html          # Página principal
├── css/
│   └── styles.css      # Estilos CSS
├── js/
│   └── main.js         # JavaScript para interactividad
├── images/             # Carpeta para imágenes
│   └── (agregar logo, fotos del local, etc.)
└── README.md           # Este archivo
```

## Instalación y Despliegue

### Opción 1: Despliegue en GitHub Pages (Gratis)

1. **Crear Repositorio en GitHub:**
   ```bash
   git init
   git add .
   git commit -m "Initial commit: YADOCEL website"
   git branch -M main
   git remote add origin https://github.com/TU-USUARIO/yadocel-website.git
   git push -u origin main
   ```

2. **Activar GitHub Pages:**
   - Ve a Settings > Pages
   - Selecciona "main" branch y carpeta "/ (root)"
   - Click en "Save"
   - Tu sitio estará en: `https://TU-USUARIO.github.io/yadocel-website/`

### Opción 2: Despliegue en Netlify (Gratis y Recomendado)

1. **Subir a GitHub** (como en Opción 1)

2. **Desplegar en Netlify:**
   - Ve a [netlify.com](https://www.netlify.com/)
   - Click en "Add new site" > "Import an existing project"
   - Conecta tu repositorio de GitHub
   - Netlify detectará automáticamente la configuración
   - Click en "Deploy site"
   - Obtendrás un dominio gratis: `nombre-aleatorio.netlify.app`
   - Puedes personalizar el subdominio o conectar un dominio propio

### Opción 3: Despliegue en Vercel (Gratis)

1. **Subir a GitHub** (como en Opción 1)

2. **Desplegar en Vercel:**
   - Ve a [vercel.com](https://vercel.com/)
   - Click en "Add New" > "Project"
   - Importa tu repositorio de GitHub
   - Click en "Deploy"
   - Tu sitio estará listo en segundos

### Opción 4: Hosting Tradicional

1. **Descarga los archivos** del repositorio
2. **Sube vía FTP** a tu hosting:
   - Todos los archivos van a la carpeta `public_html` o `www`
3. **Accede** a tu dominio

## Personalización

### Cambiar Colores

Edita las variables CSS en `css/styles.css` (líneas 8-18):

```css
:root {
    --primary-color: #2563eb;      /* Color principal */
    --secondary-color: #10b981;    /* Color secundario */
    --accent-color: #f59e0b;       /* Color de acento */
    /* ... */
}
```

### Agregar Logo

1. Coloca tu logo en la carpeta `images/` con el nombre `logo.png`
2. En `index.html`, busca la línea 32 y reemplaza:

```html
<div class="logo">
    <img src="images/logo.png" alt="YADOCEL Logo" style="height: 40px;">
    <span>YADOCEL</span>
</div>
```

### Agregar Fotos

1. Coloca tus fotos en la carpeta `images/`
2. Para agregar una galería, añade esta sección antes de contacto:

```html
<section class="gallery">
    <div class="container">
        <div class="section-header">
            <h2>Nuestros Trabajos</h2>
        </div>
        <div class="gallery-grid">
            <img src="images/foto1.jpg" alt="Reparación 1">
            <img src="images/foto2.jpg" alt="Reparación 2">
            <!-- Más imágenes -->
        </div>
    </div>
</section>
```

### Actualizar Ubicación en Mapa

En `index.html`, línea 418, reemplaza la URL del iframe con la de tu ubicación:

1. Abre [Google Maps](https://maps.google.com/)
2. Busca tu dirección: "Portal Padilla 111, León"
3. Click en "Compartir" > "Insertar un mapa"
4. Copia el código y reemplaza el src del iframe

### Agregar Precios

Si quieres mostrar precios, agrega una nueva sección:

```html
<section id="precios" class="pricing">
    <div class="container">
        <div class="section-header">
            <h2>Precios</h2>
        </div>
        <div class="pricing-grid">
            <div class="price-card">
                <h3>Cambio de Pantalla iPhone</h3>
                <p class="price">Desde $800</p>
            </div>
            <!-- Más precios -->
        </div>
    </div>
</section>
```

### Conectar Redes Sociales

En `index.html`, busca la sección de redes sociales (línea 414) y actualiza los enlaces:

```html
<div class="social-links">
    <a href="https://wa.me/524772067575" target="_blank">
        <i class="fab fa-whatsapp"></i>
    </a>
    <a href="https://www.facebook.com/TU-PAGINA" target="_blank">
        <i class="fab fa-facebook"></i>
    </a>
    <a href="https://www.instagram.com/TU-PERFIL" target="_blank">
        <i class="fab fa-instagram"></i>
    </a>
</div>
```

## Optimizaciones SEO

### Configurar Google Search Console

1. Ve a [Google Search Console](https://search.google.com/search-console/)
2. Agrega tu sitio
3. Verifica la propiedad
4. Envía el sitemap

### Configurar Google My Business

1. Crea/reclama tu perfil en [Google My Business](https://business.google.com/)
2. Completa toda la información
3. Agrega fotos de tu negocio
4. Publica actualizaciones regularmente

### Meta Tags para Redes Sociales

Ya incluidos en el HTML (líneas 10-13). Personaliza según necesites.

## Mantenimiento

### Actualizar Información

- **Teléfonos:** Busca y reemplaza los números en `index.html`
- **Horarios:** Actualiza en la sección de contacto
- **Servicios:** Edita las tarjetas de servicio en la sección correspondiente

### Agregar Testimonios

Crea una nueva sección antes de contacto:

```html
<section class="testimonials">
    <div class="container">
        <div class="section-header">
            <h2>Lo Que Dicen Nuestros Clientes</h2>
        </div>
        <div class="testimonial-card">
            <p>"Excelente servicio, rápido y profesional"</p>
            <span>- Juan Pérez</span>
        </div>
    </div>
</section>
```

## Soporte y Actualizaciones

### Hacer Cambios

1. **Edita los archivos** localmente
2. **Prueba** en tu navegador abriendo `index.html`
3. **Sube los cambios:**
   ```bash
   git add .
   git commit -m "Descripción del cambio"
   git push
   ```
4. Los cambios se actualizarán automáticamente en tu hosting

### Mejoras Futuras Sugeridas

- [ ] Sistema de citas online
- [ ] Catálogo de productos con carrito de compras
- [ ] Blog con tips de mantenimiento
- [ ] Sistema de garantías online
- [ ] Chat en vivo
- [ ] Galería de trabajos realizados
- [ ] Sistema de reseñas
- [ ] Versión PWA (Progressive Web App)

## Tecnologías Utilizadas

- **HTML5:** Estructura semántica
- **CSS3:** Diseño moderno con Flexbox y Grid
- **JavaScript (Vanilla):** Sin dependencias externas
- **Font Awesome:** Iconos
- **Google Fonts:** Tipografía Poppins

## Performance

- Carga rápida (< 2 segundos)
- Optimizado para móviles (Mobile-first)
- Compatible con todos los navegadores modernos
- Ligero (< 100KB sin imágenes)

## Seguridad

- No hay formularios que envíen datos a servidor
- Todo se procesa en el cliente
- Integración segura con WhatsApp
- No se almacenan datos personales

## Licencia

Este sitio web fue desarrollado específicamente para YADOCEL. Todos los derechos reservados.

## Contacto para Soporte Técnico

Para soporte técnico o actualizaciones del sitio web, contacta al desarrollador.

---

**Hecho con ❤️ para YADOCEL - León, Guanajuato**

**Última actualización:** Diciembre 2024
