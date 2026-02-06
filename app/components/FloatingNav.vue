<template>
  <div>
    <!-- Navigation Overlay -->
    <div class="menu-btn-container">
      <NuxtLink to="/" class="floating-logo">
        <img src="/images/landing/logo.jpg" alt="Logo" />
      </NuxtLink>
      <button class="menu-btn" @click="toggleMenu">
        <div class="menu-icon" :class="{ 'is-active': isMenuOpen }">
          <span></span>
          <span></span>
          <span></span>
        </div>
      </button>
    </div>

    <!-- Side Menu -->
    <div class="side-menu" :class="{ 'is-open': isMenuOpen }">
      <div class="menu-overlay" @click="toggleMenu"></div>
      <nav class="menu-box">
        <NuxtLink to="/" class="menu-link" @click="toggleMenu">Home</NuxtLink>
        <div class="menu-group">
          <span class="group-label">Our Services</span>
          <div class="services-submenu">
             <NuxtLink to="/services/photography" class="sub-link" @click="toggleMenu">Photography</NuxtLink>
             <NuxtLink to="/services/videography" class="sub-link" @click="toggleMenu">Videography</NuxtLink>
             <NuxtLink to="/services/creative-design" class="sub-link" @click="toggleMenu">Creative Design</NuxtLink>
             <NuxtLink to="/services/live-streaming" class="sub-link" @click="toggleMenu">Live Streaming</NuxtLink>
             <NuxtLink to="/services/podcasting" class="sub-link" @click="toggleMenu">Podcasting</NuxtLink>
             <NuxtLink to="/services/led-rental" class="sub-link" @click="toggleMenu">LED Rental</NuxtLink>
          </div>
        </div>
        <NuxtLink to="/team" class="menu-link" @click="toggleMenu">About Us</NuxtLink>
        <NuxtLink to="/contact" class="menu-link" @click="toggleMenu">Contact</NuxtLink>
        
        <div class="menu-footer">
          <span class="m-label">Get in touch</span>
          <p>+255 714 686 167</p>
        </div>
      </nav>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref } from 'vue'

const isMenuOpen = ref(false)
const toggleMenu = () => {
  isMenuOpen.value = !isMenuOpen.value
}
</script>

<style scoped>
/* Floating Navigation */
.menu-btn-container {
  position: fixed;
  top: 30px;
  left: 60px;
  right: 60px;
  display: flex;
  justify-content: space-between;
  align-items: center;
  z-index: 2000;
  pointer-events: none; /* Allow clicking through container */
}

.floating-logo, .menu-btn {
  pointer-events: all; /* Re-enable for children */
}

.floating-logo img {
  height: 48px;
  transition: transform 0.3s;
  background: var(--card-border);
  padding: 5px;
  border-radius: 8px;
  backdrop-filter: blur(5px);
}

.floating-logo:hover img {
  transform: scale(1.05);
}

.menu-btn {
  width: 50px;
  height: 50px;
  background: #EF4056;
  border-radius: 50%;
  border: none;
  display: flex;
  align-items: center;
  justify-content: center;
  cursor: pointer;
  box-shadow: 0 10px 30px rgba(239, 64, 86, 0.4);
  transition: all 0.3s;
}

.menu-btn:hover {
  transform: scale(1.1);
  background: #ff5a6e;
}

.menu-icon {
  width: 20px;
  height: 12px;
  position: relative;
}

.menu-icon span {
  display: block;
  width: 100%;
  height: 2px;
  background: #fff;
  position: absolute;
  transition: all 0.3s;
}

.menu-icon span:nth-child(1) { top: 0; }
.menu-icon span:nth-child(2) { top: 5px; }
.menu-icon span:nth-child(3) { top: 10px; }

.menu-icon.is-active span:nth-child(1) { transform: translateY(5px) rotate(45deg); }
.menu-icon.is-active span:nth-child(2) { opacity: 0; }
.menu-icon.is-active span:nth-child(3) { transform: translateY(-5px) rotate(-45deg); }

/* Side Menu Overlay */
.side-menu {
  position: fixed;
  inset: 0;
  z-index: 1500;
  visibility: hidden;
  pointer-events: none;
}

.side-menu.is-open {
  visibility: visible;
  pointer-events: all;
}

.menu-overlay {
  position: absolute;
  inset: 0;
  background: var(--background);
  opacity: 0;
  transition: opacity 0.5s;
}

.side-menu.is-open .menu-overlay { opacity: 1; }

.menu-box {
  position: absolute;
  top: 0;
  right: 0;
  width: 400px;
  height: 100%;
  background: var(--surface);
  padding: 120px 60px;
  display: flex;
  flex-direction: column;
  align-items: center; /* Center items horizontally */
  justify-content: center; /* Center items vertically */
  transform: translateX(100%);
  transition: transform 0.6s cubic-bezier(0.165, 0.84, 0.44, 1);
}

.side-menu.is-open .menu-box { transform: translateX(0); }

.menu-link {
  font-size: 28px;
  font-weight: 600;
  color: var(--text);
  text-decoration: none;
  margin-bottom: 25px;
  transition: all 0.4s cubic-bezier(0.165, 0.84, 0.44, 1);
  opacity: 0;
  transform: translateY(20px);
  letter-spacing: 1px;
  width: 100%;
  position: relative;
  text-align: left;
}

.menu-link:hover::after {
  width: 40px;
}

.menu-group {
  width: 100%;
  margin-bottom: 30px;
  opacity: 0;
  transform: translateY(20px);
  transition: all 0.4s cubic-bezier(0.165, 0.84, 0.44, 1);
  transition-delay: 0.4s;
}

.side-menu.is-open .menu-group {
  opacity: 1;
  transform: translateY(0);
}

.group-label {
  display: block;
  font-size: 12px;
  text-transform: uppercase;
  letter-spacing: 3px;
  color: #EF4056;
  font-weight: 700;
  margin-bottom: 15px;
}

.services-submenu {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 15px;
  margin-left: 10px;
}

.sub-link {
  font-size: 16px;
  color: var(--text-dim);
  text-decoration: none;
  transition: all 0.3s;
  display: block;
}

.sub-link:hover {
  color: var(--text);
  transform: translateX(5px);
}

.side-menu.is-open .menu-link {
  opacity: 1;
  transform: translateY(0);
}

/* Stagger link entry */
.menu-link:nth-of-type(1) { transition-delay: 0.3s; }
.menu-group { transition-delay: 0.4s; }
.menu-link:nth-of-type(2) { transition-delay: 0.5s; }
.menu-link:nth-of-type(3) { transition-delay: 0.6s; }

.menu-link:hover {
  color: #EF4056;
}

.menu-footer {
  margin-top: auto;
  border-top: 1px solid var(--card-border);
  padding-top: 40px;
  text-align: center;
  width: 100%;
}

.m-label {
  display: block;
  font-size: 12px;
  text-transform: uppercase;
  letter-spacing: 2px;
  color: var(--text-dim-extra);
  margin-bottom: 10px;
}

.menu-footer p { font-size: 18px; font-weight: 600; }

@media (max-width: 768px) {
  .menu-btn-container { top: 20px; left: 20px; right: 20px; }
  .menu-box { width: 100%; padding: 100px 40px; }
  .menu-link { font-size: 28px; }
}
</style>
