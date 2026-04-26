<template>
  <div class="app-container">
    <TheGlobalHeader @open-booking="openBooking" />
    <NuxtRouteAnnouncer />
    <NuxtPage />
    <TheFooter />
    <BookingModal :isOpen="isBookingOpen" @close="isBookingOpen = false" />
  </div>
</template>

<script setup lang="ts">
import { onMounted, watch, nextTick } from 'vue'
import { useRoute } from 'vue-router'

const route = useRoute()
const isBookingOpen = useState('isBookingOpen', () => false)

const openBooking = () => {
  isBookingOpen.value = true
}

const setupObserver = () => {
  const revealElements = document.querySelectorAll('.reveal-on-scroll')
  
  const observerOptions = {
    threshold: 0.15,
    rootMargin: '0px 0px -50px 0px'
  }

  const revealObserver = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        entry.target.classList.add('revealed')
      } else {
        // Optional: remove class when leaving viewport to animate again on re-entry
        // Based on user request: "animate frequently when the user interact with it during scroll"
        entry.target.classList.remove('revealed')
      }
    })
  }, observerOptions)

  revealElements.forEach(el => revealObserver.observe(el))
}

onMounted(() => {
  // Global theme initialization
  const savedTheme = localStorage.getItem('theme')
  if (savedTheme === 'dark') {
    document.documentElement.classList.remove('light-mode')
  } else {
    document.documentElement.classList.add('light-mode')
  }

  // Initial observer setup
  setupObserver()
})

// Re-run observer on route change to catch new elements
watch(() => route.path, async () => {
  await nextTick()
  // Small delay to ensure DOM is fully ready if needed, though nextTick is usually enough
  setTimeout(setupObserver, 100) 
})
</script>

<style>
:root {
  /* DARK MODE (DEFAULT) */
  --background: #000000;
  --text: #FFFFFF;
  --accent: #F9A822; /* Yellow */
  --secondary: #23356E; /* Brand Blue - for buttons/borders */
  --surface: rgba(255, 255, 255, 0.05);
  --text-dim: rgba(255, 255, 255, 0.8);
  --text-dim-extra: rgba(255, 255, 255, 0.5);
  --header-scrolled: rgba(0, 0, 0, 0.95);
  --card-bg: rgba(255, 255, 255, 0.03);
  --card-border: rgba(35, 53, 110, 0.5); /* Blue borders */
  --nav-link: #FFFFFF;
  --input-bg: rgba(255, 255, 255, 0.05);
  --btn-primary: var(--secondary);
}

.light-mode {
  /* LIGHT MODE */
  --background: #FFFFFF;
  --text: #23356E;
  --accent: #F9A822;
  --secondary: #23356E;
  --surface: #f7f8fa;
  --text-dim: rgba(35, 53, 110, 0.8);
  --text-dim-extra: rgba(35, 53, 110, 0.5);
  --header-scrolled: rgba(255, 255, 255, 0.95);
  --card-bg: #FFFFFF;
  --card-border: rgba(35, 53, 110, 0.2);
  --nav-link: #23356E;
  --input-bg: #f7f8fa;
  --btn-primary: var(--secondary);
}

html {
  scroll-behavior: smooth;
}

body {
  margin: 0;
  padding: 0;
  background-color: var(--background);
  color: var(--text);
  overflow-x: hidden;
  font-family: 'Poppins', sans-serif;
  transition: background-color 0.4s cubic-bezier(0.4, 0, 0.2, 1), color 0.4s cubic-bezier(0.4, 0, 0.2, 1);
}

/* Global Reveal Animations */
.reveal-on-scroll {
  opacity: 0;
  transform: translateY(40px);
  transition: all 1s cubic-bezier(0.215, 0.61, 0.355, 1);
  will-change: transform, opacity;
}

.reveal-on-scroll.revealed {
  opacity: 1;
  transform: translateY(0);
}

.reveal-on-scroll.slide-left {
  transform: translateX(-50px);
}

.reveal-on-scroll.slide-right {
  transform: translateX(50px);
}

.reveal-on-scroll.slide-left.revealed,
.reveal-on-scroll.slide-right.revealed {
  transform: translateX(0);
}

.reveal-on-scroll.zoom-in {
  transform: scale(0.9);
}

.reveal-on-scroll.zoom-in.revealed {
  transform: scale(1);
}

/* Image Reveal Transitions */
.reveal-on-scroll img {
  transition: transform 1.5s cubic-bezier(0.165, 0.84, 0.44, 1);
  transform: scale(1.1);
}

.reveal-on-scroll.revealed img {
  transform: scale(1);
}

/* Button Micro-interactions */
button, .booking-btn, .cta-button, .explore-btn, .contact-btn {
  transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
}

button:active, .booking-btn:active, .cta-button:active, .explore-btn:active, .contact-btn:active {
  transform: scale(0.95);
}

/* Staggered delays */
.delay-100 { transition-delay: 100ms; }
.delay-200 { transition-delay: 200ms; }
.delay-300 { transition-delay: 300ms; }
.delay-400 { transition-delay: 400ms; }
.delay-500 { transition-delay: 500ms; }

.desktop-only {
  display: flex;
}

@media (max-width: 768px) {
  .desktop-only {
    display: none;
  }
}

* {
  box-sizing: border-box;
}
</style>
