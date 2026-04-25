<template>
  <header class="header" :class="{ 'is-scrolled': isScrolled || !isHomePage, 'is-static': !isHomePage }">
    <div class="main-header">
      <div class="header-left">
        <NuxtLink to="/" class="logo-link">
          <img src="/images/landing/logo.png" alt="Visualmax" class="logo-img" />
        </NuxtLink>

        <div class="header-contact desktop-only">
          <div class="contact-item">
            <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M22 16.92V19.92C22.001 20.198 21.944 20.473 21.833 20.729C21.722 20.985 21.56 21.215 21.356 21.407C21.152 21.599 20.912 21.748 20.65 21.846C20.388 21.944 20.109 21.989 19.83 21.979C16.735 21.979 13.714 21.107 11.05 19.469C8.583 17.957 6.495 15.869 4.983 13.402C3.344 10.738 2.472 7.717 2.472 4.622C2.462 4.343 2.507 4.064 2.605 3.802C2.703 3.54 2.852 3.3 3.044 3.096C3.236 2.892 3.466 2.73 3.722 2.619C3.978 2.508 4.253 2.451 4.531 2.451H7.531C8.01 2.451 8.475 2.622 8.841 2.932C9.207 3.242 9.452 3.669 9.531 4.141C9.68 5.12 9.919 6.084 10.247 7.019C10.38 7.394 10.395 7.799 10.291 8.181C10.187 8.563 9.968 8.902 9.664 9.155L8.394 10.425C9.792 12.872 11.821 14.901 14.268 16.299L15.538 15.029C15.791 14.725 16.131 14.506 16.512 14.402C16.894 14.298 17.299 14.313 17.674 14.446C18.609 14.774 19.573 15.013 20.552 15.162C21.028 15.241 21.458 15.489 21.769 15.858C22.08 16.227 22.251 16.696 22.251 17.177V16.92Z"/></svg>
            <span>+255 714 686 167</span>
          </div>
          <div class="contact-item">
            <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"/><path d="M22 6l-10 7L2 6"/></svg>
            <span>info@visualmax.co.tz</span>
          </div>
        </div>
      </div>

      <div class="header-right">
        <nav class="nav-links desktop-only">
          <NuxtLink to="/" class="nav-link">Home</NuxtLink>
          <div class="nav-dropdown" @click.stop="toggleServices">
            <span class="nav-link">Services <span class="chevron">▾</span></span>
            <div class="dropdown-menu" v-if="isServicesOpen">
              <NuxtLink to="/services/photography" class="dropdown-item" @click="isServicesOpen = false">Photography</NuxtLink>
              <NuxtLink to="/services/videography" class="dropdown-item" @click="isServicesOpen = false">Videography</NuxtLink>
              <NuxtLink to="/services/live-streaming" class="dropdown-item" @click="isServicesOpen = false">Live Streaming</NuxtLink>
              <NuxtLink to="/services/led-rental" class="dropdown-item" @click="isServicesOpen = false">LED Rental</NuxtLink>
              <NuxtLink to="/services/podcasting" class="dropdown-item" @click="isServicesOpen = false">Podcasting</NuxtLink>
              <NuxtLink to="/services/influencer-management" class="dropdown-item" @click="isServicesOpen = false">Influencer Management</NuxtLink>
              <NuxtLink to="/services/creative-design" class="dropdown-item" @click="isServicesOpen = false">Creative Design</NuxtLink>
            </div>
          </div>

        </nav>

        <div class="header-actions">
          <button @click="$emit('open-booking')" class="booking-btn">Booking</button>
          
          <button class="theme-toggle" @click="toggleTheme" :title="isDarkMode ? 'Light Mode' : 'Dark Mode'">
             <div class="toggle-track">
               <div class="toggle-thumb">
                 <svg v-if="isDarkMode" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M21 12.79A9 9 0 1 1 11.21 3 7 7 0 0 0 21 12.79z"></path></svg>
                 <svg v-else width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="5"></circle><path d="M12 1v2m0 18v2M4.22 4.22l1.42 1.42m12.72 12.72l1.42 1.42M1 12h2m18 0h2M4.22 19.78l1.42-1.42M18.36 5.64l1.42-1.42"/></svg>
               </div>
             </div>
          </button>

          <button class="hamburger" @click="isMenuOpen = !isMenuOpen" :class="{ 'is-active': isMenuOpen }">
            <span></span><span></span><span></span>
          </button>
        </div>
      </div>
    </div>

    <!-- Mobile Menu Overlay -->
    <Transition name="fade">
      <div v-if="isMenuOpen" class="mobile-menu">
        <div class="mobile-menu-content">
          <button class="mobile-close" @click="isMenuOpen = false">×</button>
          <nav class="mobile-nav">
            <NuxtLink to="/" class="mobile-link" @click="isMenuOpen = false">Home</NuxtLink>
            <div class="mobile-group">
               <span class="mobile-label">Services</span>
               <div class="mobile-sublinks">
                 <NuxtLink to="/services/photography" class="mobile-sub" @click="isMenuOpen = false">Photography</NuxtLink>
                 <NuxtLink to="/services/videography" class="mobile-sub" @click="isMenuOpen = false">Videography</NuxtLink>
                 <NuxtLink to="/services/live-streaming" class="mobile-sub" @click="isMenuOpen = false">Live Streaming</NuxtLink>
                 <NuxtLink to="/services/led-rental" class="mobile-sub" @click="isMenuOpen = false">LED Rental</NuxtLink>
                 <NuxtLink to="/services/podcasting" class="mobile-sub" @click="isMenuOpen = false">Podcasting</NuxtLink>
                 <NuxtLink to="/services/influencer-management" class="mobile-sub" @click="isMenuOpen = false">Influencer Management</NuxtLink>
                 <NuxtLink to="/services/creative-design" class="mobile-sub" @click="isMenuOpen = false">Creative Design</NuxtLink>
               </div>
            </div>

            <button @click="$emit('open-booking'); isMenuOpen = false" class="booking-btn-mobile">Book Now</button>
          </nav>
        </div>
      </div>
    </Transition>
  </header>
