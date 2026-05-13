/* ===================================
   YADOCEL — Main JavaScript
   =================================== */

document.addEventListener('DOMContentLoaded', function () {

    // ================================
    // Mobile Menu
    // ================================
    const menuToggle = document.getElementById('menuToggle');
    const navMenu = document.getElementById('navMenu');

    if (menuToggle && navMenu) {
        menuToggle.addEventListener('click', function () {
            this.classList.toggle('active');
            navMenu.classList.toggle('active');
        });

        navMenu.querySelectorAll('a').forEach(link => {
            link.addEventListener('click', () => {
                menuToggle.classList.remove('active');
                navMenu.classList.remove('active');
            });
        });

        document.addEventListener('click', function (e) {
            if (!navMenu.contains(e.target) && !menuToggle.contains(e.target) && navMenu.classList.contains('active')) {
                menuToggle.classList.remove('active');
                navMenu.classList.remove('active');
            }
        });
    }

    // ================================
    // Header scroll effect
    // ================================
    const header = document.getElementById('header');
    window.addEventListener('scroll', function () {
        if (window.scrollY > 50) {
            header.classList.add('scrolled');
        } else {
            header.classList.remove('scrolled');
        }
    });

    // ================================
    // Hero Slider
    // ================================
    const slides = document.querySelectorAll('.hero-slide');
    const dots = document.querySelectorAll('.slider-dot');
    let currentSlide = 0;
    let slideInterval;

    function goToSlide(index) {
        slides[currentSlide].classList.remove('active');
        dots[currentSlide].classList.remove('active');
        currentSlide = index;
        slides[currentSlide].classList.add('active');
        dots[currentSlide].classList.add('active');
    }

    function nextSlide() {
        goToSlide((currentSlide + 1) % slides.length);
    }

    function startSlider() {
        slideInterval = setInterval(nextSlide, 6000);
    }

    dots.forEach(dot => {
        dot.addEventListener('click', function () {
            clearInterval(slideInterval);
            goToSlide(parseInt(this.dataset.slide));
            startSlider();
        });
    });

    if (slides.length > 1) startSlider();

    // ================================
    // Scroll Reveal
    // ================================
    const revealElements = document.querySelectorAll('.reveal-up');

    const revealObserver = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                const delay = entry.target.style.animationDelay || '0s';
                const ms = parseFloat(delay) * 1000;
                setTimeout(() => {
                    entry.target.classList.add('revealed');
                }, ms);
                revealObserver.unobserve(entry.target);
            }
        });
    }, {
        threshold: 0.1,
        rootMargin: '0px 0px -40px 0px'
    });

    revealElements.forEach(el => revealObserver.observe(el));

    // ================================
    // Back to Top
    // ================================
    const backToTop = document.getElementById('backToTop');

    window.addEventListener('scroll', function () {
        if (window.scrollY > 400) {
            backToTop.classList.add('show');
        } else {
            backToTop.classList.remove('show');
        }
    });

    backToTop.addEventListener('click', function () {
        window.scrollTo({ top: 0, behavior: 'smooth' });
    });

    // ================================
    // Smooth Scroll
    // ================================
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            e.preventDefault();
            const target = this.getAttribute('href');
            if (target === '#') return;
            const el = document.querySelector(target);
            if (el) {
                const offset = header.offsetHeight + 10;
                window.scrollTo({
                    top: el.offsetTop - offset,
                    behavior: 'smooth'
                });
            }
        });
    });

    // ================================
    // Active Navigation
    // ================================
    const sections = document.querySelectorAll('section[id]');

    function updateNav() {
        const scrollPos = window.scrollY + 120;
        sections.forEach(section => {
            const top = section.offsetTop;
            const height = section.offsetHeight;
            const id = section.getAttribute('id');
            const link = document.querySelector(`.nav-menu a[href="#${id}"]`);
            if (link) {
                if (scrollPos >= top && scrollPos < top + height) {
                    document.querySelectorAll('.nav-menu a').forEach(l => l.classList.remove('active'));
                    link.classList.add('active');
                }
            }
        });
    }

    window.addEventListener('scroll', updateNav);

    // ================================
    // Contact Form → WhatsApp
    // ================================
    const contactForm = document.getElementById('contactForm');

    if (contactForm) {
        contactForm.addEventListener('submit', function (e) {
            e.preventDefault();

            const name = document.getElementById('name').value;
            const phone = document.getElementById('phone').value;
            const email = document.getElementById('email').value;
            const service = document.getElementById('service');
            const serviceName = service.options[service.selectedIndex].text;
            const message = document.getElementById('message').value;

            if (!name || !phone || !service.value || !message) {
                showNotification('Completa todos los campos requeridos', 'error');
                return;
            }

            const text = encodeURIComponent(
                `*Mensaje desde yadocel.org*\n\n` +
                `*Nombre:* ${name}\n` +
                `*Tel:* ${phone}\n` +
                `*Email:* ${email || '—'}\n` +
                `*Servicio:* ${serviceName}\n` +
                `*Mensaje:*\n${message}`
            );

            window.open(`https://wa.me/524772067575?text=${text}`, '_blank');
            showNotification('Abriendo WhatsApp...', 'success');
            contactForm.reset();
        });
    }

    // ================================
    // Phone input: numbers only
    // ================================
    const phoneInput = document.getElementById('phone');
    if (phoneInput) {
        phoneInput.addEventListener('input', function (e) {
            e.target.value = e.target.value.replace(/\D/g, '').slice(0, 10);
        });
    }

    // ================================
    // Notification
    // ================================
    function showNotification(message, type) {
        const existing = document.querySelector('.ydcl-notif');
        if (existing) existing.remove();

        const el = document.createElement('div');
        el.className = 'ydcl-notif';
        el.innerHTML = `<span>${message}</span><button onclick="this.parentElement.remove()">&times;</button>`;

        const bg = type === 'success' ? '#25d366' : type === 'error' ? '#ef4444' : '#7b2ff7';

        el.style.cssText = `
            position:fixed;top:90px;right:24px;z-index:9999;
            display:flex;align-items:center;gap:12px;
            padding:14px 20px;border-radius:10px;
            background:${bg};color:#fff;font-size:0.9rem;font-weight:500;
            box-shadow:0 8px 30px rgba(0,0,0,0.4);
            animation:slideIn .3s ease-out;
        `;

        if (!document.getElementById('ydcl-notif-style')) {
            const style = document.createElement('style');
            style.id = 'ydcl-notif-style';
            style.textContent = `
                @keyframes slideIn{from{transform:translateX(100%);opacity:0}to{transform:translateX(0);opacity:1}}
                .ydcl-notif button{background:none;border:none;color:#fff;font-size:1.3rem;cursor:pointer;padding:0;opacity:0.8}
                .ydcl-notif button:hover{opacity:1}
            `;
            document.head.appendChild(style);
        }

        document.body.appendChild(el);
        setTimeout(() => { if (el.parentElement) el.remove(); }, 4000);
    }

    // ================================
    // Console
    // ================================
    console.log(
        '%cYADOCEL%c — Tech & Repair\n%cPortal Padilla #111, Centro de León',
        'color:#ff2d8a;font-size:20px;font-weight:900;font-family:monospace',
        'color:#fff;font-size:14px',
        'color:#9ca3af;font-size:11px'
    );
});
