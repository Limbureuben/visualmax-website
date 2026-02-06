<template>
  <div class="team-page">
    <FloatingNav />

    <main>
      <!-- Team Hero Section -->
      <section class="team-hero">
        <div class="container team-container">
          <!-- Left side content -->
          <div class="hero-content reveal-item">
            <span class="tag">Our team member</span>
            <h1 class="hero-title">Our creative <br /> team member</h1>
            <p class="hero-description">
              Capturing moments that tell stories. We are a collective of designers, filmmakers, and visionaries dedicated to pushing boundaries.
            </p>
            <NuxtLink to="/#contact" class="cta-btn">Contact us</NuxtLink>
          </div>

          <!-- Right side Showcase (Carousel) -->
          <div class="team-showcase reveal-item zoom-in-item">
             <Transition name="fade-slide" mode="out-in">
               <div class="member-display" :key="currentIndex">
                 <div class="member-image-wrapper">
                   <img :src="currentMember?.image" :alt="currentMember?.name" class="member-img" />
                 </div>
                 <div class="member-details-card">
                   <h3 class="member-name">{{ currentMember?.name }}</h3>
                   <span class="member-role">{{ currentMember?.role }}</span>
                   <p class="member-bio">{{ currentMember?.bio }}</p>
                   <div class="member-socials">
                     <a href="#" class="social-link"><span class="icon">𝕏</span></a>
                     <a href="#" class="social-link"><span class="icon">f</span></a>
                     <a href="#" class="social-link"><span class="icon">ig</span></a>
                     <a href="#" class="social-link"><span class="icon">in</span></a>
                   </div>
                 </div>
               </div>
             </Transition>
             
             <!-- Navigation Arrows -->
             <div class="nav-arrows">
               <button class="arrow-btn prev" @click="prevMember" aria-label="Previous member">
                 <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                   <path d="M15 18L9 12L15 6" />
                 </svg>
               </button>
               <button class="arrow-btn next" @click="nextMember" aria-label="Next member">
                 <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                   <path d="M9 18L15 12L9 6" />
                 </svg>
               </button>
             </div>
          </div>
        </div>
      </section>

      <!-- Second Team section or stats if needed -->
      <!-- Values Section -->
      <section class="team-values container">
        <div class="values-grid">
          <div class="value-card reveal-item" style="--delay: 1">
            <div class="v-icon">✨</div>
            <h3>Innovation</h3>
            <p>We leverage the latest technology to bring your wildest ideas to life with precision and style.</p>
          </div>
          <div class="value-card reveal-item" style="--delay: 2">
            <div class="v-icon">🤝</div>
            <h3>Collaboration</h3>
            <p>Your vision, our expertise. We work as an extension of your team to ensure every detail is perfect.</p>
          </div>
          <div class="value-card reveal-item" style="--delay: 3">
            <div class="v-icon">🎯</div>
            <h3>Excellence</h3>
            <p>We don't just deliver content; we deliver results that exceed expectations and resonate with audiences.</p>
          </div>
        </div>
      </section>

      <!-- Join Us Section -->
      <section class="join-us reveal-item">
        <div class="container join-container">
          <div class="join-content">
            <h2>Work with the best.</h2>
            <p>We're always looking for fresh talent and creative minds. Think you'd be a great fit?</p>
            <NuxtLink to="/#contact" class="cta-btn secondary">View Openings</NuxtLink>
          </div>
        </div>
      </section>
    </main>
  </div>
</template>

<script setup lang="ts">
import { ref, computed, onMounted } from 'vue'

const members = [
  {
    name: 'Reuben',
    role: 'Creative Director',
    bio: 'Bridging the gap between conceptual art and digital reality through innovative storytelling and visual design.',
    image: '/images/whoweare/team.jpeg' // Reusing same for now as placeholders
  },
  {
    name: 'Neyshany',
    role: 'Production Lead',
    bio: 'Turning ideas into compelling motion and meaningful stories through creative and thoughtful visual storytelling.',
    image: '/images/whoweare/team.jpeg'
  },
  {
    name: 'Allan',
    role: 'Technical Lead',
    bio: 'Ensuring every broadcast and production meets the highest technical standards with zero-latency precision.',
    image: '/images/whoweare/team.jpeg'
  },
  {
    name: 'Juliet',
    role: 'Operations Manager',
    bio: 'Managing complex workflows and client relations to ensure seamless project delivery from concept to completion.',
    image: '/images/whoweare/team.jpeg'
  }
]

