<template>
  <div class="contact-page">
    <FloatingNav />

    <main>
      <!-- Contact Hero/Intro -->
      <section class="contact-hero">
        <div class="container hero-container reveal-item">
          <span class="tag">Get In Touch</span>
          <h1 class="hero-title">Let's create <br /><span class="accent-text">something great</span> together.</h1>
          <p class="hero-description">
            Whether you have a question about our services, pricing, or anything else, our team is ready to answer all your questions.
          </p>
        </div>
      </section>

      <!-- Main Contact Section -->
      <section class="contact-section">
        <div class="container main-container">
          <!-- Form Section -->
          <div class="contact-form-wrapper reveal-item">
            <h2 class="form-title">Send us a message</h2>
            <form class="contact-form" @submit.prevent="handleSubmit">
              <div class="input-group">
                <input type="text" id="name" placeholder="Full Name" required v-model="form.name" />
                <label for="name">Full Name</label>
              </div>
              <div class="input-group">
                <input type="email" id="email" placeholder="Email Address" required v-model="form.email" />
                <label for="email">Email Address</label>
              </div>
              <div class="input-group full-width">
                <input type="text" id="subject" placeholder="Subject" required v-model="form.subject" />
                <label for="subject">Subject</label>
              </div>
              <div class="input-group full-width">
                <textarea id="message" placeholder="Your Message" required v-model="form.message" rows="5"></textarea>
                <label for="message">Your Message</label>
              </div>
              <button type="submit" class="submit-btn" :disabled="isSubmitting">
                <span>{{ isSubmitting ? 'Sending...' : 'Send Message' }}</span>
                <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                  <path d="M5 12h14M12 5l7 7-7 7" stroke-linecap="round" stroke-linejoin="round"/>
                </svg>
              </button>
              
              <Transition name="fade">
                <p v-if="showSuccess" class="success-msg">Message sent successfully! We'll be in touch soon.</p>
              </Transition>
            </form>
          </div>

          <!-- Info Section -->
          <div class="contact-info-wrapper reveal-item">
            <div class="info-card">
              <h3 class="info-title">Contact Information</h3>
              <div class="info-links">
                <div class="info-item">
                  <div class="i-icon">📍</div>
                  <div class="i-text">
                    <strong>Location</strong>
                    <span>Mbezi Beach, Dar es Salaam, TZ</span>
                  </div>
                </div>
                <div class="info-item">
                  <div class="i-icon">📞</div>
                  <div class="i-text">
                    <strong>Phone</strong>
                    <span>+255 714 686 167</span>
                    <span>+255 757 076 730</span>
                  </div>
                </div>
                <div class="info-item">
                  <div class="i-icon">✉️</div>
                  <div class="i-text">
                    <strong>Email</strong>
                    <span>info@visualmax.co.tz</span>
                  </div>
                </div>
              </div>

              <div class="social-box">
                <h4>Follow our journey</h4>
                <div class="social-icons">
                  <a href="#" class="s-link" aria-label="Twitter">𝕏</a>
                  <a href="#" class="s-link" aria-label="Facebook">f</a>
                  <a href="#" class="s-link" aria-label="Instagram">ig</a>
                  <a href="#" class="s-link" aria-label="LinkedIn">in</a>
                </div>
              </div>
            </div>
            
            <div class="map-placeholder zoom-in-item reveal-item">
              <div class="map-overlay">
                <div class="location-dot"></div>
                <span>Visualmax HQ</span>
              </div>
              <!-- In a real app we'd embed an iframe or Google Map here -->
            </div>
          </div>
        </div>
      </section>
    </main>
  </div>
</template>

<script setup lang="ts">
import { ref, reactive, onMounted } from 'vue'

const form = reactive({
  name: '',
  email: '',
  subject: '',
  message: ''
})

const isSubmitting = ref(false)
const showSuccess = ref(false)

