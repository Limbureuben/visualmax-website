<template>
  <div class="app-container">
    <NuxtRouteAnnouncer />
    <NuxtPage />
    <TheFooter />
  </div>
</template>

<script setup lang="ts">
import { onMounted } from 'vue'

onMounted(() => {
  // Global theme initialization
  const savedTheme = localStorage.getItem('theme')
  if (savedTheme === 'light') {
    document.documentElement.classList.add('light-mode')
  } else {
    document.documentElement.classList.remove('light-mode')
  }
})
</script>

<style>
:root {
  --background: #000000;
  --text: #ffffff;
  --accent: #EF4056;
  --surface: #0d0d0d;
  --text-dim: rgba(255,255,255,0.7);
  --text-dim-extra: rgba(255,255,255,0.4);
  --header-scrolled: rgba(13, 13, 13, 0.9);
  --card-bg: #0d0d0d;
  --card-border: rgba(255,255,255,0.05);
  --nav-link: #CCCCCC;
}

.light-mode {
  --background: #fdfdfd;
  --text: #000000;
  --surface: #f0f0f0;
  --text-dim: rgba(0,0,0,0.7);
  --text-dim-extra: rgba(0,0,0,0.5);
  --header-scrolled: rgba(255, 255, 255, 0.9);
  --card-bg: #ffffff;
  --card-border: rgba(0,0,0,0.1);
  --nav-link: #333333;
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

* {
  box-sizing: border-box;
}
</style>
