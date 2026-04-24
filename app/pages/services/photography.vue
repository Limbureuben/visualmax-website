<template>
  <div class="service-page">

    <main>
      <!-- Photography Hero with Parallax & Slider -->
      <section class="photo-hero">
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
        <div class="container hero-content-photography reveal-item zoom-in-item">
          <span class="tag">Cinematic Visuals</span>
          <h1 class="hero-title">PHOTOGRAPHY</h1>
          <p class="subtitle">The art of capturing light and emotion in a single frame.</p>
          <div class="scroll-down">
            <div class="line"></div>
          </div>
        </div>
      </section>

      <!-- Photography Details with Floating Reveal -->
      <section class="photo-details container">
        <div class="photography-grid">
           <div class="photo-text-block reveal-item">
             <span class="section-label">01 // Discovery</span>
             <h2>Exceptional Clarity. <br/><span class="accent">Timeless Stories.</span></h2>
             <p>Our photography services are designed for those who demand the highest standard of visual storytelling. We don't just take pictures; we craft environments and capture moments that define brands and legacies.</p>
             <p>Using industry-leading lighting and high-resolution sensors, we ensure every detail is preserved with absolute precision for billboard-ready quality.</p>
           </div>
           <div class="photo-image-block floating-image reveal-item">
              <div class="image-reveal-wrapper">
                <img src="/images/ourwork/workimage2.png" alt="Photography" class="large-display-img" />
              </div>
           </div>
        </div>
      </section>

      <!-- Photography Niches Section -->
      <section class="photo-niches reveal-item">
        <div class="container">
          <div class="niche-header">
            <h2 class="section-title">OUR SPECIALTIES</h2>
            <div class="h-line"></div>
          </div>
          <div class="niche-grid">
            <div class="niche-card" style="--delay: 1">
              <div class="card-num">01</div>
              <h3>Commercial</h3>
              <p>Product and brand photography that translates quality into consumer trust.</p>
            </div>
            <div class="niche-card" style="--delay: 2">
              <div class="card-num">02</div>
              <h3>Event</h3>
              <p>Comprehensive coverage of high-stakes corporate summits and summits.</p>
            </div>
            <div class="niche-card" style="--delay: 3">
              <div class="card-num">03</div>
              <h3>Fashion</h3>
              <p>Editoral-grade portraits emphasizing form, texture, and artistic vision.</p>
            </div>
          </div>
        </div>
      </section>

      <!-- Equipment / The Studio -->
       <section class="studio-section reveal-item">
         <div class="container text-center">
           <span class="section-label">02 // Equipment</span>
           <h3 class="studio-title">Equipped for Excellence</h3>
           <div class="equipment-grid">
             <div class="eq-item">
               <span class="eq-title">Premium Glass</span>
               <p>G-Master & L-Series lenses for surgical sharpness and bokeh.</p>
             </div>
             <div class="eq-item">
               <span class="eq-title">45MP Sensors</span>
               <p>Massive resolution for extreme cropping and large scale print.</p>
             </div>
             <div class="eq-item">
               <span class="eq-title">Pro Lighting</span>
               <p>Advanced strobe and constant light setups for any environment.</p>
             </div>
           </div>
         </div>
       </section>
    </main>
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted, onUnmounted } from 'vue'