const handleSubmit = () => {
  isSubmitting.value = true
  // Simulate API call
  setTimeout(() => {
    isSubmitting.value = false
    showSuccess.value = true
    form.name = ''
    form.email = ''
    form.subject = ''
    form.message = ''
    
    setTimeout(() => {
      showSuccess.value = false
    }, 5000)
  }, 1500)
}

onMounted(() => {
  const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        entry.target.classList.add('is-visible')
      }
    })
  }, { threshold: 0.1 })

  document.querySelectorAll('.reveal-item').forEach(item => observer.observe(item))
})
</script>

<style scoped>
.contact-page {
  background-color: var(--background);
  color: var(--text);
  min-height: 100vh;
  overflow-x: hidden;
}

.container {
  max-width: 1240px;
  margin: 0 auto;
  padding: 0 40px;
}

/* Hero Section */
.contact-hero {
  padding: 180px 0 100px;
  text-align: center;
}

.hero-container {
  max-width: 900px;
}

.tag {
  color: #EF4056;
  font-weight: 700;
  text-transform: uppercase;
  letter-spacing: 3px;
  font-size: 14px;
  margin-bottom: 20px;
  display: block;
}

.hero-title {
  font-size: clamp(40px, 8vw, 72px);
  line-height: 1;
  font-weight: 800;
  margin-bottom: 30px;
}

.accent-text {
  color: #EF4056;
}

.hero-description {
  font-size: 18px;
  color: var(--text-dim);
  line-height: 1.8;
  max-width: 600px;
  margin: 0 auto;
}

/* Main Section */
.contact-section {
  padding-bottom: 120px;
}

.main-container {
  display: grid;
  grid-template-columns: 1.2fr 1fr;
  gap: 80px;
  align-items: start;
}

/* Form Styling */
.contact-form-wrapper {
  background: var(--surface);
  padding: 60px;
  border-radius: 20px;
  border: 1px solid var(--card-border);
  box-shadow: 0 30px 60px rgba(0,0,0,0.1);
}

.form-title {
  font-size: 32px;
  font-weight: 700;
  margin-bottom: 40px;
}

.contact-form {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 30px;
}

.input-group {
  position: relative;
  display: flex;
  flex-direction: column;
}

.full-width {
  grid-column: span 2;
}

.input-group input,
.input-group textarea {
  background: transparent;
  border: none;
  border-bottom: 1px solid var(--card-border);
  padding: 15px 0;
  color: var(--text);
  font-size: 16px;
  font-family: inherit;
  outline: none;
  transition: border-color 0.3s;
}

.input-group label {
  position: absolute;
  top: 15px;
  left: 0;
  color: var(--text-dim-extra);
  pointer-events: none;
  transition: all 0.3s;
  font-size: 16px;
}

.input-group input:focus ~ label,
.input-group input:not(:placeholder-shown) ~ label,
.input-group textarea:focus ~ label,
.input-group textarea:not(:placeholder-shown) ~ label {
  top: -10px;
  font-size: 12px;
  color: #EF4056;
}

.input-group input:focus,
.input-group textarea:focus {
  border-color: #EF4056;
}

.submit-btn {
  grid-column: span 2;
  background: #EF4056;
  color: #fff;
  border: none;
  padding: 20px 40px;
  border-radius: 50px;
  font-size: 16px;
  font-weight: 700;
  cursor: pointer;
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 12px;
  transition: all 0.3s;
  box-shadow: 0 10px 30px rgba(239, 64, 86, 0.3);
  margin-top: 20px;
}

.submit-btn:hover:not(:disabled) {
  transform: translateY(-5px);
  box-shadow: 0 15px 40px rgba(239, 64, 86, 0.5);
}

.submit-btn:disabled {
  opacity: 0.7;
  cursor: not-allowed;
}

.success-msg {
  grid-column: span 2;
  color: #4CAF50;
  font-weight: 600;
  margin-top: 20px;
  text-align: center;
}

