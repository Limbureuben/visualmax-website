<template>
  <div class="service-page">

    <main>
      <section class="design-hero">
        <transition-group name="slide">
          <div 
            v-for="(img, idx) in images" 
            :key="img"
            v-show="activeIndex === idx"
            class="hero-bg" 
            :style="{ backgroundImage: `url(${img})` }"
          ></div>
        </transition-group>
        <div class="container reveal-item zoom-in-item">
          <span class="tag">Functional Art</span>
          <h1 class="hero-title">CREATIVE DESIGN</h1>
          <p>Where mathematical precision meets unbounded imagination.</p>
        </div>
      </section>

      <section class="design-content container">
        <div class="about-design reveal-item">
          <h2>Designing the <span class="dim">Future</span></h2>
          <p>We design high-impact visuals that transform how users perceive your brand. Our commitment to aesthetic excellence ensures your message is delivered with clarity and sophistication across all digital and physical touchpoints.</p>
        </div>

        <div class="design-services-grid">
           <div class="s-card reveal-item" style="--delay: 1">
             <div class="card-icon">01</div>
             <h3>Event Branding</h3>
             <p>Cohesive visual systems that define the atmosphere and identity of your corporate or social gatherings.</p>
           </div>
           <div class="s-card reveal-item" style="--delay: 2">
             <div class="card-icon">02</div>
             <h3>Digital Posters & Banners</h3>
             <p>Eye-catching digital marketing collateral designed for high conversion and maximum brand visibility.</p>
           </div>
           <div class="s-card reveal-item" style="--delay: 3">
             <div class="card-icon">03</div>
             <h3>Social Media Graphics</h3>
             <p>Dynamic, platform-optimized visuals tailored for Instagram, LinkedIn, and current digital trends.</p>
           </div>
           <div class="s-card reveal-item" style="--delay: 4">
             <div class="card-icon">04</div>
             <h3>Presentation Slides</h3>
             <p>Professional, cinema-grade slide decks that make your data compelling and your pitches unforgettable.</p>
           </div>
           <div class="s-card reveal-item" style="--delay: 5">
             <div class="card-icon">05</div>
             <h3>Display Screen Visuals</h3>
             <p>Large-format motion and static graphics optimized for LED screens and event stage backdrops.</p>
           </div>
           <div class="s-card reveal-item" style="--delay: 6">
             <div class="card-icon">06</div>
             <h3>Brand Identity Assets</h3>
             <p>The building blocks of your brand—logos, color palettes, and typography that ensure long-term consistency.</p>
           </div>
        </div>
      </section>
    </main>
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted, onUnmounted } from 'vue'

const images = [
  '/images/ourwork/creative1.png',
  '/images/ourwork/creative2.png',
  '/images/ourwork/creative3.png'
]
const activeIndex = ref(0)
let slideInterval: any

onMounted(() => {
  slideInterval = setInterval(() => {
    activeIndex.value = (activeIndex.value + 1) % images.length
  }, 9000)

  const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        entry.target.classList.add('is-visible')
      }
    })
  }, { threshold: 0.1, rootMargin: '0px 0px -50px 0px' })
  document.querySelectorAll('.reveal-item').forEach(item => observer.observe(item))
})

onUnmounted(() => {
  if (slideInterval) clearInterval(slideInterval)
})
</script>

<style scoped>
.service-page { background: var(--background); color: var(--text); min-height: 100vh; font-family: 'Poppins', sans-serif; transition: background-color 0.4s, color 0.4s; }

.design-hero { height: 60vh; display: flex; align-items: center; justify-content: center; text-align: center; background: #000; position: relative; overflow: hidden; }
.hero-bg { position: absolute; top:0; left:0; width:100%; height:110%; background-position: center; background-size: cover; z-index: 0; filter: brightness(1); }
.slide-enter-active, .slide-leave-active { transition: transform 1.5s ease-in-out; }
.slide-enter-from { transform: translateX(-100%); }
.slide-leave-to { transform: translateX(100%); }
.design-hero h1 { font-size: clamp(40px, 8vw, 80px); font-weight: 800; margin-top: 10px; color: #FFFFFF; position: relative; z-index: 2; text-shadow: 0 0 30px rgba(0,0,0,0.5); }
.tag { color: var(--accent); font-weight: 700; letter-spacing: 4px; text-transform: uppercase; font-size: 14px; position: relative; z-index: 2; text-shadow: 0 0 10px rgba(0,0,0,0.5); }
.design-hero p { position: relative; z-index: 2; color: #FFFFFF; text-shadow: 0 0 10px rgba(0,0,0,0.5); }

.container { max-width: 1200px; margin: 0 auto; padding: 0 20px; }
.about-design { padding: 80px 0; text-align: center; max-width: 800px; margin: 0 auto; }
.dim { color: var(--text-dim-extra); }
.about-design h2 { font-size: 48px; margin-bottom: 20px; color: var(--text); }
.about-design p { font-size: 20px; line-height: 1.8; color: var(--text-dim); }

.design-services-grid { 
  display: grid; 
  grid-template-columns: repeat(3, 1fr); 
  gap: 30px; 
  padding: 40px 0; 
}
.s-card { 
  padding: 40px; 
  background: var(--surface); 
  border-radius: 30px; 
  border: 1px solid var(--card-border); 
  transition: all 0.4s cubic-bezier(0.165, 0.84, 0.44, 1);
  position: relative;
  overflow: hidden;
}
.s-card:hover {
  transform: translateY(-10px);
  border-color: var(--secondary);
  box-shadow: 0 20px 40px rgba(0, 0, 0, 0.2);
}
.card-icon {
  font-size: 14px;
  font-weight: 800;
  color: var(--secondary);
  margin-bottom: 20px;
  opacity: 0.6;
}
.s-card h3 { font-size: 22px; font-weight: 700; margin-bottom: 15px; transition: color 0.3s; color: var(--text); }
.s-card:hover h3 { color: var(--secondary); }
.s-card p { color: var(--text-dim); line-height: 1.7; font-size: 15px; }

.footer-cta { padding: 150px 0; text-align: center; }
.cta-btn { background: var(--secondary); color: #fff; padding: 18px 50px; border-radius: 50px; text-decoration: none; font-weight: 600; font-size: 18px; display: inline-block; margin-bottom: 20px; transition: transform 0.3s; }
.cta-btn:hover { transform: scale(1.05); background: var(--accent); }
.back-home { display: block; color: var(--text-dim-extra); text-decoration: none; }

/* Reveal Logic */
.reveal-item { 
  opacity: 0; 
  transform: translateY(30px); 
  transition: all 1s cubic-bezier(0.25, 1, 0.5, 1); 
  will-change: transform, opacity;
}
.reveal-item.is-visible { 
  opacity: 1; 
  transform: translateY(0); 
}

/* Zoom In Animation */
.zoom-in-item .hero-title {
  transform: scale(0.85);
  opacity: 0;
  transition: all 1.5s cubic-bezier(0.34, 1.56, 0.64, 1);
}

.zoom-in-item.is-visible .hero-title {
  transform: scale(1);
  opacity: 1;
}

.reveal-item[style*="--delay"] { transition-delay: calc(var(--delay) * 0.1s); }

@media (max-width: 992px) {
  .design-services-grid { grid-template-columns: repeat(2, 1fr); }
}

@media (max-width: 768px) {
  .header { padding: 15px 20px; display: flex; justify-content: space-between; }
  .nav-links { display: none; }
  .design-services-grid { grid-template-columns: 1fr; }
  .about-design h2 { font-size: 32px; }
}
</style>
