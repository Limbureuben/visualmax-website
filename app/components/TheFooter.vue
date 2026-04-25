<template>
  <footer class="the-footer">
    <!-- Contact Us Section with Sliding Background -->
    <div id="contact" class="footer-contact-hero">
      <transition-group name="fade-slide">
        <div 
          v-for="(slide, idx) in slides" 
          :key="slide"
          v-show="currentSlide === idx"
          class="contact-slide-bg"
          :style="{ backgroundImage: `url(${slide})` }"
        ></div>
      </transition-group>
      <div class="contact-overlay"></div>

      <div class="contact-box-container">
        <div class="contact-box">
          <h2 class="contact-title">Ready to<br>Build<br>Something<br>Real?</h2>
          
          <form @submit.prevent="submitContact" class="contact-form">
            <input type="text" v-model="form.name" placeholder="Your Name" required class="contact-input" />
            <input type="email" v-model="form.email" placeholder="Your Email" required class="contact-input" />
            <input type="text" v-model="form.subject" placeholder="Project Subject" required class="contact-input" />
            <textarea v-model="form.message" placeholder="Your idea about the project" required class="contact-input textarea" rows="5"></textarea>
            
            <button type="submit" class="submit-collab-btn" :disabled="isSubmitting">
              <span v-if="!isSubmitting">Let's Collaborate</span>
              <span v-else>Sending...</span>
            </button>
          </form>
        </div>
      </div>
    </div>

    <div class="container main-footer-container">
      <!-- Top Row: Logo & Social -->
      <div class="footer-top">
        <div class="footer-logo">
          <img src="/images/landing/logo.png" alt="Visualmax" />
        </div>
        <div class="social-links">
          <!-- Instagram -->
          <a href="https://www.instagram.com/visualmax.tz" target="_blank" rel="noopener noreferrer" class="social-btn" aria-label="Instagram">
            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" xmlns="http://www.w3.org/2000/svg">
              <rect x="2" y="2" width="20" height="20" rx="5" ry="5"></rect>
              <path d="M16 11.37A4 4 0 1 1 12.63 8 4 4 0 0 1 16 11.37z"></path>
              <line x1="17.5" y1="6.5" x2="17.51" y2="6.5"></line>
            </svg>
          </a>
          <!-- LinkedIn -->
          <a href="https://www.linkedin.com/company/visualmax-tanzania/?viewAsMember=true" target="_blank" rel="noopener noreferrer" class="social-btn" aria-label="LinkedIn">
            <svg width="20" height="20" viewBox="0 0 24 24" fill="currentColor"><path d="M19 0H5C2.239 0 0 2.239 0 5V19C0 21.761 2.239 24 5 24H19C21.762 24 24 21.761 24 19V5C24 2.239 21.762 0 19 0ZM8 19H5V8H8V19ZM6.5 6.732C5.534 6.732 4.75 5.942 4.75 4.968C4.75 3.994 5.534 3.204 6.5 3.204C7.466 3.204 8.25 3.994 8.25 4.968C8.25 5.942 7.466 6.732 6.5 6.732ZM20 19H17V13.396C17 10.028 13 10.283 13 13.396V19H10V8H13V9.765C14.396 7.179 20 6.988 20 12.241V19Z"/></svg>
          </a>
          <!-- X (Twitter) -->
          <a href="https://www.x.com/visualmax_tz" target="_blank" rel="noopener noreferrer" class="social-btn" aria-label="X (Twitter)">
            <svg width="20" height="20" viewBox="0 0 24 24" fill="currentColor"><path d="M18.244 2.25h3.308l-7.227 8.26 8.502 11.24H16.17l-5.214-6.817L4.99 21.75H1.68l7.73-8.835L1.254 2.25H8.08l4.713 6.231zm-1.161 17.52h1.833L7.084 4.126H5.117z"/></svg>
          </a>
          <!-- Facebook -->
          <a href="https://www.facebook.com/visualmaxtanzania" target="_blank" rel="noopener noreferrer" class="social-btn" aria-label="Facebook">
            <svg width="20" height="20" viewBox="0 0 24 24" fill="currentColor"><path d="M24 12.073C24 5.405 18.627 0 12 0C5.373 0 0 5.405 0 12.073C0 18.1 4.388 23.094 10.125 24V15.563H7.078V12.073H10.125V9.429C10.125 6.425 11.917 4.761 14.658 4.761C15.97 4.761 17.344 4.996 17.344 4.996V7.948H15.83C14.34 7.948 13.875 8.873 13.875 9.822V12.073H17.203L16.67 15.563H13.875V24C19.613 23.094 24 18.1 24 12.073Z"/></svg>
          </a>
        </div>
      </div>

      <hr class="footer-divider" />

      <!-- Bottom Row: 4 Columns -->
      <div class="footer-grid">
        <!-- Column 1: About -->
        <div class="footer-col">
          <h4 class="col-title">About us</h4>
          <div class="accent-line"></div>
          <p class="about-text">
            We are passionate visual storytellers dedicated to capturing moments that matter. 
            Our work goes beyond photography it's about preserving emotions, connections, and 
            experiences in their most natural and meaningful form.
          </p>
        </div>

        <!-- Column 2: Our Services -->
        <div class="footer-col">
          <h4 class="col-title">Our services</h4>
          <div class="accent-line"></div>
          <ul class="footer-links">
            <li><NuxtLink to="/services/videography"><span class="arrow">›</span> Videography</NuxtLink></li>
            <li><NuxtLink to="/services/photography"><span class="arrow">›</span> Photography</NuxtLink></li>
            <li><NuxtLink to="/services/live-streaming"><span class="arrow">›</span> Live streaming</NuxtLink></li>
            <li><NuxtLink to="/services/creative-design"><span class="arrow">›</span> Creative designing</NuxtLink></li>
            <li><NuxtLink to="/services/podcasting"><span class="arrow">›</span> Podcasting and content creation</NuxtLink></li>
            <li><NuxtLink to="/services/led-rental"><span class="arrow">›</span> LED rental for events</NuxtLink></li>
          </ul>
        </div>

        <!-- Column 3: Quick Links -->
        <div class="footer-col">
          <h4 class="col-title">Quick Links</h4>
          <div class="accent-line"></div>
          <ul class="footer-links">
            <li><NuxtLink to="/"><span class="arrow">›</span> Home</NuxtLink></li>
            <li><NuxtLink to="/#services"><span class="arrow">›</span> Our services</NuxtLink></li>
            <li><NuxtLink to="/team"><span class="arrow">›</span> About us</NuxtLink></li>
            <li><NuxtLink to="#contact"><span class="arrow">›</span> Contact us</NuxtLink></li>
          </ul>
        </div>

        <!-- Column 4: Contact -->
        <div class="footer-col">
          <h4 class="col-title">Contact info</h4>
          <div class="accent-line"></div>
          <div class="contact-info">
            <p>Mbezi Beach, Dar es Salaam, Tanzania</p>
            <p>Phone: +255 714 686 167</p>
            <p class="indent">+255 757 076 730</p>
            <p>Email: info@visualmax.co.tz</p>
          </div>
        </div>
      </div>
    </div>
  </footer>
