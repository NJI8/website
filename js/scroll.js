// Fix for Safari vh issues - set section heights directly
function fixMobileHeights() {
    const viewportHeight = window.innerHeight;
    // Set height for all sections that should be full height
    const sections = document.querySelectorAll('.section.red, .services-section');
    sections.forEach(section => {
        section.style.minHeight = `${viewportHeight}px`;
        section.style.height = `${viewportHeight}px`;
    });

    // Also fix hero section
    const hero = document.querySelector('.hero');
    if (hero) {
        hero.style.minHeight = `${viewportHeight}px`;
        hero.style.height = `${viewportHeight}px`;
    }
}

// Run on load and resize
fixMobileHeights();
window.addEventListener('resize', fixMobileHeights);

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

window.addEventListener("scroll", () => {
    const y = window.scrollY;
    const vh = window.innerHeight;
    const heroHeight = hero.offsetHeight;

    // Check if we've scrolled past hero section
    if (y > heroHeight * 2.0) {
        // Add background to navbar
        navbar.style.backgroundColor = "rgba(255, 255, 255, 0.95)";
        navbar.style.backdropFilter = "blur(10px)";
        navbar.style.boxShadow = "0 2px 20px rgba(0, 0, 0, 0.1)";
    } else {
        // Remove background when in hero section
        navbar.style.backgroundColor = "transparent";
        navbar.style.backdropFilter = "none";
        navbar.style.boxShadow = "none";
    }

    // Mobile-specific behavior
    if (isMobile()) {
        // On mobile, when scrolled past a threshold, move logo to left header
        if (y > 100) {
            // Logo goes to left header position
            logo.style.top = "25px";
            logo.style.left = "20px";
            logo.style.transform = "translateX(0) translateY(0)"; // Remove centering
            logo.style.width = "120px";
            
            // Change color when entering white section
            const whiteTop = whiteSection.offsetTop;
            if (y >= whiteTop - vh * 0.5) {
                logo.style.color = "#d41e22";
                document.body.style.color = "#d41e22";
                // Also change navbar text color to red when in white section
                document.querySelectorAll('.nav-links a').forEach(link => {
                    link.style.color = "#d41e22";
                });
            } else {
                logo.style.color = "white";
                document.body.style.color = "white";
                // Navbar text white when in red section
                document.querySelectorAll('.nav-links a').forEach(link => {
                    link.style.color = "white";
                });
            }
        } else {
            // When at top, logo is centered
            logo.style.top = "50%";
            logo.style.left = "50%";
            logo.style.transform = "translateX(-50%) translateY(-50%)";
            logo.style.width = `${Math.min(420, 0.85 * window.innerWidth)}px`;
            logo.style.color = "white";
            document.body.style.color = "white";
            // Navbar text white when at top
            document.querySelectorAll('.nav-links a').forEach(link => {
                link.style.color = "white";
            });
        }
    } else {
        // Desktop/tablet behavior (original code)
        const progress = Math.min(
            Math.max((y - startY) / (endY - startY), 0),
            1
        );

        const topValue = 50 - progress * 46;
        const scaleValue = 1 - progress * 0.62;
        const widthValue = 420 - progress * 260;

        logo.style.top = `${topValue}%`;
        logo.style.left = "50%";
        logo.style.transform = "translateX(-50%) translateY(-50%)";
        logo.style.width = `${widthValue}px`;

        const whiteTop = whiteSection.offsetTop;
        if (y >= whiteTop - vh * 0.2) {
            logo.style.color = "#d41e22";
            document.body.style.color = "#d41e22";
            // Navbar text red when in white section
            document.querySelectorAll('.nav-links a').forEach(link => {
                link.style.color = "#d41e22";
            });
        } else {
            logo.style.color = "white";
            document.body.style.color = "white";
            // Navbar text white when in red section
            document.querySelectorAll('.nav-links a').forEach(link => {
                link.style.color = "white";
            });
        }
    }

    // Reveal animations
    reveals.forEach(el => {
        const rect = el.getBoundingClientRect();
        if (rect.top < window.innerHeight * 0.85) {
            el.classList.add("active");
        }
    });
});

// Handle resize
window.addEventListener("resize", () => {
    if (!isMobile() && window.scrollY <= 100) {
        // Reset logo position on desktop when at top
        logo.style.top = "50%";
        logo.style.left = "50%";
        logo.style.transform = "translateX(-50%) translateY(-50%)";
        logo.style.width = "420px";
    }
    
    // Reset navbar colors on resize
    const y = window.scrollY;
    const vh = window.innerHeight;
    const heroHeight = hero.offsetHeight;
    const whiteTop = whiteSection.offsetTop;
    
    if (y > heroHeight * 0.8) {
        navbar.style.backgroundColor = "rgba(255, 255, 255, 0.95)";
        navbar.style.backdropFilter = "blur(10px)";
        navbar.style.boxShadow = "0 2px 20px rgba(0, 0, 0, 0.1)";
    } else {
        navbar.style.backgroundColor = "transparent";
        navbar.style.backdropFilter = "none";
        navbar.style.boxShadow = "none";
    }
    
    // Update text colors
    if (y >= whiteTop - vh * 0.2) {
        document.querySelectorAll('.nav-links a').forEach(link => {
            link.style.color = "#d41e22";
        });
    } else {
        document.querySelectorAll('.nav-links a').forEach(link => {
            link.style.color = "white";
        });
    }
});

// Initial setup
if (isMobile() && window.scrollY > 100) {
    logo.style.top = "25px";
    logo.style.left = "20px";
    logo.style.transform = "translateX(0) translateY(0)";
    logo.style.width = "120px";
}

// Initial navbar check
document.addEventListener('DOMContentLoaded', () => {
    const y = window.scrollY;
    const heroHeight = hero.offsetHeight;

    if (y > heroHeight * 2.0) {
        navbar.style.backgroundColor = "rgba(255, 255, 255, 0.95)";
        navbar.style.backdropFilter = "blur(10px)";
        navbar.style.boxShadow = "0 2px 20px rgba(0, 0, 0, 0.1)";
    }
});
