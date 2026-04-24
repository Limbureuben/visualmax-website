<template>
  <div class="landing-page">

    <main class="hero-section">
      <!-- Background Slideshow -->
      <div v-for="(slide, index) in slides" :key="index" 
           class="hero-bg" 
           :class="{ 'is-active': currentSlide === index }"
           :style="{ backgroundImage: `url(${slide})` }">
      </div>
      <div class="background-overlay"></div>
      
      <div class="content-container">
        <div class="hero-content">
          <div class="accent-line"></div>
          <div class="reveal-box">
            <h1 class="hero-title">
              <span class="reveal-text">CREATIVE DESIGN</span>
              <span class="reveal-text delay-1">& VIDEO PRODUCTION</span>
            </h1>
          </div>
          <p class="hero-description">
            Full Service Media Production Company in Dar es Salaam. We specialize in Video Production, Live streaming, Professional Photography, Podcast studio services, Creative Design, and LED screen rental.
          </p>
          <div class="social-icons">
             <div>
               <a href="https://www.instagram.com/visualmax.tz" target="_blank" rel="noopener noreferrer" class="social-icon" aria-label="Instagram">
                  <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" xmlns="http://www.w3.org/2000/svg">
                    <rect x="2" y="2" width="20" height="20" rx="5" ry="5"></rect>
                    <path d="M16 11.37A4 4 0 1 1 12.63 8 4 4 0 0 1 16 11.37z"></path>
                    <line x1="17.5" y1="6.5" x2="17.51" y2="6.5"></line>
                  </svg>
               </a>
             </div>
             <div>
               <a href="https://www.linkedin.com/company/visualmax-tanzania/?viewAsMember=true" target="_blank" rel="noopener noreferrer" class="social-icon" aria-label="LinkedIn">
                 <svg width="20" height="20" viewBox="0 0 24 24" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                   <path d="M19 0H5C2.239 0 0 2.239 0 5V19C0 21.761 2.239 24 5 24H19C21.762 24 24 21.761 24 19V5C24 2.239 21.762 0 19 0ZM8 19H5V8H8V19ZM6.5 6.732C5.534 6.732 4.75 5.942 4.75 4.968C4.75 3.994 5.534 3.204 6.5 3.204C7.466 3.204 8.25 3.994 8.25 4.968C8.25 5.942 7.466 6.732 6.5 6.732ZM20 19H17V13.396C17 10.028 13 10.283 13 13.396V19H10V8H13V9.765C14.396 7.179 20 6.988 20 12.241V19Z"/>
                 </svg>
               </a>
             </div>
             <div>
               <a href="https://www.x.com/visualmax_tz" target="_blank" rel="noopener noreferrer" class="social-icon" aria-label="X (Twitter)">
                 <svg width="20" height="20" viewBox="0 0 24 24" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                   <path d="M18.244 2.25h3.308l-7.227 8.26 8.502 11.24H16.17l-5.214-6.817L4.99 21.75H1.68l7.73-8.835L1.254 2.25H8.08l4.713 6.231zm-1.161 17.52h1.833L7.084 4.126H5.117z"/>
                 </svg>
               </a>
             </div>
             <div>
               <a href="https://www.facebook.com/visualmaxtanzania" target="_blank" rel="noopener noreferrer" class="social-icon" aria-label="Facebook">
                 <svg width="20" height="20" viewBox="0 0 24 24" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                     <path d="M24 12.073C24 5.405 18.627 0 12 0C5.373 0 0 5.405 0 12.073C0 18.1 4.388 23.094 10.125 24V15.563H7.078V12.073H10.125V9.429C10.125 6.425 11.917 4.761 14.658 4.761C15.97 4.761 17.344 4.996 17.344 4.996V7.948H15.83C14.34 7.948 13.875 8.873 13.875 9.822V12.073H17.203L16.67 15.563H13.875V24C19.613 23.094 24 18.1 24 12.073Z"/>
                 </svg>
               </a>
             </div>
          </div>
        </div>

      </div>
    </main>

  </div>
</template>

<script setup lang="ts">
import { ref, onMounted, onUnmounted } from 'vue'

