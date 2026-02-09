// Contact Form Handler
document.addEventListener('DOMContentLoaded', function() {
  // Set current year in footer
  const yearElement = document.getElementById('year');
  if (yearElement) {
    yearElement.textContent = new Date().getFullYear();
  }

  // Form elements
  const form = document.getElementById('contactForm');
  const successMessage = document.getElementById('successMessage');
  const submitBtn = form.querySelector('.submit-btn');

  // Form validation
  function validateEmail(email) {
    const re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return re.test(email);
  }

  function showError(inputId, message) {
    const input = document.getElementById(inputId);
    const errorElement = document.getElementById(inputId + 'Error');
    
    input.classList.add('error');
    errorElement.textContent = message;
  }

  function clearError(inputId) {
    const input = document.getElementById(inputId);
    const errorElement = document.getElementById(inputId + 'Error');
    
    input.classList.remove('error');
    errorElement.textContent = '';
  }

  function clearAllErrors() {
    ['name', 'email', 'subject', 'message'].forEach(clearError);
  }

  // Real-time validation
  const inputs = form.querySelectorAll('input, textarea');
  inputs.forEach(input => {
    input.addEventListener('blur', function() {
      validateField(this.id, this.value);
    });

    input.addEventListener('input', function() {
      if (this.classList.contains('error')) {
        clearError(this.id);
      }
    });
  });

  function validateField(id, value) {
    if (!value.trim()) {
      showError(id, 'This field is required');
      return false;
    }

    if (id === 'email' && !validateEmail(value)) {
      showError(id, 'Please enter a valid email');
      return false;
    }

    if (id === 'name' && value.trim().length < 2) {
      showError(id, 'Name must be at least 2 characters');
      return false;
    }

    clearError(id);
    return true;
  }

  // Form submission
  form.addEventListener('submit', async function(e) {
    e.preventDefault();

    clearAllErrors();

    // Get form values
    const name = document.getElementById('name').value;
    const email = document.getElementById('email').value;
    const subject = document.getElementById('subject').value;
    const message = document.getElementById('message').value;

    // Validate all fields
    let isValid = true;

    if (!validateField('name', name)) isValid = false;
    if (!validateField('email', email)) isValid = false;
    if (!validateField('subject', subject)) isValid = false;
    if (!validateField('message', message)) isValid = false;

    if (!isValid) return;

    // Simulate form submission
    submitBtn.disabled = true;
    submitBtn.innerHTML = `
      <span>Sending...</span>
      <svg class="spinner" xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
        <path d="M21 12a9 9 0 1 1-6.219-8.56"></path>
      </svg>
    `;

    // Add spinner animation
    const style = document.createElement('style');
    style.textContent = `
      @keyframes spin {
        from { transform: rotate(0deg); }
        to { transform: rotate(360deg); }
      }
      .spinner {
        animation: spin 1s linear infinite;
      }
    `;
    document.head.appendChild(style);

    // Simulate API delay
    await new Promise(resolve => setTimeout(resolve, 1500));

    // Show success message
    form.classList.add('hidden');
    successMessage.classList.remove('hidden');

    // Log form data (in real app, send to server)
    console.log('Form submitted:', { name, email, subject, message });

    // Reset form after delay
    setTimeout(() => {
      form.reset();
      form.classList.remove('hidden');
      successMessage.classList.add('hidden');
      submitBtn.disabled = false;
      submitBtn.innerHTML = `
        <span>Send Message</span>
        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
          <line x1="22" y1="2" x2="11" y2="13"></line>
          <polygon points="22 2 15 22 11 13 2 9 22 2"></polygon>
        </svg>
      `;
    }, 3000);
  });

  // Add hover effects to contact cards
  const cards = document.querySelectorAll('.contact-card:not(.static)');
  cards.forEach(card => {
    card.addEventListener('mouseenter', function() {
      this.style.cursor = 'pointer';
    });
  });

  // Smooth scroll for anchor links
  document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function(e) {
      e.preventDefault();
      const target = document.querySelector(this.getAttribute('href'));
      if (target) {
        target.scrollIntoView({
          behavior: 'smooth',
          block: 'start'
        });
      }
    });
  });
});