const currentIndex = ref(0) // Start with Reuben 
const currentMember = computed(() => members[currentIndex.value])

const nextMember = () => {
  currentIndex.value = (currentIndex.value + 1) % members.length
}

const prevMember = () => {
  currentIndex.value = (currentIndex.value - 1 + members.length) % members.length
}

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
.team-page {
  background-color: var(--background);
  color: var(--text);
  min-height: 100vh;
  font-family: 'Poppins', sans-serif;
  overflow-x: hidden;
  transition: background-color 0.4s, color 0.4s;
}

.team-hero {
  padding: 180px 0 120px;
  position: relative;
  min-height: 100vh;
  display: flex;
  align-items: center;
}

.container {
  max-width: 1240px;
  margin: 0 auto;
  padding: 0 40px;
}

.team-container {
  display: flex;
  align-items: center;
  justify-content: space-between;
  gap: 60px;
}

.hero-content {
  flex: 1;
  max-width: 550px;
}

.tag {
  color: #EF4056;
  font-weight: 700;
  font-size: 16px;
  text-transform: uppercase;
  margin-bottom: 20px;
  display: block;
}

.hero-title {
  font-size: clamp(40px, 6vw, 64px);
  line-height: 1.1;
  font-weight: 800;
  color: var(--text);
  margin-bottom: 30px;
}

.hero-description {
  font-size: 18px;
  color: var(--text-dim);
  line-height: 1.8;
  margin-bottom: 40px;
}

.cta-btn {
  background: #EF4056;
  color: #fff;
  padding: 16px 40px;
  border-radius: 50px;
  text-decoration: none;
  font-weight: 600;
  display: inline-block;
  transition: all 0.3s cubic-bezier(0.165, 0.84, 0.44, 1);
  box-shadow: 0 10px 30px rgba(239, 64, 86, 0.3);
}

.cta-btn:hover {
  transform: translateY(-5px);
  box-shadow: 0 15px 40px rgba(239, 64, 86, 0.5);
}

/* Team Showcase Layout (Right Side) */
.team-showcase {
  flex: 1.5;
  position: relative;
  min-height: 550px;
  display: flex;
  align-items: center;
  justify-content: flex-end;
}

.member-display {
  display: flex;
  align-items: center;
  position: relative;
  width: 100%;
  max-width: 750px;
}

.member-image-wrapper {
  position: relative;
  width: 45%; /* Slightly larger image */
  aspect-ratio: 4/5;
  min-width: 320px;
  border-radius: 4px;
  overflow: hidden;
  z-index: 1;
  box-shadow: 0 40px 100px rgba(0,0,0,0.4);
}

.member-img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  transition: transform 1.2s cubic-bezier(0.165, 0.84, 0.44, 1);
}

.team-showcase:hover .member-img {
  transform: scale(1.08);
}

.member-details-card {
  flex: 0.8; /* Reduced flex to make it smaller than the image */
  margin-left: -60px; /* Slight increase in overlap */
  background-color: var(--surface);
  padding: clamp(25px, 4vw, 45px) clamp(20px, 3vw, 40px); /* Reduced padding */
  border-radius: 4px;
  box-shadow: 40px 40px 80px rgba(0,0,0,0.1);
  z-index: 2;
  border: 1px solid var(--card-border);
  transition: all 0.5s ease;
  min-width: 300px;
}

.member-name {
  font-size: 38px;
  font-weight: 800;
  margin-bottom: 10px;
  color: var(--text);
  letter-spacing: -1px;
}

.member-role {
  color: #EF4056;
  font-weight: 700;
  font-size: 14px;
  text-transform: uppercase;
  margin-bottom: 25px;
  display: block;
}

.member-bio {
  font-size: 16px;
  color: var(--text-dim);
  line-height: 1.8;
  margin-bottom: 35px;
}

.member-socials {
  display: flex;
  gap: 15px;
}

.social-link {
  width: 40px;
  height: 40px;
  background: #000;
  color: #fff;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  text-decoration: none;
  font-weight: 700;
  font-size: 12px;
  transition: all 0.3s;
}

.light-mode .social-link {
  background: var(--text);
  color: var(--background);
}

