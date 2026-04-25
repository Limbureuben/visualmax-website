<template>
  <div class="service-page">

    <main>
      <!-- Videography Hero with Slider -->
      <section class="video-hero">
        <transition-group name="slide">
          <div 
            v-for="(img, idx) in images" 
            :key="img"
            v-show="activeIndex === idx"
            class="slide-wrapper" 
          >
            <div class="video-bg-placeholder" :style="{ backgroundImage: `url(${img})` }"></div>
          </div>
        </transition-group>
        <div class="hero-overlay"></div>
        <div class="container hero-content-video reveal-item zoom-in-item">
          <span class="tag">Motion Narrative</span>
          <h1 class="hero-title">VIDEOGRAPHY</h1>
          <p>We produce high-quality video content for marketing, corporate communication, and media distribution.</p>
        </div>
      </section>

      <!-- Services List Section -->
      <section class="video-services container reveal-item">
        <div class="services-header">
           <span class="section-label">Expertise // What We Do</span>
           <h2 class="section-title">OUR VIDEO SERVICES</h2>
        </div>
        <div class="services-grid">
           <div class="service-item">
             <div class="dot"></div>
             <span>Corporate and institutional videos</span>
           </div>
           <div class="service-item">
             <div class="dot"></div>
             <span>Event videography</span>
           </div>
           <div class="service-item">
             <div class="dot"></div>
             <span>TV commercials</span>
           </div>
           <div class="service-item">
             <div class="dot"></div>
             <span>Documentary production</span>
           </div>
           <div class="service-item">
             <div class="dot"></div>
             <span>Social media and digital content</span>
           </div>
        </div>
      </section>

      <!-- Production Process -->
      <section class="production-process container reveal-item">
        <div class="process-header text-center">
          <h2 class="section-title">OUR FLOW</h2>
          <p class="section-subtitle">How we transform your vision into motion.</p>
        </div>
        
        <div class="process-steps">
          <div class="step-card">
            <span class="step-num">01</span>
            <h4>Concept & Script</h4>
            <p>We work with you to define the story, message, and visual direction before the first frame is shot.</p>
          </div>
          <div class="step-card">
            <span class="step-num">02</span>
            <h4>Production</h4>
            <p>Capturing high-resolution RAW footage using cinema-grade cameras, lighting, and sound equipment.</p>
          </div>
          <div class="step-card">
            <span class="step-num">03</span>
            <h4>Post-Production</h4>
            <p>Polishing your film through professional editing, color grading, and custom sound design.</p>
          </div>
        </div>
      </section>
    </main>
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted, onUnmounted } from 'vue'

