<template>
  <div class="service-page">

    <main>
      <!-- Podcasting Hero with Parallax & Slider -->
      <section class="pod-hero">
        <transition-group name="slide">
          <div 
            v-for="(img, idx) in images" 
            :key="img"
            v-show="activeIndex === idx"
            class="slide-wrapper" 
          >
            <div class="hero-bg" :style="{ backgroundImage: `url(${img})`, transform: `translateY(${scrollY * 0.4}px) scale(1.1)` }"></div>
          </div>
        </transition-group>
        <div class="hero-overlay"></div>
        <div class="container pod-hero-content reveal-item zoom-in-item">
          <span class="tag">Sonic Narrative</span>
          <h1 class="hero-title">PODCASTING</h1>
          <p class="subtitle">Premium acoustic environments for stories that deserve to be heard.</p>
          <div class="scroll-down">
            <div class="line"></div>
          </div>
        </div>
      </section>

      <!-- Studio Details with Floating Reveal -->
      <section class="pod-details container">
        <div class="pod-grid">
           <div class="pod-text-block reveal-item">
             <span class="section-label">01 // The Environment</span>
             <h2>Unrivaled Clarity. <br/><span class="accent">Broadcast Quality.</span></h2>
             <p>Our podcast studio is a sanctuary for creators. Engineered with surgical precision, the space features multi-layered acoustic treatment and whisper-quiet ventilation to ensure your voice is captured with absolute purity.</p>
             <p>From the tactile response of our broadcast arms to the warm resonance of our pre-amps, every touchpoint is designed for comfort and professional consistency.</p>
           </div>
           <div class="pod-image-block floating-image reveal-item">
              <div class="image-reveal-wrapper">
                <img src="/images/services/podcast1.jpeg" alt="Podcast Studio" class="large-display-img" />
              </div>
           </div>
        </div>
      </section>

      <!-- Services Section (Formerly Studio Specs) -->
      <section class="pod-services reveal-item">
        <div class="container">
          <div class="services-header-pod">
            <span class="section-label">Expertise // What We Do</span>
            <h2 class="section-title">PODCAST SERVICES</h2>
            <div class="h-line"></div>
          </div>
          <div class="pod-services-grid">
            <div class="pod-service-card" style="--delay: 1">
              <div class="card-num">01</div>
              <h3>Podcast Studio Rental</h3>
              <p>Premium acoustic environments equipped with industry-standard broadcast hardware for creators.</p>
            </div>
            <div class="pod-service-card" style="--delay: 2">
              <div class="card-num">02</div>
              <h3>Audio & Video Recording</h3>
              <p>Multi-cam 4K setups and multi-track audio capture for a complete sensory experience.</p>
            </div>
            <div class="pod-service-card" style="--delay: 3">
              <div class="card-num">03</div>
              <h3>Editing & Mastering</h3>
              <p>Professional post-production to ensure your podcast sounds polished, clear, and broadcast-ready.</p>
            </div>
            <div class="pod-service-card" style="--delay: 4">
              <div class="card-num">04</div>
              <h3>Live Podcast Streaming</h3>
              <p>Broadcast your conversation in real-time to global platforms with zero latency and high stability.</p>
            </div>
          </div>
        </div>
      </section>

      <!-- The Experience -->
       <section class="experience-section reveal-item">
         <div class="container text-center">
           <span class="section-label">02 // The Process</span>
           <h3 class="experience-title">Record. Mix. Publish.</h3>
           <div class="experience-grid">
             <div class="ex-item">
               <span class="ex-title">Warm Welcome</span>
               <p>Coffee, professional lighting, and a pre-configured workflow awaiting your arrival.</p>
             </div>
             <div class="ex-item">
               <span class="ex-title">Expert Tech</span>
               <p>Our engineers handle the levels so you can focus entirely on the conversation.</p>
             </div>
             <div class="ex-item">
               <span class="ex-title">Fast Delivery</span>
               <p>Multi-track recordings and raw video files delivered within hours of session end.</p>
             </div>
           </div>
         </div>
       </section>
    </main>
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted, onUnmounted } from 'vue'
import { useSeoMeta } from '#imports'