.social-link:hover {
  background: #EF4056 !important;
  color: #fff !important;
  transform: translateY(-5px) rotate(8deg);
}

/* Member Transition */
.fade-slide-enter-active,
.fade-slide-leave-active {
  transition: all 0.5s cubic-bezier(0.165, 0.84, 0.44, 1);
}

.fade-slide-enter-from {
  opacity: 0;
  transform: translateX(30px);
}

.fade-slide-leave-to {
  opacity: 0;
  transform: translateX(-30px);
}

/* Nav Arrows */
.nav-arrows {
  position: absolute;
  width: 100%;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  display: flex;
  justify-content: space-between;
  padding: 0 10px;
  pointer-events: none;
  z-index: 10;
}

.arrow-btn {
  width: 50px;
  height: 50px;
  border-radius: 50%;
  background: var(--surface);
  border: 1px solid var(--card-border);
  color: var(--text);
  display: flex;
  align-items: center;
  justify-content: center;
  cursor: pointer;
  pointer-events: auto;
  transition: all 0.3s;
  box-shadow: 0 10px 20px rgba(0,0,0,0.1);
}

.arrow-btn:hover {
  background: #EF4056;
  color: #fff;
  border-color: #EF4056;
  transform: scale(1.1);
}

/* Values Section */
.team-values {
  padding: 100px 0;
}

.values-grid {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 30px;
}

.value-card {
  padding: 40px;
  background: var(--surface);
  border: 1px solid var(--card-border);
  border-radius: 20px;
  text-align: center;
  transition: all 0.4s;
}

.value-card:hover {
  transform: translateY(-10px);
  border-color: #EF4056;
}

.v-icon {
  font-size: 40px;
  margin-bottom: 20px;
}

.value-card h3 {
  font-size: 24px;
  font-weight: 700;
  margin-bottom: 15px;
}

.value-card p {
  color: var(--text-dim);
  line-height: 1.6;
}

/* Join Us section */
.join-us {
  padding: 120px 0;
  background: var(--surface);
  text-align: center;
}

.join-content h2 {
  font-size: 48px;
  font-weight: 800;
  margin-bottom: 20px;
}

.join-content p {
  font-size: 18px;
  color: var(--text-dim);
  margin-bottom: 40px;
}

.cta-btn.secondary {
  background: transparent;
  border: 2px solid #EF4056;
  color: var(--text);
  box-shadow: none;
}

.cta-btn.secondary:hover {
  background: #EF4056;
  color: #fff;
}

.reveal-item[style*="--delay"] { transition-delay: calc(var(--delay) * 0.1s); }

/* Reveal Logic */
.reveal-item {
  opacity: 0;
  transform: translateY(40px);
  transition: all 1s cubic-bezier(0.165, 0.84, 0.44, 1);
}

.reveal-item.is-visible {
  opacity: 1;
  transform: translateY(0);
}

.zoom-in-item {
  transform: scale(0.9);
  transition: all 1.2s cubic-bezier(0.165, 0.84, 0.44, 1);
}

.zoom-in-item.is-visible {
  transform: scale(1);
}

@media (max-width: 1200px) {
  .team-container {
    gap: 40px;
  }
}

@media (max-width: 1024px) {
  .team-hero {
    padding-top: 150px;
  }
  .team-container {
    flex-direction: column;
    text-align: center;
  }
  .hero-content {
    max-width: 100%;
    margin-bottom: 60px;
  }
  .team-showcase {
    width: 100%;
    justify-content: center;
    min-height: auto;
  }
  .member-display {
    flex-direction: column;
    max-width: 500px;
  }
  .member-image-wrapper {
    width: 100%;
    max-width: 380px;
    min-width: auto;
  }
  .member-details-card {
    margin-left: 0;
    margin-top: -40px;
    width: 95%;
    min-width: auto;
    padding: 40px 30px;
  }
  .nav-arrows {
    width: 100%;
    top: 40%;
  }
}

@media (max-width: 768px) {
  .team-hero {
    padding-top: 120px;
  }
  .hero-title {
    font-size: 42px;
  }
  .member-image-wrapper {
    max-width: 300px;
  }
  .member-details-card {
    padding: 30px 20px;
  }
  .nav-arrows {
    display: flex; /* Ensure visible */
    top: 35%;
  }
  .values-grid {
    grid-template-columns: 1fr;
    gap: 30px;
  }
}
</style>