/* Info Section Styling */
.info-card {
  background: #EF4056;
  color: #fff;
  padding: 60px;
  border-radius: 20px;
  margin-bottom: 40px;
  box-shadow: 0 30px 60px rgba(239, 64, 86, 0.2);
}

.info-title {
  font-size: 28px;
  font-weight: 700;
  margin-bottom: 40px;
}

.info-links {
  display: flex;
  flex-direction: column;
  gap: 30px;
  margin-bottom: 50px;
}

.info-item {
  display: flex;
  gap: 20px;
}

.i-icon {
  font-size: 24px;
}

.i-text {
  display: flex;
  flex-direction: column;
}

.i-text strong {
  font-size: 14px;
  text-transform: uppercase;
  letter-spacing: 1px;
  opacity: 0.8;
  margin-bottom: 5px;
}

.i-text span {
  font-size: 18px;
  font-weight: 500;
}

.social-box h4 {
  font-size: 14px;
  text-transform: uppercase;
  letter-spacing: 2px;
  margin-bottom: 20px;
}

.social-icons {
  display: flex;
  gap: 15px;
}

.s-link {
  width: 45px;
  height: 45px;
  background: rgba(255, 255, 255, 0.1);
  border: 1px solid rgba(255, 255, 255, 0.2);
  border-radius: 12px;
  display: flex;
  align-items: center;
  justify-content: center;
  color: #fff;
  text-decoration: none;
  font-weight: 700;
  transition: all 0.3s;
}

.s-link:hover {
  background: #fff;
  color: #EF4056;
  transform: translateY(-5px);
}

.map-placeholder {
  width: 100%;
  height: 300px;
  background: var(--surface);
  border: 1px solid var(--card-border);
  border-radius: 20px;
  position: relative;
  overflow: hidden;
  display: flex;
  align-items: center;
  justify-content: center;
}

/* Static Map Look */
.map-placeholder::before {
  content: "";
  position: absolute;
  inset: 0;
  background-image: radial-gradient(circle, var(--text-dim-extra) 1px, transparent 1px);
  background-size: 20px 20px;
  opacity: 0.2;
}

.map-overlay {
  position: relative;
  z-index: 1;
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 15px;
}

.location-dot {
  width: 20px;
  height: 20px;
  background: #EF4056;
  border: 4px solid #fff;
  border-radius: 50%;
  box-shadow: 0 0 20px rgba(239, 64, 86, 0.8);
  animation: pulse 2s infinite;
}

@keyframes pulse {
  0% { box-shadow: 0 0 0 0 rgba(239, 64, 86, 0.7); }
  70% { box-shadow: 0 0 0 20px rgba(239, 64, 86, 0); }
  100% { box-shadow: 0 0 0 0 rgba(239, 64, 86, 0); }
}

/* Animations */
.reveal-item {
  opacity: 0;
  transform: translateY(40px);
  transition: all 1s cubic-bezier(0.165, 0.84, 0.44, 1);
}

.reveal-item.is-visible {
  opacity: 1;
  transform: translateY(0);
}

.zoom-in-item {
  transform: scale(0.9);
  transition: all 1.2s cubic-bezier(0.165, 0.84, 0.44, 1);
}

.zoom-in-item.is-visible {
  transform: scale(1);
}

.fade-enter-active, .fade-leave-active { transition: opacity 0.5s; }
.fade-enter-from, .fade-leave-to { opacity: 0; }

/* Responsive */
@media (max-width: 1024px) {
  .main-container {
    grid-template-columns: 1fr;
    gap: 60px;
  }
}

@media (max-width: 768px) {
  .contact-hero {
    padding-top: 140px;
  }
  .container {
    padding: 0 20px;
  }
  .contact-form {
    grid-template-columns: 1fr;
    gap: 20px;
  }
  .full-width {
    grid-column: span 1;
  }
  .contact-form-wrapper, .info-card {
    padding: 40px 25px;
  }
}
</style>
