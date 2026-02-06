<template>
  <section class="extension-team">
    <div class="container">
      <div class="extension-header reveal-item">
        <h2 class="main-title">EXTENSION OF YOUR TEAM!</h2>
        <h3 class="sub-title">EXPECT WE DON'T</h3>
      </div>
      
      <div class="extension-grid">
        <!-- Left Image -->
        <div class="extension-image-col reveal-item" style="--delay: 1">
          <div class="image-container">
            <img src="/images/extension/extensionimage.jpg" alt="Professional Camera Setup" />
          </div>
        </div>

        <!-- Right Content -->
        <div class="extension-content-col reveal-item" style="--delay: 2">
          <div class="content-body">
            <h4 class="highlight-text">We believe in clear communication, professional execution, and reliable delivery</h4>
            <p>We work alongside individuals, brands, and organizations to deliver professional media and creative solutions. While we are not part of your internal team, we collaborate closely with you to understand your goals and bring your vision to life.</p>
            <p class="footer-note">Creative media solutions that support your vision and deliver quality results</p>
          </div>
          <NuxtLink to="/contact" class="create-btn">Let's create</NuxtLink>
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
  }, { threshold: 0.1, rootMargin: '0px 0px -50px 0px' })
  
  document.querySelectorAll('.reveal-item').forEach(item => observer.observe(item))
})
</script>

<style scoped>
.extension-team {
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

.extension-header {
  text-align: center;
  margin-bottom: 80px;
}

.main-title {
  font-size: 56px;
  font-weight: 800;
  margin-bottom: 10px;
  letter-spacing: -1px;
}

.sub-title {
  font-size: 42px;
  font-weight: 700;
  color: var(--text);
  letter-spacing: 2px;
}

.extension-grid {
  display: grid;
  grid-template-columns: 1.2fr 1fr;
  gap: 60px;
  align-items: center;
}

.image-container {
  border-radius: 0;
  overflow: hidden;
  box-shadow: 0 20px 40px rgba(0,0,0,0.4);
}

.image-container img {
  width: 100%;
  display: block;
}

.extension-content-col {
  display: flex;
  flex-direction: column;
  gap: 35px;
}

.highlight-text {
  font-size: 20px;
  font-weight: 600;
  line-height: 1.5;
  margin-bottom: 25px;
  color: var(--text);
}

.content-body p {
  font-size: 16px;
  line-height: 1.8;
  color: var(--text-dim);
  margin-bottom: 20px;
}

.footer-note {
  font-weight: 500;
  color: var(--text-dim-extra) !important;
  margin-top: 30px;
}

.create-btn {
  display: inline-block;
  background-color: #EF4056;
  color: #fff;
  padding: 14px 40px;
  border-radius: 50px;
  text-decoration: none;
  font-weight: 600;
  font-size: 16px;
  align-self: flex-start;
  transition: all 0.3s cubic-bezier(0.165, 0.84, 0.44, 1);
}

.create-btn:hover {
  transform: translateY(-3px);
  box-shadow: 0 10px 20px rgba(239, 64, 86, 0.4);
}

/* Entry Animations */
.reveal-item {
  opacity: 0;
  transform: translateY(40px);
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
@media (max-width: 992px) {
  .extension-grid {
    grid-template-columns: 1fr;
    gap: 40px;
  }
  
  .main-title { font-size: 40px; }
  .sub-title { font-size: 30px; }
  
  .extension-content-col {
    text-align: left;
  }
}

@media (max-width: 768px) {
  .extension-team { padding: 80px 0; }
  .main-title { font-size: 32px; }
  .sub-title { font-size: 24px; }
  .highlight-text { font-size: 18px; }
}
</style>
