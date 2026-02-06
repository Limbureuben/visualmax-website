<template>
  <section id="services" class="services-section" ref="sectionRef">
    <div class="container">
      <h2 class="section-title reveal-item">OUR SERVICES</h2>
      
      <div class="services-grid">
        <!-- Column 1: Service List -->
        <div class="services-list-container">
          <ul class="services-list">
            <li class="service-item reveal-item" style="--delay: 1">
              <NuxtLink to="/services/photography" class="service-link">
                <span class="service-name">Photography</span>
                <span class="view-indicator">View</span>
                <span class="arrow">→</span>
              </NuxtLink>
            </li>
            <li class="service-item highlight reveal-item" style="--delay: 2">
              <NuxtLink to="/services/videography" class="service-link">
                <span class="dot"></span>
                <span class="service-name">Videography</span>
                <span class="view-indicator">View</span>
                <span class="arrow">→</span>
              </NuxtLink>
            </li>
            <li class="service-item reveal-item" style="--delay: 3">
              <NuxtLink to="/services/creative-design" class="service-link">
                <span class="service-name">Creative design</span>
                <span class="view-indicator">View</span>
                <span class="arrow">→</span>
              </NuxtLink>
            </li>
            <li class="service-item reveal-item" style="--delay: 4">
              <NuxtLink to="/services/live-streaming" class="service-link">
                <span class="service-name">Live streaming</span>
                <span class="view-indicator">View</span>
                <span class="arrow">→</span>
              </NuxtLink>
            </li>
            <li class="service-item reveal-item" style="--delay: 5">
              <NuxtLink to="/services/podcasting" class="service-link">
                <span class="service-name">Podcasting</span>
                <span class="view-indicator">View</span>
                <span class="arrow">→</span>
              </NuxtLink>
            </li>
            <li class="service-item reveal-item" style="--delay: 6">
              <NuxtLink to="/services/led-rental" class="service-link">
                <span class="service-name">LED Rental for events</span>
                <span class="view-indicator">View</span>
                <span class="arrow">→</span>
              </NuxtLink>
            </li>
          </ul>
        </div>

        <!-- Column 2: Description & CTA -->
        <div class="services-content reveal-item" style="--delay: 7">
          <div class="description-container">
            <p class="service-description">
              We bring stories to life through high-quality media production. From concept to final delivery, we create compelling visuals and audio that connect brands with their audience
            </p>
            <!-- <p class="service-description">
              We produce visually engaging videos that communicate your message clearly and creatively. From concept development to filming and post-production, we focus on storytelling, quality visuals, and professional execution for marketing, events, and digital platforms.
            </p> -->
          </div>
          <button class="cta-button">Get in touch</button>
        </div>

        <!-- Column 3: Featured Image -->
        <div class="services-image-container reveal-item" style="--delay: 8">
          <img 
            src="/images/ourwork/work2.jpeg" 
            alt="Our Services" 
            class="service-image"
          />
        </div>
      </div>
    </div>
  </section>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue'

const sectionRef = ref<HTMLElement | null>(null)

onMounted(() => {
  const observer = new IntersectionObserver((entries) => {
    entries.forEach((entry) => {
      if (entry.isIntersecting) {
        entry.target.classList.add('is-visible')
        observer.unobserve(entry.target)
      }
    })
  }, { threshold: 0.1 })

  if (sectionRef.value) {
    const revealItems = sectionRef.value.querySelectorAll('.reveal-item')
    revealItems.forEach((item) => observer.observe(item))
  }
})
</script>

<style scoped>
.services-section {
  background-color: var(--background);
  color: var(--text);
  padding: 100px 60px;
  min-height: 100vh;
  display: flex;
  align-items: center;
  font-family: 'Poppins', sans-serif;
  transition: background-color 0.4s, color 0.4s;
}

.container {
  width: 100%;
  max-width: 1400px;
  margin: 0 auto;
}

.section-title {
  font-size: 48px;
  font-weight: 600;
  margin-bottom: 60px;
  letter-spacing: 1px;
}

.services-grid {
  display: grid;
  grid-template-columns: 1fr 1.2fr 1fr;
  gap: 60px;
  align-items: flex-start;
}

.services-list {
  list-style: none;
  padding: 0;
  margin: 0;
  display: flex;
  flex-direction: column;
  gap: 25px;
}

.service-item {
  font-size: 24px;
  color: var(--text-dim-extra);
  position: relative;
  cursor: pointer;
  transition: all 0.4s cubic-bezier(0.165, 0.84, 0.44, 1);
}

