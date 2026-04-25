<template>
  <div class="service-page">

    <main>
      <section class="influencer-hero">
        <div class="hero-bg"></div>
        <div class="hero-overlay"></div>
        <div class="container reveal-item zoom-in-item">
          <span class="tag">Brand Advocacy</span>
          <h1 class="hero-title">INFLUENCER MANAGEMENT</h1>
          <p>Connecting brands with authentic voices to create lasting impact.</p>
        </div>
      </section>

      <section class="influencer-content container">
        <div class="about-influencer reveal-item">
          <h2>Strategic <span class="dim">Connections</span></h2>
          <p>Influencer marketing is more than followers. It’s about trust, relevance, and impact. We help brands build credibility and reach audiences through meaningful creator collaborations that drive real engagement and conversions.</p>
        </div>

        <div class="influencer-services-grid">
           <div class="s-card reveal-item" style="--delay: 1">
             <div class="card-icon">01</div>
             <h3>Creator Sourcing</h3>
             <p>Identifying and vetting the perfect creators who align with your brand values and reach your target demographic.</p>
           </div>
           <div class="s-card reveal-item" style="--delay: 2">
             <div class="card-icon">02</div>
             <h3>Campaign Strategy</h3>
             <p>Developing creative concepts and data-driven strategies that resonate with audiences and achieve your marketing goals.</p>
           </div>
           <div class="s-card reveal-item" style="--delay: 3">
             <div class="card-icon">03</div>
             <h3>Contract Negotiation</h3>
             <p>Managing legal agreements and negotiations to ensure clear expectations and fair value for both brands and creators.</p>
           </div>
           <div class="s-card reveal-item" style="--delay: 4">
             <div class="card-icon">04</div>
             <h3>Content Coordination</h3>
             <p>Overseeing the creative process to ensure brand consistency while maintaining the creator's authentic voice.</p>
           </div>
           <div class="s-card reveal-item" style="--delay: 5">
             <div class="card-icon">05</div>
             <h3>Performance Analytics</h3>
             <p>Deep-dive reporting into campaign metrics, tracking everything from engagement rates to ROI and conversion data.</p>
           </div>
           <div class="s-card reveal-item" style="--delay: 6">
             <div class="card-icon">06</div>
             <h3>End-to-End Execution</h3>
             <p>Full-service management of the entire influencer lifecycle, from initial outreach to final reporting.</p>
           </div>
        </div>
      </section>
    </main>
  </div>
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
.service-page { background: var(--background); color: var(--text); min-height: 100vh; font-family: 'Poppins', sans-serif; transition: background-color 0.4s, color 0.4s; }

.influencer-hero { height: 60vh; display: flex; align-items: center; justify-content: center; text-align: center; position: relative; overflow: hidden; }
.hero-bg { position: absolute; top:0; left:0; width:100%; height:100%; background: url('/images/ourwork/influencer.png') center/cover; z-index: 0; filter: brightness(1); /* Made brighter to be seen clearly */ }
.hero-overlay { position:absolute; top:0; left:0; width:100%; height:100%; background: none; z-index:1; }
.influencer-hero h1 { font-size: clamp(40px, 8vw, 80px); font-weight: 800; margin-top: 10px; position: relative; z-index: 2; text-shadow: 0 0 30px rgba(0,0,0,0.5); color: #FFFFFF; }
.tag { color: var(--accent); font-weight: 700; letter-spacing: 4px; text-transform: uppercase; font-size: 14px; position: relative; z-index: 2; text-shadow: 0 0 10px rgba(0,0,0,0.5); }
.influencer-hero p { position: relative; z-index: 2; color: #FFFFFF; text-shadow: 0 0 10px rgba(0,0,0,0.5); }

.container { max-width: 1200px; margin: 0 auto; padding: 0 20px; }
.about-influencer { padding: 80px 0; text-align: center; max-width: 800px; margin: 0 auto; }
.dim { color: var(--text-dim-extra); }
.about-influencer h2 { font-size: 48px; margin-bottom: 20px; color: var(--text); }
.about-influencer p { font-size: 20px; line-height: 1.8; color: var(--text-dim); }

.influencer-services-grid { 
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
  .influencer-services-grid { grid-template-columns: repeat(2, 1fr); }
}

@media (max-width: 768px) {
  .influencer-services-grid { grid-template-columns: 1fr; }
  .about-influencer h2 { font-size: 32px; }
}
</style>