const images = [
  '/images/ourwork/video1.png',
  '/images/ourwork/video2.png',
  '/images/ourwork/video3.png'
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
.service-page { background: var(--background); color: var(--text); min-height: 100vh; font-family: 'Poppins', sans-serif; overflow-x: hidden; transition: background-color 0.4s, color 0.4s; }
.video-hero { position: relative; height: 80vh; display: flex; align-items: center; justify-content: center; text-align: center; overflow: hidden; background: #000; }
.slide-wrapper { position: absolute; top:0; left:0; width:100%; height:110%; z-index:0; }
.video-bg-placeholder { width:100%; height:100%; background-position: center; background-size: cover; filter: brightness(1); }
.slide-enter-active, .slide-leave-active { transition: transform 1.5s ease-in-out; }
.slide-enter-from { transform: translateX(-100%); }
.slide-leave-to { transform: translateX(100%); }
.hero-overlay { position:absolute; top:0; left:0; width:100%; height:100%; background: none; z-index:1; }
.hero-content-video { position: relative; z-index: 2; }
.hero-content-video h1 { font-size: clamp(40px, 10vw, 100px); font-weight: 900; letter-spacing: -2px; margin: 10px 0; color: #FFFFFF; text-shadow: 0 0 30px rgba(0,0,0,0.5); }
.tag { font-weight: 700; color: var(--secondary); letter-spacing: 4px; text-transform: uppercase; font-size: 14px; text-shadow: 0 0 10px rgba(0,0,0,0.5); }
.hero-content-video p { position: relative; z-index: 2; color: #FFFFFF; text-shadow: 0 0 10px rgba(0,0,0,0.5); }

.container { max-width: 1240px; margin: 0 auto; padding: 0 20px; }
.section-label { color: var(--secondary); font-weight: 700; font-size: 12px; letter-spacing: 3px; text-transform: uppercase; display: block; margin-bottom: 15px; }

/* Video Services List */
.video-services { padding: 100px 0; }
.services-header { margin-bottom: 50px; text-align: left; }
.services-grid { display: grid; grid-template-columns: repeat(2, 1fr); gap: 20px; }
.service-item { display: flex; align-items: center; gap: 15px; padding: 25px; background: var(--surface); border-radius: 20px; border: 1px solid var(--card-border); transition: all 0.3s; }
.service-item:hover { border-color: var(--secondary); transform: translateX(10px); }
.dot { width: 8px; height: 8px; background: var(--secondary); border-radius: 50%; }
.service-item span { font-weight: 600; font-size: 18px; color: var(--text); }

/* Quality Promise */
.quality-promise { padding: 80px 0; }
.promise-box { background: var(--secondary); padding: 60px; border-radius: 40px; color: white; text-align: center; box-shadow: 0 20px 40px rgba(0,0,0,0.4); }
.promise-box h3 { font-size: 32px; font-weight: 800; margin-bottom: 20px; letter-spacing: 2px; }
.promise-box p { font-size: 22px; line-height: 1.6; max-width: 900px; margin: 0 auto; opacity: 0.95; font-weight: 500; }

.production-process { padding: 50px 0; }
.section-title { font-size: 48px; font-weight: 800; color: var(--text); }
.section-subtitle { color: var(--secondary); font-weight: 600; margin-top: -10px; margin-bottom: 60px; display: block; }
.process-steps { display: grid; grid-template-columns: repeat(3, 1fr); gap: 30px; }
.step-card { padding: 50px 40px; background: var(--surface); border-radius: 30px; border: 1px solid var(--card-border); text-align: left; }
.step-num { font-size: 60px; font-weight: 900; color: var(--secondary); opacity: 0.1; display: block; margin-bottom: -30px; }
.step-card h4 { font-size: 24px; font-weight: 700; margin-bottom: 20px; position: relative; }
.step-card p { color: var(--text-dim); line-height: 1.7; }

.video-showcase { padding: 100px 0; background: var(--surface); }
.showcase-box { display: grid; grid-template-columns: 1fr 1fr; gap: 60px; align-items: center; background: var(--background); border-radius: 40px; padding: 60px; }
.showcase-content h3 { font-size: 36px; margin-bottom: 20px; color: var(--text); }
.showcase-content p { color: var(--text-dim); line-height: 1.8; margin-bottom: 30px; }
.spec-list { display: flex; gap: 15px; flex-wrap: wrap; }
.spec-i { padding: 8px 15px; border: 1px solid var(--card-border); color: var(--secondary); border-radius: 30px; font-size: 14px; font-weight: 600; }
.showcase-img img { width:100%; border-radius: 30px; }

.footer-cta { padding: 150px 0; text-align: center; }
.cta-btn { background: var(--secondary); color: #fff; padding: 18px 50px; border-radius: 50px; text-decoration: none; font-weight: 600; font-size: 18px; display: inline-block; margin-bottom: 20px; transition: transform 0.3s; }
.cta-btn:hover { transform: scale(1.05); }
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

@media (max-width: 992px) {
  .process-steps { grid-template-columns: 1fr; }
  .showcase-box { grid-template-columns: 1fr; padding: 30px; }
  .services-grid { grid-template-columns: 1fr; }
}

@media (max-width: 768px) {
  .hero-content-video h1 { font-size: 50px; }
  .section-title { font-size: 32px; }
  .showcase-box { padding: 40px 20px; }
  .showcase-content h3 { font-size: 28px; }
  .footer-cta { padding: 80px 0; }
  .promise-box { padding: 40px 20px; }
  .promise-box h3 { font-size: 24px; }
  .promise-box p { font-size: 18px; }
}
</style>