</template>

<script setup lang="ts">
import { ref, computed, onMounted, onUnmounted } from 'vue'
import { useRoute } from 'vue-router'

defineEmits(['open-booking'])

const route = useRoute()
const isHomePage = computed(() => route.path === '/')

const isScrolled = ref(false)
const isMenuOpen = ref(false)
const isServicesOpen = ref(false)
const isDarkMode = ref(true)

const handleScroll = () => {
  isScrolled.value = window.scrollY > 50
}

const toggleServices = () => {
  isServicesOpen.value = !isServicesOpen.value
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
  window.addEventListener('click', () => { isServicesOpen.value = false })
  
  const savedTheme = localStorage.getItem('theme')
  if (savedTheme === 'light') isDarkMode.value = false
  updateTheme()
})

onUnmounted(() => {
  window.removeEventListener('scroll', handleScroll)
})
</script>

<style scoped>
.header {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  z-index: 2000;
  transition: all 0.4s ease;
  background: transparent;
}

.header.is-scrolled {
  background: var(--header-scrolled);
  backdrop-filter: blur(15px);
  box-shadow: 0 5px 20px rgba(0, 0, 0, 0.05);
}

.header.is-static {
  position: relative !important;
  transition: none !important;
}

.main-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 15px 60px;
  width: 100%;
  transition: all 0.4s ease;
}

.header.is-scrolled .main-header {
  padding: 8px 60px;
}

.header-left {
  display: flex;
  align-items: center;
  gap: 35px;
}

.logo-img {
  height: 120px; /* Increased from 90px */
  object-fit: contain;
  transition: all 0.4s ease;
}

.header.is-scrolled .logo-img {
  height: 80px;
}

.header-contact {
  display: flex;
  gap: 20px;
  border-left: 1px solid rgba(255, 255, 255, 0.2);
  padding-left: 25px;
  transition: all 0.4s ease;
}

.header.is-scrolled .header-contact {
  border-left-color: var(--card-border);
}

.contact-item {
  display: flex;
  align-items: center;
  gap: 8px;
  color: #FFFFFF; /* White when transparent */
  font-size: 14px;
  transition: all 0.4s ease;
}

.header.is-scrolled .contact-item {
  color: var(--text-dim);
}

.contact-item svg {
  color: var(--accent);
}

.header-right {
  display: flex;
  align-items: center;
  gap: 40px;
}

.nav-links {
  display: flex;
  gap: 35px;
  align-items: center;
}

.nav-link {
  color: #FFFFFF; /* White when transparent */
  text-decoration: none;
  font-weight: 500; /* Reduced from 700 */
  font-size: 18px; /* Increased from 17px */
  transition: all 0.4s ease;
  cursor: pointer;
  position: relative;
}

.header.is-scrolled .nav-link {
  color: var(--text);
}

