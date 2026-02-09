// Fix for Safari mobile viewport height
function setViewportHeight() {
    // Set a custom CSS variable for mobile Safari
    const vh = window.innerHeight * 0.01;
    document.documentElement.style.setProperty('--vh', `${vh}px`);
}

// Initialize
setViewportHeight();
window.addEventListener('resize', setViewportHeight);

// Elements
const whiteSection = document.querySelector(".white");
const logo = document.querySelector(".logo");
const hero = document.querySelector(".hero");
const navbar = document.querySelector(".navbar");
const reveals = document.querySelectorAll(".reveal");

const startY = window.innerHeight * 0.0;  // start moving
const endY   = window.innerHeight * 0.9;  // finish moving

// Check if mobile
function isMobile() {
    return window.innerWidth <= 768;
}

// Wait for page to fully load
function initScrollEffects() {
    // Set initial navbar state
    updateNavbar();
    updateLogo();
    updateColors();
    
    // Add scroll event listener
    window.addEventListener("scroll", handleScroll);
    window.addEventListener("resize", handleResize);
}

// Handle scroll events
function handleScroll() {
    const y = window.scrollY;
    const vh = window.innerHeight;
    const heroHeight = hero.offsetHeight;
    const whiteTop = whiteSection.offsetTop;

    // Update navbar based on scroll position
    updateNavbar(y, heroHeight);
    
    // Update logo position and colors
    updateLogo(y, vh, whiteTop);
    updateColors(y, vh, whiteTop);
    
    // Handle reveal animations
    handleReveals();
}

// Update navbar appearance
function updateNavbar(y = window.scrollY, heroHeight = hero.offsetHeight) {
    if (!navbar) return;
    
    if (y > heroHeight * 2.0) {
        navbar.style.backgroundColor = "rgba(255, 255, 255, 0.95)";
        navbar.style.backdropFilter = "blur(10px)";
        navbar.style.boxShadow = "0 2px 20px rgba(0, 0, 0, 0.1)";
    } else {
        navbar.style.backgroundColor = "transparent";
        navbar.style.backdropFilter = "none";
        navbar.style.boxShadow = "none";
    }
}

// Update logo position
function updateLogo(y = window.scrollY, vh = window.innerHeight, whiteTop = whiteSection.offsetTop) {
    if (!logo) return;
    
    if (isMobile()) {
        // Mobile-specific behavior
        if (y > 100) {
            // Logo goes to left header position
            logo.style.top = "25px";
            logo.style.left = "20px";
            logo.style.transform = "translateX(0) translateY(0)";
            logo.style.width = "120px";
        } else {
            // When at top, logo is centered
            logo.style.top = "50%";
            logo.style.left = "50%";
            logo.style.transform = "translateX(-50%) translateY(-50%)";
            logo.style.width = `${Math.min(420, 0.85 * window.innerWidth)}px`;
        }
    } else {
        // Desktop/tablet behavior
        const progress = Math.min(
            Math.max((y - startY) / (endY - startY), 0),
            1
        );

        const topValue = 50 - progress * 46;
        const widthValue = 420 - progress * 260;

        logo.style.top = `${topValue}%`;
        logo.style.left = "50%";
        logo.style.transform = "translateX(-50%) translateY(-50%)";
        logo.style.width = `${widthValue}px`;
    }
}

// Update colors based on scroll position
function updateColors(y = window.scrollY, vh = window.innerHeight, whiteTop = whiteSection.offsetTop) {
    const navLinks = document.querySelectorAll('.nav-links a');
    
    if (y >= whiteTop - vh * 0.2) {
        // In white section - red colors
        if (logo) logo.style.color = "#d41e22";
        document.body.style.color = "#d41e22";
        navLinks.forEach(link => {
            link.style.color = "#d41e22";
        });
    } else {
        // In red section - white colors
        if (logo) logo.style.color = "white";
        document.body.style.color = "white";
        navLinks.forEach(link => {
            link.style.color = "white";
        });
    }
}

// Handle reveal animations
function handleReveals() {
    reveals.forEach(el => {
        const rect = el.getBoundingClientRect();
        if (rect.top < window.innerHeight * 0.85) {
            el.classList.add("active");
        }
    });
}

// Handle resize
function handleResize() {
    setViewportHeight(); // Update viewport height variable
    
    if (!isMobile() && window.scrollY <= 100 && logo) {
        // Reset logo position on desktop when at top
        logo.style.top = "50%";
        logo.style.left = "50%";
        logo.style.transform = "translateX(-50%) translateY(-50%)";
        logo.style.width = "420px";
    }
    
    // Update all effects
    handleScroll();
}

// Initialize when page is fully loaded
window.addEventListener('load', function() {
    // Small delay to ensure everything is ready
    setTimeout(initScrollEffects, 100);
});

// Fallback initialization
document.addEventListener('DOMContentLoaded', function() {
    // Set viewport height immediately
    setViewportHeight();
});