</template>

<script setup lang="ts">
import { ref, onMounted, onUnmounted } from 'vue'

const slides = [
  '/images/slide/slide1.png',
  '/images/slide/slide2.png',
  '/images/slide/slide3.png',
  '/images/slide/slide4.png'
]
const currentSlide = ref(0)
let slideInterval: any = null

const form = ref({
  name: '',
  email: '',
  subject: '',
  message: ''
})
const isSubmitting = ref(false)

onMounted(() => {
  slideInterval = setInterval(() => {
    currentSlide.value = (currentSlide.value + 1) % slides.length
  }, 5000)
})

onUnmounted(() => {
  if (slideInterval) clearInterval(slideInterval)
})

const submitContact = () => {
  isSubmitting.value = true
  setTimeout(() => {
    isSubmitting.value = false
    alert("Message sent successfully! We will get in touch with you shortly.")
    form.value = { name: '', email: '', subject: '', message: '' }
  }, 1000)
}
</script>

<style scoped>
.the-footer {
  background-color: var(--background);
  color: var(--text);
  border-top: none;
  transition: background-color 0.4s, color 0.4s;
}

/* Contact Hero Section */
.footer-contact-hero {
  position: relative;
  width: 100%;
  min-height: 850px;
  display: flex;
  align-items: center;
  justify-content: center;
  overflow: hidden;
  background: #000;
}

.contact-slide-bg {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-size: cover;
  background-position: center;
  filter: brightness(0.6);
  z-index: 0;
}

.fade-slide-enter-active,
.fade-slide-leave-active {
  transition: opacity 1.5s ease-in-out;
}
.fade-slide-enter-from,
.fade-slide-leave-to {
  opacity: 0;
}

.contact-overlay {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: linear-gradient(to top, var(--background) 0%, transparent 15%);
  z-index: 1;
}

.contact-box-container {
  position: relative;
  z-index: 2;
  width: 100%;
  max-width: 1200px;
  display: flex;
  justify-content: center;
  padding: 40px 20px;
}

