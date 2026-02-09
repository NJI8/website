/**
 * Work Page JavaScript - Literals
 * Handles animations and interactions
 */

// Initialize Lucide icons
document.addEventListener('DOMContentLoaded', function() {
    // Initialize Lucide icons
    if (typeof lucide !== 'undefined') {
        lucide.createIcons();
    }

    // Initialize lazy loading for project images
    initLazyLoading();

    // Initialize scroll animations
    initScrollAnimations();

    // Initialize smooth scroll for anchor links
    initSmoothScroll();

    // Header scroll effect
    initHeaderScroll();
});

/**
 * Lazy load images for projects section
 */
function initLazyLoading() {
    const lazyImages = document.querySelectorAll('.project-image[loading="lazy"]');
    
    if (!lazyImages.length) return;
    
    // Create Intersection Observer for lazy loading
    if ('IntersectionObserver' in window) {
        const imageObserver = new IntersectionObserver((entries, observer) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    const img = entry.target;
                    
                    // Check if data-src exists (for progressive enhancement)
                    if (img.dataset.src) {
                        img.src = img.dataset.src;
                    }
                    
                    // Add loaded class for transition effect
                    img.classList.add('loaded');
                    
                    // Stop observing once loaded
                    observer.unobserve(img);
                }
            });
        }, {
            root: null,
            rootMargin: '100px 0px', // Start loading 100px before entering viewport
            threshold: 0.01
        });
        
        // Observe each lazy image
        lazyImages.forEach(img => imageObserver.observe(img));
    } else {
        // Fallback for browsers without IntersectionObserver
        lazyImages.forEach(img => {
            if (img.dataset.src) {
                img.src = img.dataset.src;
            }
            img.classList.add('loaded');
        });
    }
}

/**
 * Scroll-triggered animations using Intersection Observer
 */
function initScrollAnimations() {
    const animatedElements = document.querySelectorAll('.animate-on-scroll');

    const observerOptions = {
        root: null,
        rootMargin: '0px 0px -50px 0px',
        threshold: 0.1
    };

    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.classList.add('visible');
                // Optionally unobserve after animation
                // observer.unobserve(entry.target);
            }
        });
    }, observerOptions);

    animatedElements.forEach(element => {
        observer.observe(element);
    });
}

/**
 * Smooth scroll for anchor links
 */
function initSmoothScroll() {
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function(e) {
            // Don't prevent default if it's the "View All Projects" link without a target
            const href = this.getAttribute('href');
            if (href === '#contact' && !document.querySelector('#contact')) {
                return; // Let the link work normally
            }
            
            e.preventDefault();
            const targetId = this.getAttribute('href');
            const targetElement = document.querySelector(targetId);
            
            if (targetElement) {
                const headerHeight = 80; // Fixed header height
                const targetPosition = targetElement.offsetTop - headerHeight;
                
                window.scrollTo({
                    top: targetPosition,
                    behavior: 'smooth'
                });
            }
        });
    });
}

/**
 * Header background change on scroll
 */
function initHeaderScroll() {
    const header = document.querySelector('.nav'); // Changed from .header to .nav
    if (!header) return;
    
    let lastScroll = 0;

    window.addEventListener('scroll', () => {
        const currentScroll = window.pageYOffset;

        // Add shadow on scroll
        if (currentScroll > 50) {
            header.style.boxShadow = '0 4px 20px rgba(0, 0, 0, 0.08)';
            header.style.background = 'rgba(255, 255, 255, 0.95)';
        } else {
            header.style.boxShadow = 'none';
            header.style.background = 'transparent';
        }

        lastScroll = currentScroll;
    });
}

/**
 * Optional: Parallax effect for hero section
 */
function initParallax() {
    const hero = document.querySelector('.hero');
    const heroContent = document.querySelector('.hero-content');

    if (!hero || !heroContent) return;

    window.addEventListener('scroll', () => {
        const scrolled = window.pageYOffset;
        const heroHeight = hero.offsetHeight;

        if (scrolled < heroHeight) {
            const parallaxValue = scrolled * 0.3;
            heroContent.style.transform = `translateY(${parallaxValue}px)`;
            heroContent.style.opacity = 1 - (scrolled / heroHeight) * 0.5;
        }
    });
}

// Performance optimizations
window.addEventListener('load', function() {
    // Force a repaint to ensure smooth animations
    requestAnimationFrame(() => {
        document.body.style.opacity = '1';
    });
    
    // Optional: Preload critical images after page load
    setTimeout(() => {
        const criticalImages = document.querySelectorAll('.project-image:not([loading="lazy"])');
        criticalImages.forEach(img => {
            if (img.complete) return;
            
            // Create a new image to preload
            const preloadImg = new Image();
            preloadImg.src = img.src;
        });
    }, 1000);
});
/**
 * Modern Projects Showcase Interactions
 */
function initProjectsShowcase() {
    const filterButtons = document.querySelectorAll('.filter-btn');
    const projectCards = document.querySelectorAll('.interactive-card');
    
    if (!filterButtons.length) return;
    
    // Filter functionality
    filterButtons.forEach(button => {
        button.addEventListener('click', () => {
            // Update active button
            filterButtons.forEach(btn => btn.classList.remove('active'));
            button.classList.add('active');
            
            const filter = button.dataset.filter;
            
            // Filter projects
            projectCards.forEach(card => {
                if (filter === 'all' || card.dataset.category === filter) {
                    card.style.display = 'block';
                    setTimeout(() => {
                        card.style.opacity = '1';
                        card.style.transform = 'translateY(0)';
                    }, 10);
                } else {
                    card.style.opacity = '0';
                    card.style.transform = 'translateY(20px)';
                    setTimeout(() => {
                        card.style.display = 'none';
                    }, 300);
                }
            });
        });
    });
    
    // Interactive hover effects
    projectCards.forEach(card => {
        const viewBtn = card.querySelector('.card-view-btn');
        
        card.addEventListener('mouseenter', () => {
            card.style.zIndex = '10';
        });
        
        card.addEventListener('mouseleave', () => {
            card.style.zIndex = '1';
        });
        
        // Case study button click
        if (viewBtn) {
            viewBtn.addEventListener('click', (e) => {
                e.stopPropagation();
                const projectTitle = card.querySelector('.card-title').textContent;
                console.log(`Viewing case study: ${projectTitle}`);
                // Add your modal or navigation logic here
            });
        }
    });
}

// Initialize in DOMContentLoaded
// Add this to your existing DOMContentLoaded function:
// initProjectsShowcase();
// Uncomment to enable parallax effect
// initParallax();