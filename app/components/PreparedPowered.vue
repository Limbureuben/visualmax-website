<template>
  <section class="prepared-powered">
    <div class="container grid-layout">
      <!-- Left Content -->
      <div class="content-side reveal-item">
        <h2 class="section-title">Prepared & Powered by</h2>
        <p class="description">
          This page highlights the partners, tools, and teams that help prepare and power our work. 
          Through trusted collaboration, we deliver reliable and high quality media services.
        </p>
      </div>

      <!-- Right Logo Grid (Stylized Text) -->
      <div class="partner-side reveal-item" style="--delay: 2">
        <div class="partner-grid">
          <div v-for="(partner, index) in partners" :key="index" class="partner-card">
            <span class="partner-text">{{ partner }}</span>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script setup lang="ts">
import { onMounted } from 'vue'

const partners = [
  'Vision media',
  'Create lab',
  'NextGen Tech',
  'Inst Vision',
  'Elite AV',
  'Motion studio'
]

onMounted(() => {
  const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        entry.target.classList.add('is-visible')
      }
    })
  }, { threshold: 0.1, rootMargin: '0px 0px -50px 0px' })
  
  document.querySelectorAll('.reveal-item').forEach(item => observer.observe(item))
})
</script>

<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@1,500&display=swap');

.prepared-powered {
  padding: 120px 0;
  background-color: var(--background);
  color: var(--text);
  border-top: 1px solid var(--card-border);
  transition: background-color 0.4s, color 0.4s;
}

.container {
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 20px;
}

.grid-layout {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 80px;
  align-items: center;
}

.section-title {
  font-size: 36px;
  font-weight: 700;
  margin-bottom: 25px;
  letter-spacing: -0.5px;
}

.description {
  font-size: 22px;
  line-height: 1.6;
  color: var(--text-dim);
  max-width: 540px;
}

.partner-grid {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 15px;
}

.partner-card {
  background: var(--card-bg);
  height: 90px;
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 20px;
  border-radius: 4px;
  border: 1px solid var(--card-border);
  transition: all 0.4s cubic-bezier(0.165, 0.84, 0.44, 1);
}

.partner-card:hover {
  background: var(--surface);
  border-color: var(--accent);
  transform: translateY(-5px);
}

.partner-text {
  font-family: 'Cormorant Garamond', serif;
  font-style: italic;
  font-size: 20px;
  color: var(--text-dim);
  text-align: center;
  white-space: nowrap;
}

/* Animations */
.reveal-item {
  opacity: 0;
  transform: translateY(30px);
  transition: all 1s cubic-bezier(0.165, 0.84, 0.44, 1);
}

.reveal-item.is-visible {
  opacity: 1;
  transform: translateY(0);
}

.reveal-item[style*="--delay"] {
  transition-delay: calc(var(--delay) * 0.2s);
}

/* Responsiveness */
@media (max-width: 1024px) {
  .grid-layout {
    grid-template-columns: 1fr;
    gap: 60px;
    text-align: center;
  }
  
  .description {
    margin: 0 auto;
  }
}

@media (max-width: 768px) {
  .prepared-powered {
    padding: 80px 0;
  }
  
  .section-title {
    font-size: 28px;
  }
  
  .description {
    font-size: 18px;
  }

  .partner-grid {
    grid-template-columns: repeat(2, 1fr);
    gap: 10px;
  }
  
  .partner-card {
    height: 70px;
  }
  
  .partner-text {
    font-size: 16px;
  }
}

@media (max-width: 480px) {
  .partner-grid {
    grid-template-columns: 1fr;
  }
}
</style>