.nav-link:hover {
  color: var(--accent);
}

.nav-dropdown {
  position: relative;
}

.dropdown-menu {
  position: absolute;
  top: 100%;
  right: 0;
  background: var(--background);
  min-width: 220px;
  border-radius: 12px;
  box-shadow: 0 10px 30px rgba(0,0,0,0.1);
  padding: 15px;
  display: flex;
  flex-direction: column;
  gap: 10px;
  z-index: 1000;
  margin-top: 15px;
  border: 1px solid var(--card-border);
}

.dropdown-item {
  color: var(--text);
  text-decoration: none;
  font-size: 14px;
  padding: 8px 12px;
  border-radius: 8px;
  transition: all 0.3s;
}

.dropdown-item:hover {
  background: var(--surface);
  color: var(--accent);
}

.chevron {
  font-size: 10px;
  margin-left: 4px;
}

.header-actions {
  display: flex;
  align-items: center;
  gap: 20px;
}

.booking-btn {
  background: var(--accent); /* Brand Yellow */
  color: #111;
  padding: 12px 24px;
  border-radius: 8px; /* Requested 8px */
  font-weight: 700;
  border: none;
  cursor: pointer;
  transition: all 0.3s;
  white-space: nowrap;
}

.booking-btn:hover {
  background: var(--accent); /* Hover use Yellow accent */
  transform: translateY(-2px);
  box-shadow: 0 5px 15px rgba(249, 168, 34, 0.4);
}

/* Toggle Styling */
.theme-toggle {
  background: transparent;
  border: none;
  cursor: pointer;
}

.toggle-track {
  width: 44px;
  height: 24px;
  background: var(--surface);
  border-radius: 12px;
  position: relative;
  transition: 0.3s;
  border: 1px solid var(--card-border);
}

.toggle-thumb {
  width: 18px;
  height: 18px;
  background: #FFFFFF;
  border-radius: 50%;
  position: absolute;
  top: 2px;
  left: 2px;
  display: flex;
  align-items: center;
  justify-content: center;
  transition: 0.3s cubic-bezier(0.4, 0, 0.2, 1);
  color: #000000;
}

.light-mode .toggle-thumb {
  transform: translateX(20px);
  background: var(--accent);
  color: #FFFFFF;
}

/* Mobile Menu */
.hamburger {
  display: none;
  flex-direction: column;
  gap: 4px;
  background: transparent;
  border: none;
  cursor: pointer;
}

.hamburger span {
  width: 24px;
  height: 2px;
  background: var(--text);
  transition: 0.3s;
}

.mobile-menu {
  position: fixed;
  inset: 0;
  background: var(--background);
  z-index: 3000;
  padding: 80px 20px;
  overflow-y: auto;
}

.mobile-close {
  position: absolute;
  top: 20px;
  right: 20px;
  background: transparent;
  border: none;
  font-size: 40px;
  color: var(--text);
  cursor: pointer;
}

.mobile-menu-content {
  display: flex;
  flex-direction: column;
}

.mobile-nav {
  display: flex;
  flex-direction: column;
  gap: 25px;
}

.mobile-link {
  font-size: 22px;
  font-weight: 700;
  color: var(--text);
  text-decoration: none;
}

.mobile-label {
  display: block;
  font-size: 14px;
  text-transform: uppercase;
  color: var(--accent);
  margin-bottom: 15px;
  letter-spacing: 2px;
}

.mobile-sublinks {
  display: grid;
  grid-template-columns: 1fr;
  gap: 15px;
  margin-left: 15px;
}

.mobile-sub {
  color: var(--text-dim);
  text-decoration: none;
  font-size: 18px;
}

.booking-btn-mobile {
  margin-top: 20px;
  background: var(--accent);
  color: #111;
  padding: 15px;
  border-radius: 8px;
  border: none;
  font-weight: 700;
}

@media (max-width: 1024px) {
  .nav-links { gap: 20px; }
}

@media (max-width: 850px) {
  .desktop-only { display: none; }
  .hamburger { display: flex; }
  .main-header { padding: 15px 20px; }
  .header.is-scrolled .main-header { padding: 10px 20px; }
  .header-actions { gap: 12px; }
  
  .logo-img { height: 60px; }
  .header.is-scrolled .logo-img { height: 45px; }
}

.fade-enter-active, .fade-leave-active { transition: opacity 0.3s ease; }
.fade-enter-from, .fade-leave-to { opacity: 0; }
</style>