.contact-box {
  background: #ffffff;
  width: 100%;
  max-width: 550px;
  padding: 60px 50px;
  border-radius: 8px;
  box-shadow: 0 30px 60px rgba(0, 0, 0, 0.4);
}

.contact-title {
  font-size: 52px;
  font-weight: 900;
  color: #111;
  line-height: 1.1;
  margin-bottom: 40px;
  text-transform: capitalize;
  letter-spacing: -1px;
}

.contact-form {
  display: flex;
  flex-direction: column;
  gap: 20px;
}

.contact-input {
  width: 100%;
  padding: 16px 20px;
  background: #f4f5f7;
  border: 1px solid transparent;
  border-radius: 6px;
  font-size: 15px;
  color: #333;
  font-family: inherit;
  transition: all 0.3s;
}

.contact-input::placeholder {
  color: #aaa;
}

.contact-input:focus {
  outline: none;
  background: #fff;
  border-color: var(--accent);
  box-shadow: 0 0 0 3px rgba(249, 168, 34, 0.1);
}

.textarea {
  resize: vertical;
  min-height: 120px;
}

.submit-collab-btn {
  width: 100%;
  background: var(--accent);
  color: #111;
  padding: 18px;
  border-radius: 50px;
  font-size: 17px;
  font-weight: 700;
  border: none;
  cursor: pointer;
  margin-top: 10px;
  transition: all 0.3s;
}

.submit-collab-btn:hover {
  transform: translateY(-3px);
  box-shadow: 0 10px 20px rgba(249, 168, 34, 0.4);
  background: #ffb833;
}

.submit-collab-btn:disabled {
  opacity: 0.7;
  cursor: not-allowed;
}

.main-footer-container {
  padding-top: 100px;
}

.container {
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 20px;
}

.footer-top {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 40px;
}

.footer-logo img {
  height: 90px;
  object-fit: contain;
}

.social-links {
  display: flex;
  gap: 15px;
}

.social-btn {
  width: 40px;
  height: 40px;
  border-radius: 50%;
  background: var(--surface);
  display: flex;
  align-items: center;
  justify-content: center;
  color: var(--text);
  text-decoration: none;
  transition: all 0.3s ease;
  border: 1px solid var(--card-border);
}

.social-btn:hover {
  background: var(--secondary); /* Brand Blue */
  color: #fff;
  transform: translateY(-3px);
  box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
  border-color: var(--secondary);
}

.footer-divider {
  border: none;
  border-top: 1px solid var(--card-border);
  margin-bottom: 60px;
}

.footer-grid {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: 40px;
}

.footer-col {
  display: flex;
  flex-direction: column;
}

.col-title {
  font-size: 22px;
  font-weight: 600;
  margin-bottom: 15px;
  color: var(--text);
}

.accent-line {
  width: 40px;
  height: 3px;
  background-color: var(--accent);
  margin-bottom: 25px;
}

.about-text {
  font-size: 14px;
  line-height: 1.8;
  color: var(--text-dim);
  margin: 0;
}

.footer-links {
  list-style: none;
  padding: 0;
  margin: 0;
}

.footer-links li {
  margin-bottom: 12px;
}

.footer-links a {
  color: var(--text-dim);
  text-decoration: none;
  font-size: 14px;
  transition: color 0.3s ease;
  display: flex;
  align-items: center;
  gap: 8px;
}

.footer-links a:hover {
  color: var(--accent);
}

.arrow {
  color: var(--accent);
  font-size: 18px;
  font-weight: bold;
}

.contact-info p {
  font-size: 14px;
  line-height: 1.8;
  color: var(--text-dim);
  margin: 0 0 10px;
}

.indent {
  padding-left: 50px;
}

/* Responsiveness */
@media (max-width: 1024px) {
  .footer-grid {
    grid-template-columns: repeat(2, 1fr);
    gap: 50px;
  }
}

@media (max-width: 600px) {
  .footer-contact-hero {
    min-height: 700px;
  }
  .contact-box {
    padding: 40px 25px;
  }
  .contact-title {
    font-size: 40px;
  }
  
  .footer-top {
    flex-direction: column;
    gap: 30px;
    text-align: center;
  }
  
  .footer-grid {
    grid-template-columns: 1fr;
    gap: 40px;
  }
  
  .footer-col {
    align-items: center;
    text-align: center;
  }
  
  .accent-line {
    margin-left: auto;
    margin-right: auto;
  }
  
  .footer-links a {
    justify-content: center;
  }
  
  .indent {
    padding-left: 0;
  }
}
</style>
