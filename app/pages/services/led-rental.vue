<template>
  <div class="service-page">
    <FloatingNav />

    <main>
      <!-- LED Hero with Parallax -->
      <section class="led-hero">
        <div class="hero-bg" :style="{ transform: `translateY(${scrollY * 0.4}px) scale(1.1)` }"></div>
        <div class="hero-overlay"></div>
        <div class="container led-hero-content reveal-item zoom-in-item">
          <span class="tag">Grand Spectacle</span>
          <h1 class="hero-title">LED RENTAL</h1>
          <p class="subtitle">Bigger visuals. Brighter impact. Seamless stage transformation.</p>
          <div class="scroll-down">
            <div class="line"></div>
          </div>
        </div>
      </section>

      <!-- LED Details with Floating Reveal -->
      <section class="led-details container">
        <div class="led-grid">
           <div class="led-text-block reveal-item">
             <span class="section-label">01 // Visual Tech</span>
             <h2>Unrivaled Brightness. <br/><span class="accent">Deep Immersion.</span></h2>
             <p>Visualmax offers high-resolution P2.5 indoor and outdoor LED solutions that turn any space into a high-impact environment. Our tiles are calibrated for color accuracy and deep blacks, ensuring your content stands out even in direct sunlight.</p>
             <p>From curved configurations to massive flat walls, our modular hardware allows for complete creative freedom in stage design.</p>
             <div class="spec-table">
                <div class="s-row"><span>Pixel Pitch</span><span>2.5mm High-Res</span></div>
                <div class="s-row"><span>Brightness</span><span>5500 Nits Alpha</span></div>
                <div class="s-row"><span>Refresh Rate</span><span>3840Hz Pro</span></div>
             </div>
           </div>
           <div class="led-image-block floating-image reveal-item">
              <div class="image-reveal-wrapper">
                <img src="/images/services/light2.jpeg" alt="LED Screen" class="large-display-img" />
              </div>
           </div>
        </div>
      </section>

      <!-- Niches Section -->
      <section class="led-niches reveal-item">
        <div class="container">
          <div class="niche-header">
            <h2 class="section-title">OUR APPLICATIONS</h2>
            <div class="h-line"></div>
          </div>
          <div class="niche-grid">
            <div class="niche-card" style="--delay: 1">
              <div class="card-num">01</div>
              <h3>Corporate Summits</h3>
              <p>Crystal clear presentations and branding that commands attention in any ballroom.</p>
            </div>
            <div class="niche-card" style="--delay: 2">
              <div class="card-num">02</div>
              <h3>Live Concerts</h3>
              <p>Dynamic backdrop pixel mapping that syncs perfectly with your lighting show.</p>
            </div>
            <div class="niche-card" style="--delay: 3">
              <div class="card-num">03</div>
              <h3>Trade Shows</h3>
              <p>Custom LED pillars and booth integrations that drive traffic to your brand.</p>
            </div>
          </div>
        </div>
      </section>

      <!-- Technical Precision -->
       <section class="tech-section reveal-item">
         <div class="container text-center">
           <span class="section-label">02 // Reliability</span>
           <h3 class="tech-title">Built for the Big Stage</h3>
           <div class="tech-grid">
             <div class="t-item">
               <span class="t-title">Dual Backup</span>
               <p>Redundant signal and power paths to ensure zero downtime during your event.</p>
             </div>
             <div class="t-item">
               <span class="t-title">Expert Setup</span>
               <p>Professional technicians handling every aspect from rigging to pixel-mapping.</p>
             </div>
             <div class="t-item">
               <span class="t-title">4K Processing</span>
               <p>Novastar HDR processing for the most realistic color reproduction possible.</p>
             </div>
           </div>
         </div>
       </section>

      <!-- Footer CTA -->
      <section class="footer-cta reveal-item">
        <div class="cta-inner">
          <h2>Ready to light it up?</h2>
          <p>Let's discuss the dimensions of your next big project.</p>
          <NuxtLink to="/" class="cta-btn">Request a Quote</NuxtLink>
          <NuxtLink to="/" class="back-home">Return to Home</NuxtLink>
        </div>
      </section>
    </main>
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted, onUnmounted } from 'vue'

const scrollY = ref(0)
const handleScroll = () => {
  scrollY.value = window.scrollY
}

onMounted(() => {
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
  window.removeEventListener('scroll', handleScroll)
})
</script>

<style scoped>
.service-page { background: var(--background); color: var(--text); min-height: 100vh; font-family: 'Poppins', sans-serif; overflow-x: hidden; transition: background-color 0.4s, color 0.4s; }