const images = [
  '/images/ourwork/photo1.png',
  '/images/ourwork/photo2.png',
  '/images/ourwork/photo3.png'
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
.service-page { padding-top: 96px; background: var(--background); color: var(--text); min-height: 100vh; font-family: 'Poppins', sans-serif; overflow-x: hidden; transition: background-color 0.4s, color 0.4s; }

.menu-footer p { font-size: 18px; font-weight: 600; }

/* Hero Section */
.photo-hero { position: relative; height: 100vh; display: flex; align-items: center; justify-content: center; text-align: center; overflow: hidden; background: #000; }
.slide-wrapper { position: absolute; top:0; left:0; width:100%; height:110%; z-index:0; }
.hero-bg { width:100%; height:100%; background-position: center; background-size: cover; filter: brightness(0.8); }
.slide-enter-active, .slide-leave-active { transition: transform 1.5s ease-in-out; }
.slide-enter-from { transform: translateX(-100%); }
.slide-leave-to { transform: translateX(100%); }
.hero-overlay { position:absolute; top:0; left:0; width:100%; height:100%; background: none; z-index:1; }
.hero-content-photography { position: relative; z-index: 2; margin-top: -50px; }
.hero-content-photography h1 { font-size: clamp(60px, 15vw, 160px); font-weight: 900; letter-spacing: -4px; margin: 10px 0; line-height: 0.9; color: #FFFFFF; text-shadow: 0 0 30px rgba(0,0,0,0.5); }
.tag { font-weight: 700; color: var(--accent); letter-spacing: 6px; text-transform: uppercase; font-size: 14px; display: block; margin-bottom: 20px; text-shadow: 0 0 10px rgba(0,0,0,0.5); }
.subtitle { font-size: 24px; color: #FFFFFF; max-width: 600px; margin: 0 auto; text-shadow: 0 0 10px rgba(0,0,0,0.5); }

.scroll-down { margin-top: 60px; display: flex; flex-direction: column; align-items: center; }
.scroll-down .line { width: 1px; height: 80px; background: var(--accent); }

/* Details Section */
.container { max-width: 1200px; margin: 0 auto; padding: 0 20px; }
.photo-details { padding: 150px 0; }
.photography-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 100px; align-items: center; }
.section-label { color: var(--secondary); font-weight: 700; font-size: 12px; letter-spacing: 3px; text-transform: uppercase; display: block; margin-bottom: 15px; }
.photo-text-block h2 { font-size: 52px; margin-bottom: 30px; line-height: 1.1; font-weight: 800; }
.accent { color: var(--accent); }
.photo-text-block p { font-size: 18px; line-height: 1.8; color: var(--text-dim); margin-bottom: 25px; }

/* Image Reveal */
.image-reveal-wrapper { overflow: hidden; border-radius: 40px; position: relative; }
.image-reveal-wrapper::after { content: ""; position: absolute; top: 0; left: 0; width: 100%; height: 100%; background: var(--secondary); transform: translateY(100%); transition: transform 0.8s cubic-bezier(0.165, 0.84, 0.44, 1); }
.reveal-item.is-visible .image-reveal-wrapper::after { transform: translateY(-100%); }
.large-display-img { width: 100%; transform: scale(1.1); transition: transform 1.2s cubic-bezier(0.165, 0.84, 0.44, 1); }
.reveal-item.is-visible .large-display-img { transform: scale(1); }

/* Niches Section */
.photo-niches { padding: 120px 0; background: var(--surface); }
.niche-header { margin-bottom: 80px; text-align: center; }
.section-title { font-size: 48px; font-weight: 800; text-transform: uppercase; letter-spacing: -1px; }
.h-line { width: 80px; height: 4px; background: var(--accent); margin: 20px auto; }
.niche-grid { display: grid; grid-template-columns: repeat(3, 1fr); gap: 30px; }
.niche-card { padding: 50px 40px; background: var(--background); border: 1px solid var(--card-border); transition: all 0.4s; position: relative; }
.niche-card:hover { transform: translateY(-15px); border-color: rgba(249, 168, 34, 0.4); }
.card-num { color: var(--accent); font-weight: 900; font-size: 14px; margin-bottom: 20px; }
.niche-card h3 { font-size: 24px; margin-bottom: 15px; }
.niche-card p { color: var(--text-dim-extra); line-height: 1.6; font-size: 15px; }

/* Studio Section */
.studio-section { padding: 150px 0; background: var(--background); position: relative; }
.studio-title { font-size: 48px; font-weight: 800; margin-bottom: 60px; }
.equipment-grid { display: grid; grid-template-columns: repeat(3, 1fr); gap: 40px; }
.eq-item { padding: 40px; background: var(--surface); border-radius: 24px; text-align: left; border: 1px solid var(--card-border); transition: background 0.3s; }
.eq-item:hover { background: rgba(255,255,255,0.05); }
.eq-title { display: block; font-size: 20px; font-weight: 700; color: var(--accent); margin-bottom: 15px; }
.eq-item p { color: var(--text-dim); font-size: 16px; line-height: 1.6; }

/* Portfolio Grid */
.gallery-preview { padding: 100px 0; }
.gallery-info { margin-bottom: 60px; }
.gallery-masonry { display: grid; grid-template-columns: 1fr 1fr; gap: 40px; }
.masonry-item img { width: 100%; border-radius: 30px; transition: transform 0.5s; cursor: pointer; }
.masonry-item img:hover { transform: scale(1.02); }

/* CTA Section */
.footer-cta { padding: 180px 0; text-align: center; background: var(--surface); }
.cta-inner h2 { font-size: 64px; font-weight: 900; margin-bottom: 20px; letter-spacing: -2px; }
.cta-inner p { font-size: 20px; color: var(--text-dim); margin-bottom: 50px; }
.cta-btn { background: var(--accent); color: #fff; padding: 22px 60px; border-radius: 60px; text-decoration: none; font-weight: 700; font-size: 18px; display: inline-block; transition: all 0.4s; box-shadow: 0 20px 40px rgba(249, 168, 34, 0.2); }
.cta-btn:hover { transform: translateY(-5px) scale(1.02); box-shadow: 0 25px 50px rgba(249, 168, 34, 0.4); }
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
  transform: scale(0.8);
  opacity: 0;
  transition: all 1.5s cubic-bezier(0.34, 1.56, 0.64, 1);
}

.zoom-in-item.is-visible .hero-title {
  transform: scale(1);
  opacity: 1;
}

.reveal-item[style*="--delay"] { transition-delay: calc(var(--delay) * 0.1s); }

@media (max-width: 992px) {
  .photography-grid { grid-template-columns: 1fr; gap: 60px; }
  .niche-grid { grid-template-columns: 1fr; }
  .equipment-grid { grid-template-columns: 1fr; }
  .hero-content-photography h1 { font-size: 80px; }
}

@media (max-width: 768px) {
  .hero-content-photography h1 { font-size: 56px; letter-spacing: -2px; }
  .subtitle { font-size: 16px; padding: 0 10px; }
  .photo-details { padding: 60px 0; }
  .photo-text-block h2 { font-size: 30px; line-height: 1.2; }
  .photography-grid { gap: 30px; }
  .section-title { font-size: 28px; }
  .niche-grid { gap: 15px; }
  .niche-card { padding: 30px 20px; }
  .cta-inner h2 { font-size: 32px; }
  .cta-inner p { font-size: 15px; margin-bottom: 30px; }
  .gallery-masonry { grid-template-columns: 1fr; gap: 15px; }
}
</style>
