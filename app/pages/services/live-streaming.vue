<template>
  <div class="service-page">

    <main>
      <!-- Live Streaming Hero with Slider -->
      <section class="streaming-hero">
        <transition-group name="slide">
          <div 
            v-for="(img, idx) in images" 
            :key="img"
            v-show="activeIndex === idx"
            class="slide-wrapper" 
          >
            <div class="hero-bg" :style="{ backgroundImage: `url(${img})` }"></div>
          </div>
        </transition-group>
        <div class="hero-overlay"></div>
        <div class="container reveal-item zoom-in-item">
          <span class="tag">Zero Latency</span>
          <h1 class="hero-title">LIVE STREAMING</h1>
          <p>Global reach. Real-time broadcast. Unmatched reliability.</p>
        </div>
      </section>

      <section class="streaming-content container">
        <div class="stream-intro reveal-item">
          <h2>The Future of <span class="dim">Broadcast</span></h2>
          <p>Visualmax provides professional multi-camera live streaming solutions for everything from intimate corporate meetings to stadium-sized concerts.</p>
        </div>

        <div class="stream-details-grid">
           <!-- Broadcast Platforms -->
           <div class="stream-block reveal-item" style="--delay: 1">
             <span class="section-label">Reach // We Broadcast To</span>
             <h3 class="block-title">Seamless Global Distribution</h3>
             <ul class="feature-list">
               <li><span class="dot"></span> YouTube</li>
               <li><span class="dot"></span> Facebook</li>
               <li><span class="dot"></span> Zoom</li>
               <li><span class="dot"></span> Microsoft Teams</li>
               <li><span class="dot"></span> Event Websites</li>
             </ul>
           </div>

           <!-- System Features -->
           <div class="stream-block reveal-item" style="--delay: 2">
             <span class="section-label">Technology // Our System Includes</span>
             <h3 class="block-title">Studio-Grade Reliability</h3>
             <ul class="feature-list highlight">
               <li><span class="dot"></span> Live camera switching</li>
               <li><span class="dot"></span> On-screen titles and branding</li>
               <li><span class="dot"></span> Professional audio mixing</li>
               <li><span class="dot"></span> HD recording for replay</li>
             </ul>
           </div>
        </div>

        <div class="stream-capabilities-v2 reveal-item" style="--delay: 3">
           <div class="cap-card-v2"><span>4K Signal</span></div>
           <div class="cap-card-v2"><span>12 Channels</span></div>
           <div class="cap-card-v2"><span>Bonded IP</span></div>
           <div class="cap-card-v2"><span>Simulcast</span></div>
        </div>
      </section>
    </main>
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted, onUnmounted } from 'vue'

const images = [
  '/images/ourwork/stream1.png',
  '/images/ourwork/stream2.png',
  '/images/ourwork/stream3.png',
  '/images/ourwork/stream4.png'
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

.streaming-hero { height: 60vh; display: flex; align-items: center; justify-content: center; text-align: center; position: relative; overflow: hidden; background: #000; }
.slide-wrapper { position: absolute; top:0; left:0; width:100%; height:110%; z-index:0; }
.hero-bg { width:100%; height:100%; background-position: center; background-size: cover; filter: brightness(1); }
.slide-enter-active, .slide-leave-active { transition: transform 1.5s ease-in-out; }
.slide-enter-from { transform: translateX(-100%); }
.slide-leave-to { transform: translateX(100%); }
.hero-overlay { position:absolute; top:0; left:0; width:100%; height:100%; background: none; z-index:1; }
.hero-content-streaming { position: relative; z-index: 2; }
.streaming-hero h1 { font-size: clamp(40px, 8vw, 80px); font-weight: 800; margin-top: 10px; text-shadow: 0 0 30px rgba(0,0,0,0.5); color: #FFFFFF; }
.tag { color: var(--accent); font-weight: 700; letter-spacing: 4px; text-transform: uppercase; font-size: 14px; text-shadow: 0 0 10px rgba(0,0,0,0.5); }
.streaming-hero p { position: relative; z-index: 2; color: #FFFFFF; text-shadow: 0 0 10px rgba(0,0,0,0.5); }

.container { max-width: 1240px; margin: 0 auto; padding: 0 40px; }
.section-label { color: var(--secondary); font-weight: 700; font-size: 12px; letter-spacing: 3px; text-transform: uppercase; display: block; margin-bottom: 25px; }

.streaming-content { padding: 100px 0; }
.stream-intro { text-align: center; max-width: 800px; margin: 0 auto 80px; }
.stream-intro h2 { font-size: 52px; margin-bottom: 25px; font-weight: 800; color: var(--text); }
.dim { color: var(--text-dim-extra); }
.stream-intro p { font-size: 20px; line-height: 1.8; color: var(--text-dim); }

.stream-details-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 40px; margin-bottom: 80px; }
.stream-block { padding: 80px 60px; background: var(--surface); border-radius: 40px; border: 1px solid var(--card-border); transition: all 0.4s; display: flex; flex-direction: column; align-items: flex-start; text-align: left; }
.stream-block:hover { border-color: var(--secondary); transform: translateY(-10px); box-shadow: 0 30px 60px rgba(0,0,0,0.15); }
.block-title { font-size: 32px; font-weight: 800; margin-bottom: 40px; line-height: 1.2; letter-spacing: -1px; color: var(--text); }

.feature-list { list-style: none; padding:0; margin:0; display: flex; flex-direction: column; gap: 20px; width: 100%; }
.feature-list li { display: flex; align-items: center; gap: 15px; font-size: 18px; font-weight: 600; color: var(--text-dim); border-bottom: 1px solid var(--card-border); padding-bottom: 15px; }
.feature-list li:last-child { border-bottom: none; }
.feature-list.highlight li { color: var(--text); }
.dot { width: 8px; height: 8px; background: var(--secondary); border-radius: 50%; flex-shrink: 0; transition: transform 0.3s; }
.stream-block:hover .dot { transform: scale(1.5); }

.stream-capabilities-v2 { display: grid; grid-template-columns: repeat(4, 1fr); gap: 20px; }
.cap-card-v2 { padding: 25px; background: var(--surface); border-radius: 20px; text-align: center; border: 1px solid var(--card-border); font-weight: 800; color: var(--secondary); font-size: 14px; text-transform: uppercase; letter-spacing: 1px; }

.reveal-item[style*="--delay"] { transition-delay: calc(var(--delay) * 0.1s); }

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
  .stream-details-grid { grid-template-columns: 1fr; gap: 30px; }
  .stream-capabilities-v2 { grid-template-columns: 1fr 1fr; }
}

@media (max-width: 768px) {
  .container { padding: 0 20px; }
  .streaming-hero { height: 50vh; }
  .streaming-hero h1 { font-size: 42px; }
  .streaming-content { padding: 60px 0; }
  .stream-intro h2 { font-size: 32px; }
  .stream-intro p { font-size: 17px; }
  .stream-block { padding: 40px 30px; border-radius: 30px; }
  .block-title { font-size: 24px; margin-bottom: 30px; }
  .feature-list li { font-size: 16px; gap: 10px; }
  .stream-capabilities-v2 { gap: 12px; }
  .cap-card-v2 { padding: 18px 10px; font-size: 11px; }
}
</style>