.service-link {
  color: inherit;
  text-decoration: none;
  display: flex;
  align-items: center;
  justify-content: space-between;
  width: 100%;
  padding: 10px 0;
}

.service-name {
  display: flex;
  align-items: center;
}

.service-name::before {
  content: "•";
  margin-right: 15px;
  font-size: 18px;
  transition: transform 0.3s ease;
}

.service-item.highlight .service-name::before {
  display: none;
}

.view-indicator {
  font-size: 12px;
  text-transform: uppercase;
  letter-spacing: 2px;
  color: #EF4056;
  opacity: 0;
  transform: translateX(-10px);
  transition: all 0.4s ease;
  font-weight: 700;
}

.arrow {
  color: #EF4056;
  opacity: 0;
  transform: translateX(-20px);
  transition: all 0.4s cubic-bezier(0.165, 0.84, 0.44, 1);
  font-size: 24px;
}

.service-item:hover {
  color: var(--text);
  transform: translateX(10px);
}

.service-item:hover .view-indicator {
  opacity: 0.6;
  transform: translateX(0);
}

.service-item:hover .arrow {
  opacity: 1;
  transform: translateX(0);
}

.service-item:hover .service-name::before {
  transform: scale(1.5);
  color: #EF4056;
}

.service-item.highlight {
  color: #EF4056;
  font-weight: 500;
}

.service-item.highlight:hover {
  transform: translateX(10px) scale(1.02);
}

.dot {
  width: 6px;
  height: 6px;
  background-color: #EF4056;
  border-radius: 50%;
  margin-right: 15px;
  display: inline-block;
  transition: transform 0.3s ease;
}

.service-item:hover .dot {
  transform: scale(1.5);
}

.services-content {
  display: flex;
  flex-direction: column;
  gap: 30px;
  padding-top: 5px;
}

.description-container {
  display: flex;
  flex-direction: column;
  gap: 15px; /* Reduced space between paragraphs */
}

.service-description {
  font-size: 20px;
  line-height: 1.8;
  color: var(--text-dim);
  max-width: 500px;
}

.cta-button {
  background-color: #EF4056;
  color: #fff;
  border: none;
  padding: 18px 40px;
  font-size: 18px;
  font-weight: 500;
  border-radius: 40px;
  cursor: pointer;
  width: fit-content;
  transition: transform 0.2s ease, background-color 0.2s ease;
}

.cta-button:hover {
  background-color: #d6384a;
  transform: translateY(-2px);
}

.services-image-container {
  display: flex;
  justify-content: flex-end;
}

.service-image {
  width: 100%;
  max-width: 400px;
  border-radius: 30px;
  object-fit: cover;
  box-shadow: 0 20px 40px rgba(0, 0, 0, 0.4);
  transition: all 0.8s cubic-bezier(0.165, 0.84, 0.44, 1);
}

.service-image:hover {
  transform: scale(1.05) rotate(1deg);
  box-shadow: 0 30px 60px rgba(239, 64, 86, 0.2);
}

/* Reveal Animations */
.reveal-item {
  opacity: 0;
  transform: translateY(40px);
  transition: opacity 1.2s cubic-bezier(0.165, 0.84, 0.44, 1), 
              transform 1.2s cubic-bezier(0.165, 0.84, 0.44, 1);
  transition-delay: calc(var(--delay, 0) * 0.1s);
}

.reveal-item.is-visible {
  opacity: 1;
  transform: translateY(0);
}

/* Responsiveness */
@media (max-width: 1200px) {
  .services-grid {
    grid-template-columns: 1fr 1fr;
    gap: 40px;
  }
  .services-image-container {
    grid-column: span 2;
    justify-content: center;
    margin-top: 40px;
  }
  .service-image {
    max-width: 600px;
  }
}

@media (max-width: 992px) {
  .section-title {
    font-size: 36px;
  }
  .service-item {
    font-size: 20px;
  }
}

@media (max-width: 768px) {
  .services-section {
    padding: 60px 20px;
  }
  .services-grid {
    grid-template-columns: 1fr;
    gap: 40px;
  }
  .services-image-container {
    grid-column: auto;
  }
  .section-title {
    text-align: center;
    margin-bottom: 40px;
  }
  .services-list {
    align-items: center;
  }
  .services-content {
    align-items: center;
    text-align: center;
  }
}
</style>