const isMenuOpen = ref(false)
const isScrolled = ref(false)
const isDarkMode = ref(true)
const isBookingModalOpen = ref(false)
const isServicesDropdownOpen = ref(false)

const currentSlide = ref(0)
const slides = [
  '/images/ourwork/creative2.png',
  '/images/ourwork/pod2.png',
  '/images/ourwork/stream3.png',
  '/images/ourwork/photo1.png'
]

let slideInterval: any = null

const openBookingModal = () => {
  isBookingModalOpen.value = true
}

const closeBookingModal = () => {
  isBookingModalOpen.value = false
}

const handleScroll = () => {
  isScrolled.value = window.scrollY > 50
}

const toggleMenu = () => {
  isMenuOpen.value = !isMenuOpen.value
}

const toggleServicesDropdown = (event?: Event) => {
  if (event) event.stopPropagation()
  isServicesDropdownOpen.value = !isServicesDropdownOpen.value
}

const toggleTheme = () => {
  isDarkMode.value = !isDarkMode.value
  updateTheme()
}

const updateTheme = () => {
  if (isDarkMode.value) {
    document.documentElement.classList.remove('light-mode')
    localStorage.setItem('theme', 'dark')
  } else {
    document.documentElement.classList.add('light-mode')
    localStorage.setItem('theme', 'light')
  }
}

onMounted(() => {
  window.addEventListener('scroll', handleScroll)
  
  const savedTheme = localStorage.getItem('theme')
  if (savedTheme === 'light') {
    isDarkMode.value = false
  }
  updateTheme()

  // Close dropdown on outside click
  window.addEventListener('click', () => {
    isServicesDropdownOpen.value = false
  })

  slideInterval = setInterval(() => {
    currentSlide.value = (currentSlide.value + 1) % slides.length
  }, 9000)
})

onUnmounted(() => {
  if (slideInterval) clearInterval(slideInterval)
})
</script>

<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap');

/* Reset & Base Styles */
* {
  box-sizing: border-box;
}

.landing-page {
  width: 100%;
  min-height: 100vh;
  position: relative;
  font-family: 'Poppins', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif;
  color: var(--text);
  overflow-x: hidden;
  background-color: var(--background); /* Fallback */
  transition: background-color 0.4s, color 0.4s;
}

.top-bar-content {
  width: 100%;
  max-width: 1200px;
  padding: 0 60px;/* Styles removed - using global header */
}

.mobile-nav-link {
  color: var(--text);
  text-decoration: none;
  font-size: 26px; /* Slightly reduced */
  font-weight: 700; /* Increased weight for better visibility */
  transition: all 0.3s;
  position: relative;
  letter-spacing: 1px;
}

/* Removed ::after pseudo-element to remove underline effect */

.mobile-nav-link:hover {
  color: var(--accent);
  transform: translateX(5px); /* Slight shift instead of underline */
}

.mobile-menu-group {
  width: 100%;
  display: flex;
  flex-direction: column;
  gap: 15px;
  align-items: center;
}

.mobile-group-label {
  font-size: 14px;
  font-weight: 700;
  text-transform: uppercase;
  color: var(--accent);
  letter-spacing: 2px;
}

.mobile-services-grid {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 15px;
  width: 100%;
}

.mobile-sub-link {
  color: var(--text-dim);
  text-decoration: none;
  font-size: 16px;
  font-weight: 500;
  transition: color 0.3s;
  text-align: center;
}

.mobile-sub-link:hover {
  color: var(--accent);
}

.mobile-contact-info {
  margin-top: 50px;
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 15px;
}

.email-info {
  font-size: 16px;
  font-weight: 500;
  color: var(--text-dim);
}

/* Hero Section */
.hero-section {
  position: relative;
  width: 100%;
  height: 100vh;
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 0 60px;
  overflow: hidden; /* Important for containing the zoom */
}

.hero-bg {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-size: cover;
  background-position: center;
  background-repeat: no-repeat;
  z-index: 0;
  opacity: 0;
  transition: opacity 1.5s ease-in-out, transform 20s ease-in-out;
  transform: scale(1);
}

