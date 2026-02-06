<template>
  <section class="who-we-are">
    <div class="container">
      <h2 class="section-title reveal-item">WHO WE ARE</h2>
      
      <div class="who-grid">
        <!-- Left Image -->
        <div class="who-image-col reveal-item" style="--delay: 1">
          <div class="image-wrapper">
            <img src="/images/whoweare/image1.png" alt="Creative Production" />
          </div>
        </div>

        <!-- Center Content -->
        <div class="who-content-col reveal-item" style="--delay: 2">
          <div class="content-text">
            <p>We are a creative media production company dedicated to telling powerful stories through visuals and sound.</p>
            <p>With a strong focus on quality, creativity, and reliability, we work closely with our clients to understand their vision and transform it into engaging media content.</p>
            <p>From planning and production to final delivery, we ensure every project meets high production standards.</p>
          </div>
          <NuxtLink to="/contact" class="contact-btn">Contact us</NuxtLink>
        </div>

        <!-- Right Image -->
        <div class="who-image-col reveal-item" style="--delay: 3">
          <div class="image-wrapper">
            <img src="/images/whoweare/weareimage.png" alt="Photography Expertise" />
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script setup lang="ts">
import { onMounted } from 'vue'

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
.who-we-are {
  padding: 120px 0;
  background-color: var(--background);
  color: var(--text);
  overflow: hidden;
  transition: background-color 0.4s, color 0.4s;
}

.container {
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 20px;
}

.section-title {
  text-align: center;
  font-size: 48px;
  font-weight: 700;
  margin-bottom: 80px;
  letter-spacing: 2px;
}

.who-grid {
  display: grid;
  grid-template-columns: 1fr 1.2fr 1fr;
  gap: 40px;
  align-items: center;
}

.who-image-col .image-wrapper {
  border-radius: 0; /* Boxy aesthetic as per design */
  overflow: hidden;
  height: 500px;
}

.who-image-col img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  transition: transform 0.8s cubic-bezier(0.165, 0.84, 0.44, 1);
}

.who-image-col:hover img {
  transform: scale(1.05);
}

.who-content-col {
  display: flex;
  flex-direction: column;
  gap: 30px;
  padding: 0 20px;
}

.content-text p {
  font-size: 16px;
  line-height: 1.8;
  color: var(--text-dim);
  margin-bottom: 20px;
}

.contact-btn {
  display: inline-block;
  background-color: #EF4056;
  color: #fff;
  padding: 12px 35px;
  border-radius: 50px;
  text-decoration: none;
  font-weight: 600;
  font-size: 16px;
  align-self: flex-start;
  transition: all 0.3s ease;
}

.contact-btn:hover {
  transform: scale(1.05);
  box-shadow: 0 5px 15px rgba(239, 64, 86, 0.4);
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
  .who-grid {
    grid-template-columns: 1fr;
    gap: 60px;
  }
  
  .who-image-col .image-wrapper {
    height: 400px;
  }
  
  .who-content-col {
    text-align: center;
    align-items: center;
    order: -1; /* Text first on mobile? Or follow visual flow. Design has images framing text. */
  }
}

@media (max-width: 768px) {
  .section-title {
    font-size: 32px;
    margin-bottom: 40px;
  }
  
  .who-we-are {
    padding: 80px 0;
  }
}
</style>