/* Hero Section */
.led-hero { position: relative; height: 100vh; display: flex; align-items: center; justify-content: center; text-align: center; overflow: hidden; }
.hero-bg { position: absolute; top:0; left:0; width:100%; height:110%; background: url('/images/services/light.jpeg') center/cover; z-index: 0; will-change: transform; transition: transform 0.1s ease-out; }
.hero-overlay { position:absolute; top:0; left:0; width:100%; height:100%; background: linear-gradient(180deg, rgba(0,0,0,0.1) 0%, var(--background) 100%); z-index:1; }
.led-hero-content { position: relative; z-index: 2; margin-top: -50px; }
.led-hero-content h1 { font-size: clamp(60px, 15vw, 160px); font-weight: 900; letter-spacing: -4px; margin: 10px 0; line-height: 0.9; }
.tag { font-weight: 700; color: #EF4056; letter-spacing: 6px; text-transform: uppercase; font-size: 14px; display: block; margin-bottom: 20px; }
.subtitle { font-size: 24px; color: var(--text-dim); max-width: 600px; margin: 0 auto; }

.scroll-down { margin-top: 60px; display: flex; flex-direction: column; align-items: center; }
.scroll-down .line { width: 1px; height: 80px; background: linear-gradient(180deg, #EF4056 0%, transparent 100%); }

/* Details Section */
.container { max-width: 1200px; margin: 0 auto; padding: 0 20px; }
.led-details { padding: 150px 0; }
.led-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 100px; align-items: center; }
.section-label { color: #EF4056; font-weight: 700; font-size: 12px; letter-spacing: 3px; text-transform: uppercase; display: block; margin-bottom: 15px; }
.led-text-block h2 { font-size: 52px; margin-bottom: 30px; line-height: 1.1; font-weight: 800; }
.accent { color: #EF4056; }
.led-text-block p { font-size: 18px; line-height: 1.8; color: var(--text-dim); margin-bottom: 25px; }

.spec-table { background: var(--card-border); padding: 30px; border-radius: 24px; border: 1px solid var(--card-border); margin-top: 40px; }
.s-row { display: flex; justify-content: space-between; padding: 15px 0; border-bottom: 1px solid var(--card-border); }
.s-row:last-child { border-bottom: none; }
.s-row span:last-child { color: #EF4056; font-weight: 700; }

/* Image Reveal */
.image-reveal-wrapper { overflow: hidden; border-radius: 40px; position: relative; }
.image-reveal-wrapper::after { content: ""; position: absolute; top: 0; left: 0; width: 100%; height: 100%; background: #EF4056; transform: translateY(100%); transition: transform 0.8s cubic-bezier(0.165, 0.84, 0.44, 1); }
.reveal-item.is-visible .image-reveal-wrapper::after { transform: translateY(-100%); }
.large-display-img { width: 100%; transform: scale(1.1); transition: transform 1.2s cubic-bezier(0.165, 0.84, 0.44, 1); }
.reveal-item.is-visible .large-display-img { transform: scale(1); }

/* Niches Section */
.led-niches { padding: 120px 0; background: var(--surface); }
.niche-header { margin-bottom: 80px; text-align: center; }
.section-title { font-size: 48px; font-weight: 800; text-transform: uppercase; letter-spacing: -1px; }
.h-line { width: 80px; height: 4px; background: #EF4056; margin: 20px auto; }
.niche-grid { display: grid; grid-template-columns: repeat(3, 1fr); gap: 30px; }
.niche-card { padding: 50px 40px; background: var(--background); border-radius: 30px; border: 1px solid var(--card-border); transition: all 0.4s; position: relative; }
.niche-card:hover { transform: translateY(-15px); border-color: rgba(239, 64, 86, 0.4); }
.card-num { color: #EF4056; font-weight: 900; font-size: 14px; margin-bottom: 20px; }
.niche-card h3 { font-size: 24px; margin-bottom: 15px; }
.niche-card p { color: var(--text-dim-extra); line-height: 1.6; font-size: 15px; }

/* Tech Section */
.tech-section { padding: 150px 0; background: var(--background); position: relative; }
.tech-title { font-size: 48px; font-weight: 800; margin-bottom: 60px; }
.tech-grid { display: grid; grid-template-columns: repeat(3, 1fr); gap: 40px; }
.t-item { padding: 40px; background: var(--card-border); border-radius: 24px; text-align: left; border: 1px solid var(--card-border); transition: background 0.3s; }
.t-item:hover { background: rgba(255,255,255,0.05); }
.t-title { display: block; font-size: 20px; font-weight: 700; color: #EF4056; margin-bottom: 15px; }
.t-item p { color: var(--text-dim); font-size: 16px; line-height: 1.6; }

/* CTA Section */
.footer-cta { padding: 180px 0; text-align: center; background: linear-gradient(0deg, rgba(239,64,86,0.1) 0%, var(--background) 100%); }
.cta-inner h2 { font-size: 64px; font-weight: 900; margin-bottom: 20px; letter-spacing: -2px; }
.cta-inner p { font-size: 20px; color: var(--text-dim); margin-bottom: 50px; }
.cta-btn { background: #EF4056; color: #fff; padding: 22px 60px; border-radius: 60px; text-decoration: none; font-weight: 700; font-size: 18px; display: inline-block; transition: all 0.4s; box-shadow: 0 20px 40px rgba(239, 64, 86, 0.2); }
.cta-btn:hover { transform: translateY(-5px) scale(1.02); box-shadow: 0 25px 50px rgba(239, 64, 86, 0.4); }
.back-home { display: block; color: var(--text-dim-extra); text-decoration: none; margin-top: 30px; font-weight: 500; }
.back-home:hover { color: #fff; }

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
  .led-grid { grid-template-columns: 1fr; gap: 60px; }
  .niche-grid { grid-template-columns: 1fr; }
  .tech-grid { grid-template-columns: 1fr; }
}

@media (max-width: 768px) {
  .led-hero-content h1 { font-size: 56px; letter-spacing: -2px; }
  .subtitle { font-size: 16px; padding: 0 10px; }
  .led-details { padding: 60px 0; }
  .led-text-block h2 { font-size: 30px; line-height: 1.2; }
  .section-title { font-size: 28px; }
  .niche-card { padding: 30px 20px; }
  .cta-inner h2 { font-size: 32px; }
}
</style>
