<template>
  <div class="landing-page">
    <header class="header" :class="{ 'is-scrolled': isScrolled }">
      <div class="logo-container">
        <!-- Using the requested logo image -->
        <img src="/images/landing/logo.jpg" alt="Logo" class="logo-img" />
      </div>

      <nav class="nav-links">
        <a href="/" class="nav-link active">Home</a>
        <a href="#services" class="nav-link">Services</a>
        <NuxtLink to="/team" class="nav-link">About us</NuxtLink>
        <NuxtLink to="/contact" class="nav-link">Contact us</NuxtLink>
      </nav>

      <div class="contact-menu-container">
        <div class="contact-info">
          <svg width="20" height="20" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M22 16.92V19.92C22.001 20.198 21.944 20.473 21.833 20.729C21.722 20.985 21.56 21.215 21.356 21.407C21.152 21.599 20.912 21.748 20.65 21.846C20.388 21.944 20.109 21.989 19.83 21.979C16.735 21.979 13.714 21.107 11.05 19.469C8.583 17.957 6.495 15.869 4.983 13.402C3.344 10.738 2.472 7.717 2.472 4.622C2.462 4.343 2.507 4.064 2.605 3.802C2.703 3.54 2.852 3.3 3.044 3.096C3.236 2.892 3.466 2.73 3.722 2.619C3.978 2.508 4.253 2.451 4.531 2.451H7.531C8.01 2.451 8.475 2.622 8.841 2.932C9.207 3.242 9.452 3.669 9.531 4.141C9.68 5.12 9.919 6.084 10.247 7.019C10.38 7.394 10.395 7.799 10.291 8.181C10.187 8.563 9.968 8.902 9.664 9.155L8.394 10.425C9.792 12.872 11.821 14.901 14.268 16.299L15.538 15.029C15.791 14.725 16.131 14.506 16.512 14.402C16.894 14.298 17.299 14.313 17.674 14.446C18.609 14.774 19.573 15.013 20.552 15.162C21.028 15.241 21.458 15.489 21.769 15.858C22.08 16.227 22.251 16.696 22.251 17.177V16.92Z" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
          </svg>
          <span class="phone-number">+255 714 686 167</span>
        </div>

        <!-- Theme Toggle Switcher -->
        <button class="theme-toggle" @click="toggleTheme" :title="isDarkMode ? 'Switch to Light Mode' : 'Switch to Dark Mode'">
          <div class="toggle-track">
            <div class="toggle-thumb">
              <svg v-if="isDarkMode" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                <path d="M21 12.79A9 9 0 1 1 11.21 3 7 7 0 0 0 21 12.79z"></path>
              </svg>
              <svg v-else width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                <circle cx="12" cy="12" r="5"></circle>
                <line x1="12" y1="1" x2="12" y2="3"></line>
                <line x1="12" y1="21" x2="12" y2="23"></line>
                <line x1="4.22" y1="4.22" x2="5.64" y2="5.64"></line>
                <line x1="18.36" y1="18.36" x2="19.78" y2="19.78"></line>
                <line x1="1" y1="12" x2="3" y2="12"></line>
                <line x1="21" y1="12" x2="23" y2="12"></line>
                <line x1="4.22" y1="19.78" x2="5.64" y2="18.36"></line>
                <line x1="18.36" y1="5.64" x2="19.78" y2="4.22"></line>
              </svg>
            </div>
          </div>
        </button>

        <button class="menu-btn" @click="toggleMenu">
          <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path v-if="!isMenuOpen" d="M3 12H21" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
            <path v-if="!isMenuOpen" d="M3 6H21" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
            <path v-if="!isMenuOpen" d="M3 18H21" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
            <path v-if="isMenuOpen" d="M18 6L6 18" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
            <path v-if="isMenuOpen" d="M6 6L18 18" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
          </svg>
        </button>
      </div>
    </header>

    <!-- Mobile Menu Overlay -->
    <div class="mobile-menu" :class="{ 'is-open': isMenuOpen }">
      <nav class="mobile-nav-links">
        <a href="/" class="mobile-nav-link" @click="toggleMenu">Home</a>
        <div class="mobile-menu-group">
          <span class="mobile-group-label">Our Services</span>
          <div class="mobile-services-grid">
            <NuxtLink to="/services/photography" class="mobile-sub-link" @click="toggleMenu">Photography</NuxtLink>
            <NuxtLink to="/services/videography" class="mobile-sub-link" @click="toggleMenu">Videography</NuxtLink>
            <NuxtLink to="/services/creative-design" class="mobile-sub-link" @click="toggleMenu">Creative Design</NuxtLink>
            <NuxtLink to="/services/live-streaming" class="mobile-sub-link" @click="toggleMenu">Live Streaming</NuxtLink>
            <NuxtLink to="/services/podcasting" class="mobile-sub-link" @click="toggleMenu">Podcasting</NuxtLink>
            <NuxtLink to="/services/led-rental" class="mobile-sub-link" @click="toggleMenu">LED Rental</NuxtLink>
          </div>
        </div>
        <NuxtLink to="/team" class="mobile-nav-link" @click="toggleMenu">About us</NuxtLink>
        <NuxtLink to="/contact" class="mobile-nav-link" @click="toggleMenu">Contact us</NuxtLink>
      </nav>
      <div class="mobile-contact-info">
        <span class="phone-number">+255 714 686 167</span>
      </div>
    </div>

    <main class="hero-section">
      <!-- Background Image with Zoom Animation -->
      <div class="hero-bg"></div>
      <div class="background-overlay"></div>
      
      <div class="content-container">
        <div class="hero-content">
          <div class="accent-line reveal-item"></div>
          <h1 class="hero-title reveal-item">
            CREATIVE DESIGN <br />
            & VIDEO PRODUCTION
          </h1>
          <p class="hero-description reveal-item">
            Full Service Media Production Company in Dar es Salaam. We specialize in Video Production, Live streaming, Professional Photography, Podcast studio services, Creative Design, and LED screen rental.
          </p>

          <div class="social-icons reveal-item">
             <!-- Instagram Icon -->
            <a href="#" class="social-icon">
                <svg width="20" height="20" viewBox="0 0 24 24" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                    <path d="M12 2.163C15.204 2.163 15.584 2.175 16.85 2.232C18.114 2.29 18.973 2.503 19.724 2.795C20.5 3.097 21.157 3.504 21.81 4.157C22.463 4.81 22.87 5.467 23.172 6.243C23.464 6.994 23.677 7.853 23.734 9.118C23.791 10.383 23.803 10.764 23.803 13.968C23.803 17.172 23.791 17.553 23.734 18.818C23.677 20.083 23.464 20.942 23.172 21.693C22.87 22.469 22.463 23.126 21.81 23.779C21.157 24.432 20.5 24.839 19.724 25.141C18.973 25.433 18.114 25.646 16.85 25.704C15.584 25.761 15.204 25.773 12 25.773C8.796 25.773 8.416 25.761 7.15 25.704C5.886 25.646 5.027 25.433 4.276 25.141C3.5 24.839 2.843 24.432 2.19 23.779C1.537 23.126 1.13 22.469 0.828 21.693C0.536 20.942 0.323 20.083 0.266 18.818C0.209 17.553 0.197 17.172 0.197 13.968C0.197 10.764 0.209 10.383 0.266 9.118C0.323 7.853 0.536 6.994 0.828 6.243C1.13 5.467 1.537 4.81 2.19 4.157C2.843 3.504 3.5 3.097 4.276 2.795C5.027 2.503 5.886 2.29 7.15 2.232C8.416 2.175 8.796 2.163 12 2.163ZM12 0C8.741 0 8.333 0.014 7.053 0.072C5.775 0.13 4.902 0.333 4.14 0.63C3.353 0.936 2.686 1.348 2.019 2.015C1.352 2.682 0.94 3.349 0.634 4.136C0.337 4.898 0.134 5.771 0.076 7.049C0.018 8.329 0.004 8.737 0.004 11.996C0.004 15.255 0.018 15.663 0.076 16.943C0.134 18.221 0.337 19.094 0.634 19.856C0.94 20.643 1.352 21.31 2.019 21.977C2.686 22.644 3.353 23.056 4.14 23.362C4.902 23.659 5.775 23.862 7.053 23.92C8.333 23.978 8.741 23.992 12 23.992C15.259 23.992 15.667 23.978 16.947 23.92C18.225 23.862 19.098 23.659 19.86 23.362C20.647 23.056 21.314 22.644 21.981 21.977C22.648 21.31 23.06 20.643 23.366 19.856C23.663 19.094 23.866 18.221 23.924 16.943C23.982 15.663 23.996 15.255 23.996 11.996C23.996 8.737 23.982 8.329 23.924 7.049C23.866 5.771 23.663 4.898 23.366 4.136C23.06 3.349 22.648 2.682 21.981 2.015C21.314 1.348 20.647 0.936 19.86 0.63C19.098 0.333 18.225 0.13 16.947 0.072C15.667 0.014 15.259 0 12 0Z"/>
                    <path d="M12 5.838C8.597 5.838 5.838 8.597 5.838 11.999C5.838 15.401 8.597 18.16 12 18.16C15.403 18.16 18.162 15.401 18.162 11.999C18.162 8.597 15.403 5.838 12 5.838ZM12 16C9.791 16 8 14.21 8 12C8 9.79 9.791 8 12 8C14.209 8 16 9.79 16 12C16 14.21 14.209 16 12 16Z"/>
                    <path d="M18.406 4.155C17.61 4.155 16.965 4.8 16.965 5.596C16.965 6.392 17.61 7.037 18.406 7.037C19.202 7.037 19.847 6.392 19.847 5.596C19.847 4.8 19.202 4.155 18.406 4.155Z"/>
                </svg>
            </a>
            <!-- LinkedIn Icon -->
            <a href="#" class="social-icon">
                <svg width="20" height="20" viewBox="0 0 24 24" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                  <path d="M19 0H5C2.239 0 0 2.239 0 5V19C0 21.761 2.239 24 5 24H19C21.762 24 24 21.761 24 19V5C24 2.239 21.762 0 19 0ZM8 19H5V8H8V19ZM6.5 6.732C5.534 6.732 4.75 5.942 4.75 4.968C4.75 3.994 5.534 3.204 6.5 3.204C7.466 3.204 8.25 3.994 8.25 4.968C8.25 5.942 7.466 6.732 6.5 6.732ZM20 19H17V13.396C17 10.028 13 10.283 13 13.396V19H10V8H13V9.765C14.396 7.179 20 6.988 20 12.241V19Z"/>
                </svg>
            </a>
            <!-- Facebook Icon -->
             <a href="#" class="social-icon">
                <svg width="20" height="20" viewBox="0 0 24 24" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                    <path d="M24 12.073C24 5.405 18.627 0 12 0C5.373 0 0 5.405 0 12.073C0 18.1 4.388 23.094 10.125 24V15.563H7.078V12.073H10.125V9.429C10.125 6.425 11.917 4.761 14.658 4.761C15.97 4.761 17.344 4.996 17.344 4.996V7.948H15.83C14.34 7.948 13.875 8.873 13.875 9.822V12.073H17.203L16.67 15.563H13.875V24C19.613 23.094 24 18.1 24 12.073Z"/>
                </svg>
            </a>
          </div>
        </div>

        <div class="hero-actions reveal-item">
           <button class="play-btn">
             <div class="play-circle">
               <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                 <path d="M8 5V19L19 12L8 5Z" fill="#EF4056"/>
               </svg>
             </div>
           </button>
        </div>
      </div>
    </main>
  </div>
