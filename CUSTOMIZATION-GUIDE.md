# Guía de Personalización YADOCEL

Esta guía te ayudará a personalizar rápidamente tu sitio web.

## 1. Agregar Logo

### Opción A: Crear Favicon desde SVG existente

El proyecto incluye un favicon SVG temporal. Para crear versiones PNG:

1. Ve a [RealFaviconGenerator](https://realfavicongenerator.net/)
2. Sube tu logo o usa el `images/favicon.svg` incluido
3. Descarga el paquete generado
4. Reemplaza las referencias en el `<head>` de `index.html`:

```html
<link rel="icon" type="image/png" sizes="32x32" href="images/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="images/favicon-16x16.png">
<link rel="apple-touch-icon" sizes="180x180" href="images/apple-touch-icon.png">
```

### Opción B: Logo en Navegación

Reemplaza el logo de texto con una imagen:

**Encuentra esto en index.html (línea ~32):**
```html
<div class="logo">
    <i class="fas fa-mobile-alt"></i>
    <span>YADOCEL</span>
</div>
```

**Reemplázalo con:**
```html
<div class="logo">
    <img src="images/logo.png" alt="YADOCEL" style="height: 50px;">
</div>
```

## 2. Personalizar Colores

Edita `css/styles.css` líneas 8-18:

```css
:root {
    /* Cambia estos valores según tu marca */
    --primary-color: #2563eb;      /* Azul - Color principal */
    --primary-dark: #1e40af;       /* Azul oscuro */
    --secondary-color: #10b981;    /* Verde - Color secundario */
    --accent-color: #f59e0b;       /* Amarillo - Acentos */

    /* Sugerencias de paletas:
       - Tecnología moderna: #2563eb, #10b981, #f59e0b
       - Profesional: #1e40af, #6b7280, #f97316
       - Vibrante: #ec4899, #8b5cf6, #f59e0b
    */
}
```

## 3. Actualizar Información de Contacto

### Números de Teléfono

Busca y reemplaza en `index.html`:
- `4772067575` → Tu nuevo número (sin espacios)
- `4775731618` → Otro número si aplica

### WhatsApp

Busca `524772067575` (con prefijo internacional 52) y reemplaza por tu número completo.

### Dirección

Busca "Portal Padilla #111" y reemplaza con tu dirección.

## 4. Configurar Google Maps

### Obtener URL del Mapa:

1. Abre [Google Maps](https://maps.google.com/)
2. Busca: "Portal Padilla 111, León, Guanajuato"
3. Click en "Compartir" → "Insertar un mapa"
4. Copia el código HTML
5. En `index.html` línea ~418, reemplaza el `src=""` del iframe

### Alternativa - Coordenadas exactas:

```html
<iframe
    src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3721.xxx!2d-101.xxx!3d21.xxx"
    ...
></iframe>
```

## 5. Agregar Galería de Fotos

### Paso 1: Preparar Imágenes

1. Coloca fotos en `images/gallery/`
2. Nombres recomendados: `trabajo-1.jpg`, `trabajo-2.jpg`, etc.
3. Optimiza las imágenes (máx 800px de ancho para web)

### Paso 2: Agregar Sección

Antes de la sección de contacto, agrega:

```html
<section id="galeria" class="gallery">
    <div class="container">
        <div class="section-header">
            <h2>Nuestros Trabajos</h2>
            <p>Mira algunos de nuestros trabajos realizados</p>
        </div>
        <div class="gallery-grid">
            <img src="images/gallery/trabajo-1.jpg" alt="Reparación de iPhone">
            <img src="images/gallery/trabajo-2.jpg" alt="Cambio de pantalla Samsung">
            <img src="images/gallery/trabajo-3.jpg" alt="Reparación de tablet">
            <img src="images/gallery/trabajo-4.jpg" alt="Accesorios disponibles">
            <img src="images/gallery/trabajo-5.jpg" alt="Local YADOCEL">
            <img src="images/gallery/trabajo-6.jpg" alt="Equipo de trabajo">
        </div>
    </div>
</section>
```

### Paso 3: Agregar Estilos

En `css/styles.css` al final:

```css
.gallery {
    padding: 80px 0;
    background-color: var(--white);
}

.gallery-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
    gap: 20px;
}

.gallery-grid img {
    width: 100%;
    height: 300px;
    object-fit: cover;
    border-radius: 12px;
    box-shadow: var(--shadow);
    transition: var(--transition);
    cursor: pointer;
}

.gallery-grid img:hover {
    transform: scale(1.05);
    box-shadow: var(--shadow-lg);
}
```

## 6. Agregar Precios

### Opción Simple - Lista de Precios

```html
<section id="precios" class="pricing">
    <div class="container">
        <div class="section-header">
            <h2>Precios de Reparación</h2>
            <p>Precios competitivos con garantía incluida</p>
        </div>

        <div class="pricing-table">
            <h3>Reparación de Celulares</h3>
            <table>
                <tr>
                    <td>Cambio de Pantalla iPhone</td>
                    <td>Desde $800</td>
                </tr>
                <tr>
                    <td>Cambio de Batería</td>
                    <td>Desde $350</td>
                </tr>
                <tr>
                    <td>Reparación de Puerto de Carga</td>
                    <td>Desde $400</td>
                </tr>
            </table>

            <p class="pricing-note">*Precios sujetos a modelo. Cotización sin costo.</p>
        </div>
    </div>
</section>
```

## 7. Conectar Redes Sociales

En el footer (`index.html` línea ~414):

```html
<div class="social-links">
    <a href="https://wa.me/524772067575" target="_blank">
        <i class="fab fa-whatsapp"></i>
    </a>
    <a href="https://facebook.com/yadocel.leon" target="_blank">
        <i class="fab fa-facebook"></i>
    </a>
    <a href="https://instagram.com/yadocel" target="_blank">
        <i class="fab fa-instagram"></i>
    </a>
    <a href="https://tiktok.com/@yadocel" target="_blank">
        <i class="fab fa-tiktok"></i>
    </a>
</div>
```

## 8. SEO: Personalizar Meta Tags

En `index.html` líneas 5-13:

```html
<meta name="description" content="YADOCEL - Reparación profesional de celulares, tablets y computadoras en León. Servicio rápido, garantizado y a los mejores precios.">

<meta name="keywords" content="reparación celulares león, arreglo iphone león, reparación samsung león, accesorios celulares, YADOCEL, centro león">

<meta property="og:title" content="YADOCEL - Reparación de Celulares en León">
<meta property="og:description" content="Expertos en reparación de dispositivos móviles. Servicio profesional en el centro de León.">
<meta property="og:image" content="https://tu-sitio.com/images/og-image.jpg">
<meta property="og:url" content="https://tu-sitio.com">
```

## 9. Agregar Testimonios

```html
<section class="testimonials">
    <div class="container">
        <div class="section-header">
            <h2>Lo Que Dicen Nuestros Clientes</h2>
        </div>
        <div class="testimonials-grid">
            <div class="testimonial-card">
                <div class="stars">★★★★★</div>
                <p>"Excelente servicio, mi iPhone quedó como nuevo. Muy recomendable."</p>
                <span class="author">- Juan Pérez</span>
            </div>
            <div class="testimonial-card">
                <div class="stars">★★★★★</div>
                <p>"Rápido y profesional. Arreglaron mi tablet el mismo día."</p>
                <span class="author">- María García</span>
            </div>
            <div class="testimonial-card">
                <div class="stars">★★★★★</div>
                <p>"Buenos precios y atención personalizada. Ya regresé varias veces."</p>
                <span class="author">- Carlos Rodríguez</span>
            </div>
        </div>
    </div>
</section>
```

## 10. Optimización de Imágenes

### Herramientas Recomendadas:

- **[TinyPNG](https://tinypng.com/)** - Compresión sin pérdida
- **[Squoosh](https://squoosh.app/)** - Editor online de Google
- **[JPEG-Optimizer](http://jpeg-optimizer.com/)** - Optimizar JPEGs

### Tamaños Recomendados:

- **Logo:** 200x200px (PNG con fondo transparente)
- **Favicon:** 512x512px
- **Galería:** 800x600px
- **Hero/Banner:** 1920x1080px
- **Iconos/Productos:** 400x400px

## 11. Configurar Dominio Personalizado

### En Netlify:

1. Ve a Site Settings → Domain Management
2. Click "Add custom domain"
3. Ingresa tu dominio (ej: `yadocel.com`)
4. Sigue las instrucciones para configurar DNS

### Configuración DNS:

```
Tipo: A
Nombre: @
Valor: 75.2.60.5

Tipo: CNAME
Nombre: www
Valor: tu-sitio.netlify.app
```

## 12. Agregar Botón de Llamada Directa

En el hero y otros lugares estratégicos:

```html
<a href="tel:4772067575" class="btn btn-secondary">
    <i class="fas fa-phone"></i> Llamar Ahora
</a>
```

## 13. Widget de Reseñas de Google

```html
<div class="google-reviews">
    <script src="https://static.elfsight.com/platform/platform.js"></script>
    <div class="elfsight-app-tu-widget-id"></div>
</div>
```

Obtén el widget en: [Elfsight Google Reviews](https://elfsight.com/google-reviews-widget/)

## 14. Agregar Google Analytics

Antes del `</head>`:

```html
<!-- Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-XXXXXXXXXX"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'G-XXXXXXXXXX');
</script>
```

## 15. Agregar Horarios Especiales

Si tienes horarios especiales por festivos:

```html
<div class="special-hours">
    <p><strong>Horario Especial:</strong> Cerrado 25 de diciembre y 1 de enero</p>
</div>
```

## Checklist de Personalización

- [ ] Logo agregado y optimizado
- [ ] Colores personalizados según marca
- [ ] Información de contacto actualizada
- [ ] Google Maps configurado correctamente
- [ ] Fotos del local y trabajos agregadas
- [ ] Redes sociales conectadas
- [ ] Meta tags SEO personalizados
- [ ] Testimonios agregados
- [ ] Precios actualizados (si aplica)
- [ ] Dominio personalizado configurado
- [ ] Google Analytics instalado
- [ ] Sitio probado en móvil y desktop

## ¿Necesitas Ayuda?

Si tienes dudas sobre alguna personalización, revisa:
- `README.md` - Documentación general
- `index.html` - Comentarios en el código
- `css/styles.css` - Documentación de estilos

---

**¡Tu sitio está listo para brillar!** 🚀