useSeoMeta({
  title: 'Podcast Studio and Content Production | Visualmax',
  ogTitle: 'Podcast Studio and Content Production | Visualmax',
  description: 'We help organizations and creators produce professional podcasts and digital talk shows in Tanzania.',
  ogDescription: 'We help organizations and creators produce professional podcasts and digital talk shows in Tanzania.',
  keywords: 'podcast studio Tanzania, video podcast Dar es Salaam, corporate podcast production',
})

const images = [
  '/images/ourwork/pod1.png',
  '/images/ourwork/pod2.png',
  '/images/ourwork/pod3.png'
]
const activeIndex = ref(0)
let slideInterval: any

const scrollY = ref(0)
const handleScroll = () => {
  scrollY.value = window.scrollY
}

onMounted(() => {
  slideInterval = setInterval(() => {
    activeIndex.value = (activeIndex.value + 1) % images.length
  }, 9000)

  window.addEventListener('scroll', handleScroll)
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
  window.removeEventListener('scroll', handleScroll)
})
</script>

<style scoped>
.service-page { background: var(--background); color: var(--text); min-height: 100vh; overflow-x: hidden; font-family: 'Poppins', sans-serif; transition: background-color 0.4s, color 0.4s; }

/* Hero Section */
.pod-hero { position: relative; height: 60vh; display: flex; align-items: center; justify-content: center; text-align: center; overflow: hidden; background: #000; }
.slide-wrapper { position: absolute; top:0; left:0; width:100%; height:110%; z-index:0; }
.hero-bg { width:100%; height:100%; background-position: center; background-size: cover; filter: brightness(1); }
.slide-enter-active, .slide-leave-active { transition: transform 1.5s ease-in-out; }
.slide-enter-from { transform: translateX(-100%); }
.slide-leave-to { transform: translateX(100%); }
.hero-overlay { position:absolute; top:0; left:0; width:100%; height:100%; background: none; z-index:1; }
.pod-hero-content { position: relative; z-index: 2; margin-top: -50px; }
.pod-hero-content h1 { font-size: clamp(60px, 15vw, 160px); font-weight: 900; letter-spacing: -4px; margin: 10px 0; line-height: 0.9; color: #FFFFFF; text-shadow: 0 0 30px rgba(0,0,0,0.5); }
.tag { font-weight: 700; color: var(--accent); letter-spacing: 6px; text-transform: uppercase; font-size: 14px; display: block; margin-bottom: 20px; text-shadow: 0 0 10px rgba(0,0,0,0.5); }
.subtitle { font-size: 24px; color: #FFFFFF; max-width: 600px; margin: 0 auto; text-shadow: 0 0 10px rgba(0,0,0,0.5); }

.scroll-down { margin-top: 60px; display: flex; flex-direction: column; align-items: center; }
.scroll-down .line { width: 1px; height: 80px; background: var(--accent); }

/* Details Section */
.container { max-width: 1200px; margin: 0 auto; padding: 0 20px; }
.pod-details { padding: 150px 0; }
.pod-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 100px; align-items: center; }
.section-label { color: var(--accent); font-weight: 700; font-size: 12px; letter-spacing: 3px; text-transform: uppercase; display: block; margin-bottom: 15px; }
.pod-text-block h2 { font-size: 52px; margin-bottom: 30px; line-height: 1.1; font-weight: 800; }
.accent { color: var(--accent); }
.pod-text-block p { font-size: 18px; line-height: 1.8; color: var(--text-dim); margin-bottom: 25px; }

/* Image Reveal */
.image-reveal-wrapper { overflow: hidden; border-radius: 40px; position: relative; }
.image-reveal-wrapper::after { content: ""; position: absolute; top: 0; left: 0; width: 100%; height: 100%; background: var(--accent); transform: translateY(100%); transition: transform 0.8s cubic-bezier(0.165, 0.84, 0.44, 1); }
.reveal-item.is-visible .image-reveal-wrapper::after { transform: translateY(-100%); }
.large-display-img { width: 100%; transform: scale(1.1); transition: transform 1.2s cubic-bezier(0.165, 0.84, 0.44, 1); }
.reveal-item.is-visible .large-display-img { transform: scale(1); }

/* Capabilities Section (Converted to Pod Services) */
.pod-services { padding: 120px 0; background: var(--surface); }
.services-header-pod { margin-bottom: 80px; text-align: center; }
.section-title { font-size: 48px; font-weight: 800; text-transform: uppercase; letter-spacing: -1px; }
.h-line { width: 80px; height: 4px; background: var(--accent); margin: 20px auto; }
.pod-services-grid { display: grid; grid-template-columns: repeat(4, 1fr); gap: 30px; }
.pod-service-card { padding: 50px 40px; background: var(--background); border-radius: 30px; border: 1px solid var(--card-border); transition: all 0.4s; position: relative; }
.pod-service-card:hover { transform: translateY(-15px); border-color: rgba(249, 168, 34, 0.4); box-shadow: 0 20px 40px rgba(0,0,0,0.2); }
.card-num { color: var(--accent); font-weight: 900; font-size: 14px; margin-bottom: 20px; }
.pod-service-card h3 { font-size: 22px; font-weight: 700; margin-bottom: 15px; }
.pod-service-card p { color: var(--text-dim-extra); line-height: 1.6; font-size: 15px; }

/* Experience Section */
.experience-section { padding: 150px 0; background: var(--background); position: relative; }
.experience-title { font-size: 48px; font-weight: 800; margin-bottom: 60px; }
.experience-grid { display: grid; grid-template-columns: repeat(3, 1fr); gap: 40px; }
.ex-item { padding: 40px; background: var(--surface); border-radius: 24px; text-align: left; border: 1px solid var(--card-border); transition: background 0.3s; }
.ex-item:hover { background: rgba(255,255,255,0.05); }
.ex-title { display: block; font-size: 20px; font-weight: 700; color: var(--accent); margin-bottom: 15px; }
.ex-item p { color: var(--text-dim); font-size: 16px; line-height: 1.6; }

/* CTA Section */
.footer-cta { padding: 180px 0; text-align: center; background: var(--surface); }
.cta-inner h2 { font-size: 64px; font-weight: 900; margin-bottom: 20px; letter-spacing: -2px; }
.cta-inner p { font-size: 20px; color: var(--text-dim); margin-bottom: 50px; }
.cta-btn { background: var(--accent); color: #fff; padding: 22px 60px; border-radius: 60px; text-decoration: none; font-weight: 700; font-size: 18px; display: inline-block; transition: all 0.4s; box-shadow: 0 20px 40px rgba(249, 168, 34, 0.2); }
.cta-btn:hover { transform: translateY(-5px) scale(1.02); box-shadow: 0 25px 50px rgba(249, 168, 34, 0.4); }
.back-home { display: block; color: var(--text-dim-extra); text-decoration: none; margin-top: 30px; font-weight: 500; }
.back-home:hover { color: var(--text); }

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

@media (max-width: 1200px) {
  .pod-services-grid { grid-template-columns: repeat(2, 1fr); }
}

@media (max-width: 992px) {
  .pod-grid { grid-template-columns: 1fr; gap: 60px; }
  .experience-grid { grid-template-columns: 1fr; }
  .pod-services { padding: 80px 0; }
  .experience-section { padding: 80px 0; }
}

@media (max-width: 768px) {
  .pod-hero-content { margin-top: -30px; }
  .pod-hero-content h1 { font-size: clamp(48px, 12vw, 80px); letter-spacing: -2px; }
  .subtitle { font-size: 16px; padding: 0 10px; line-height: 1.6; }
  .pod-details { padding: 80px 0; }
  .pod-text-block h2 { font-size: 32px; line-height: 1.2; margin-bottom: 20px; }
  .pod-text-block p { font-size: 16px; margin-bottom: 20px; }
  
  .services-header-pod { margin-bottom: 40px; }
  .section-title { font-size: 28px; }
  .pod-services-grid { grid-template-columns: 1fr; gap: 20px; }
  .pod-service-card { padding: 40px 25px; border-radius: 24px; }
  .pod-service-card h3 { font-size: 20px; }
  
  .experience-title { font-size: 32px; margin-bottom: 40px; }
  .ex-item { padding: 30px 25px; }
  
  .footer-cta { padding: 100px 0; }
  .cta-inner h2 { font-size: 36px; }
  .cta-btn { padding: 18px 45px; font-size: 16px; }
}

@media (max-width: 480px) {
  .pod-hero-content h1 { font-size: 44px; }
  .pod-text-block h2 { font-size: 28px; }
  .experience-title { font-size: 28px; }
}
</style>