</template>

<script setup lang="ts">
import { ref } from 'vue'

const isMenuOpen = ref(false)
const isScrolled = ref(false)
const isDarkMode = ref(true)

const handleScroll = () => {
  isScrolled.value = window.scrollY > 50
}

const toggleMenu = () => {
  isMenuOpen.value = !isMenuOpen.value
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

import { onMounted, onUnmounted } from 'vue'

onMounted(() => {
  window.addEventListener('scroll', handleScroll)
  
  const savedTheme = localStorage.getItem('theme')
  if (savedTheme === 'light') {
    isDarkMode.value = false
  }
  updateTheme()
})

onUnmounted(() => {
  window.removeEventListener('scroll', handleScroll)
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

/* Header */
.header {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  display: grid;
  grid-template-columns: 1fr auto 1fr;
  align-items: center;
  padding: 30px 60px;
  z-index: 100;
  background: transparent;
  transition: all 0.5s cubic-bezier(0.165, 0.84, 0.44, 1);
}

.header.is-scrolled {
  padding: 15px 60px;
  background: var(--header-scrolled);
  backdrop-filter: blur(10px);
  box-shadow: 0 5px 20px rgba(0, 0, 0, 0.5);
}

.logo-container {
  display: flex;
  justify-content: flex-start;
}

.logo-img {
    height: 40px; /* Adjust based on actual logo ratio */
    object-fit: contain;
}

.nav-links {
  display: flex;
  gap: 30px;
  align-items: center;
}

.nav-link {
  color: var(--nav-link);
  text-decoration: none;
  font-size: 16px;
  font-weight: 500;
  transition: color 0.3s;
  white-space: nowrap;
}

.nav-link:hover, .nav-link.active {
  color: var(--text);
}

.contact-menu-container {
  display: flex;
  align-items: center;
  justify-content: flex-end;
  gap: 25px;
}

.contact-info {
  display: flex;
  align-items: center;
  gap: 10px;
}

.phone-number {
  font-size: 16px;
  font-weight: 500;
  color: var(--text);
  white-space: nowrap;
}

.menu-btn {
  background-color: #EF4056; /* The pinkish-red from the design */
  border: none;
  width: 45px;
  height: 45px;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  cursor: pointer;
  transition: transform 0.2s, background-color 0.2s;
  z-index: 101;
}

.menu-btn:hover {
  transform: scale(1.05);
}

/* Theme Toggle */
.theme-toggle {
  background: transparent;
  border: none;
  padding: 0;
  cursor: pointer;
  display: flex;
  align-items: center;
  transition: transform 0.2s;
  z-index: 101;
}

.theme-toggle:hover {
  transform: scale(1.1);
}

.toggle-track {
  width: 44px;
  height: 24px;
  background: rgba(255, 255, 255, 0.1);
  border-radius: 12px;
  position: relative;
  transition: all 0.3s;
  border: 1px solid rgba(255, 255, 255, 0.2);
}

.light-mode .toggle-track {
  background: rgba(0, 0, 0, 0.05);
  border-color: rgba(0, 0, 0, 0.1);
}

.toggle-thumb {
  width: 20px;
  height: 20px;
  background: #fff;
  border-radius: 50%;
  position: absolute;
  top: 1px;
  left: 1px;
  display: flex;
  align-items: center;
  justify-content: center;
  transition: transform 0.3s cubic-bezier(0.4, 0, 0.2, 1), background-color 0.3s;
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
  color: #000;
}

.light-mode .toggle-thumb {
  transform: translateX(20px);
  background: #EF4056;
  color: #fff;
}

/* Mobile Menu */
.mobile-menu {
  position: fixed;
  top: 0;
  right: -100%;
  width: 100%;
  height: 100vh;
  background-color: var(--surface);
  z-index: 99;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  transition: right 0.4s cubic-bezier(0.4, 0, 0.2, 1);
}

.mobile-menu.is-open {
  right: 0;
}

.mobile-nav-links {
  display: flex;
  flex-direction: column;
  gap: 30px;
  align-items: center;
}

.mobile-nav-link {
  color: var(--text);
  text-decoration: none;
  font-size: 26px; /* Slightly reduced */
  font-weight: 500;
  transition: all 0.3s;
  position: relative;
  letter-spacing: 1px;
}

.mobile-nav-link::after {
  content: "";
  position: absolute;
  bottom: -5px;
  left: 50%;
  width: 0;
  height: 2px;
  background: #EF4056;
  transition: all 0.3s;
  transform: translateX(-50%);
}

.mobile-nav-link:hover {
  color: #EF4056;
}

.mobile-nav-link:hover::after {
  width: 40px;
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
  color: #EF4056;
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
  color: #EF4056;
}

.mobile-contact-info {
  margin-top: 50px;
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 10px;
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
  background-image: url('/images/landing/landingimage.jpg');
  background-size: cover;
  background-position: center;
  background-repeat: no-repeat;
  z-index: 0;
  animation: backgroundZoom 20s infinite alternate ease-in-out;
}

@keyframes backgroundZoom {
  from { transform: scale(1); }
  to { transform: scale(1.1); }
}

.background-overlay {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: rgba(0, 0, 0, 0.4); 
  z-index: 1;
  transition: background-color 0.4s;
}

.light-mode .background-overlay {
  background: rgba(255, 255, 255, 0.4);
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
  background-color: #EF4056;
  border-radius: 3px;
  margin-bottom: 5px;
}

.hero-title {
  font-size: 72px; /* Increased font size */
  line-height: 1.1;
  font-weight: 700;
  color: var(--text);
  text-transform: uppercase;
  margin: 0;
  transform: scale(0.9);
  opacity: 0;
  animation: heroZoomIn 1.5s cubic-bezier(0.34, 1.56, 0.64, 1) forwards;
  animation-delay: 0.4s;
}

@keyframes heroZoomIn {
  to {
    transform: scale(1);
    opacity: 1;
  }
}

.hero-description {
  font-size: 20px; /* Increased font size */
  line-height: 1.6;
  color: var(--text-dim);
  margin: 0;
  max-width: 700px; /* Increased text width */
}

.social-icons {
  display: flex;
  gap: 15px;
  margin-top: 30px;
}

.social-icon {
    display: flex;
    align-items: center;
    justify-content: center;
    background: var(--card-border);
    color: var(--text);
    width: 36px;
    height: 36px;
    border-radius: 50%;
    transition: all 0.4s cubic-bezier(0.165, 0.84, 0.44, 1);
}

.social-icon:hover {
    background: #EF4056;
    transform: scale(1.2) translateY(-5px);
    box-shadow: 0 5px 15px rgba(239, 64, 86, 0.4);
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

.play-btn {
  background: transparent;
  border: none;
  cursor: pointer;
  padding: 0;
  transition: transform 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
}

.play-btn:hover {
  transform: scale(1.1);
}

.play-circle {
  width: 100px;
  height: 100px;
  border-radius: 50%;
  border: 1px solid var(--text);
  display: flex;
  align-items: center;
  justify-content: center;
  background: rgba(0, 0, 0, 0.2);
  backdrop-filter: blur(4px);
  transition: all 0.4s ease;
}

.play-btn:hover .play-circle {
  background: rgba(239, 64, 86, 0.2);
  border-color: #EF4056;
  box-shadow: 0 0 30px rgba(239, 64, 86, 0.3);
}

.play-circle svg {
    width: 60px;
    height: 60px;
    margin-left: 5px; /* Visual balance */
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
  .header {
    padding: 20px;
    display: flex; /* Override grid on mobile */
    justify-content: space-between;
  }
  
  .nav-links, .contact-info {
    display: none; /* Hide nav links and desktop contact info on mobile */
  }

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