.hero-bg.is-active {
  opacity: 1;
  transform: scale(1.1);
}

.background-overlay {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: rgba(0, 0, 0, 0.5); 
  z-index: 1;
  transition: background-color 0.4s;
}

.light-mode .background-overlay {
  background: rgba(0, 0, 0, 0.1); /* Reduced opacity for light mode to avoid white wash */
}

.content-container {
  position: relative;
  z-index: 2;
  width: 100%;
  /* Removed max-width to align strictly with header padding */
  display: flex;
  justify-content: flex-start; /* Changed from space-between to align items closer */
  gap: 330px; /* Increased gap as requested (not too close, not too far) */
  align-items: center;
  margin-top: 60px; /* Offset for header */
}

.hero-content {
  max-width: 800px; /* Increased width to make content larger/more attractive */
  display: flex;
  flex-direction: column;
  gap: 25px;
}

.accent-line {
  width: 80px;
  height: 6px;
  background-color: var(--accent);
  border-radius: 3px;
  margin-bottom: 5px;
}

.reveal-box {
  overflow: hidden;
}

.reveal-text {
  display: block;
  transform: translateY(100%);
  animation: revealUp 1s cubic-bezier(0.77, 0, 0.175, 1) forwards;
}

.hero-title {
  font-size: 72px;
  line-height: 1.1;
  font-weight: 700;
  color: #FFFFFF;
  text-transform: uppercase;
  margin: 0;
}

@keyframes revealUp {
  0% { transform: translateY(100%); }
  100% { transform: translateY(0); }
}

.hero-description {
  font-size: 20px;
  line-height: 1.6;
  color: rgba(255, 255, 255, 0.8);
  margin: 0;
  max-width: 700px;
}

.delay-1 { animation-delay: 0.2s; }
.delay-2 { animation-delay: 0.4s; }
.delay-3 { animation-delay: 0.6s; }

.social-icons {
  display: flex;
  gap: 15px;
  margin-top: 30px;
}

.social-icon {
    display: flex;
    align-items: center;
    justify-content: center;
    background: rgba(255, 255, 255, 0.1);
    color: #FFFFFF;
    width: 36px;
    height: 36px;
    border-radius: 50%;
    transition: all 0.4s cubic-bezier(0.165, 0.84, 0.44, 1);
}

.social-icon:hover {
    background: var(--accent);
    transform: scale(1.2) translateY(-5px);
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.4);
}

.hero-actions {
  display: flex;
  align-items: center;
  transform: translateY(-70px); /* Move play button up slightly */
}

/* Fade In Animations */
.reveal-item {
  opacity: 0;
  transform: translateY(30px);
  animation: fadeUpReveal 1.2s cubic-bezier(0.165, 0.84, 0.44, 1) forwards;
}

.accent-line { animation-delay: 0.2s; }
.hero-title { animation-delay: 0.4s; }
.hero-description { animation-delay: 0.6s; }
.social-icons { animation-delay: 0.8s; }
.hero-actions { animation-delay: 1s; }

@keyframes fadeUpReveal {
  to {
    opacity: 1;
    transform: translateY(0);
  }
}


/* Responsiveness */
@media (max-width: 1024px) {
    .hero-title {
        font-size: 48px;
    }
    .play-circle {
        width: 80px;
        height: 80px;
    }
}

@media (max-width: 768px) {
  .content-container {
      flex-direction: column; /* Changed from column-reverse to put text at the top */
      gap: 40px;
      margin-top: 0;
  }

  .hero-content {
      text-align: center;
      align-items: center;
  }
  
  .hero-section {
      padding: 0 20px;
      height: auto;
      min-height: 100vh;
      padding-top: 100px;
      padding-bottom: 50px;
  }

  .accent-line {
      margin: 0 auto 10px;
  }

  .hero-title {
      font-size: 36px;
  }
  
  .hero-description {
      font-size: 16px;
  }
  
  .social-icons {
      justify-content: center;
  }

  .hero-actions {
      transform: translateY(0); /* Reset desktop transform on mobile */
  }
}
</style>
