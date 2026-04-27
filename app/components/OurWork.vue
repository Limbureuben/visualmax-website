<template>
  <section class="our-work">
    <div class="container">
      <!-- Section Header -->
      <div class="work-header reveal-on-scroll">
        <h2 class="work-title">OUR WORK</h2>
        <NuxtLink to="#" class="explore-btn">Explore more</NuxtLink>
      </div>

      <!-- Work Slider -->
      <div class="work-slider-container" @mouseenter="stopAutoScroll" @mouseleave="startAutoScroll">
        <div class="work-slider" ref="slider">
          <div class="work-item">
            <div class="image-box">
              <img src="/images/ourwork/pod1.png" alt="Podcasting Project" />
            </div>
            <div class="work-info">
              <h3>Podcasting</h3>
            </div>
          </div>
          <div class="work-item">
            <div class="image-box">
              <img src="/images/ourwork/stream3.png" alt="Live Streaming Project" />
            </div>
            <div class="work-info">
              <h3>Live Streaming</h3>
            </div>
          </div>
          <div class="work-item">
            <div class="image-box">
              <img src="/images/ourwork/creative1.png" alt="Creative Design Project" />
            </div>
            <div class="work-info">
              <h3>Creative Design</h3>
            </div>
          </div>
          <div class="work-item">
            <div class="image-box">
              <img src="/images/ourwork/photo2.png" alt="Photography Project" />
            </div>
            <div class="work-info">
              <h3>Photography</h3>
            </div>
          </div>
          <div class="work-item">
            <div class="image-box">
              <img src="/images/ourwork/video1.png" alt="Videography Project" />
            </div>
            <div class="work-info">
              <h3>Videography</h3>
            </div>
          </div>
          <div class="work-item">
            <div class="image-box">
              <img src="/images/ourwork/live1.png" alt="Event Coverage" />
            </div>
            <div class="work-info">
              <h3>Event Coverage</h3>
            </div>
          </div>
          <div class="work-item">
            <div class="image-box">
              <img src="/images/ourwork/rental1.png" alt="LED Rental" />
            </div>
            <div class="work-info">
              <h3>LED Rental</h3>
            </div>
          </div>
        </div>

        <!-- Navigation Controls -->
        <div class="slider-controls">
          <div class="scroll-progress">
            <div class="progress-bar" :style="{ width: scrollProgress + '%' }"></div>
          </div>
          <div class="nav-buttons">
            <button @click="scroll('left')" class="nav-btn prev" aria-label="Previous">
              <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M15 18l-6-6 6-6"/></svg>
            </button>
            <button @click="scroll('right')" class="nav-btn next" aria-label="Next">
              <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M9 18l6-6-6-6"/></svg>
            </button>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script setup>
import { ref, onMounted, onUnmounted } from 'vue'

const slider = ref(null)
const scrollProgress = ref(0)

const updateProgress = () => {
  if (!slider.value) return
  const { scrollLeft, scrollWidth, clientWidth } = slider.value
  scrollProgress.value = (scrollLeft / (scrollWidth - clientWidth)) * 100
}

const scroll = (direction) => {
  if (!slider.value) return
  const scrollAmount = slider.value.clientWidth
  const { scrollLeft, scrollWidth, clientWidth } = slider.value

  if (direction === 'right') {
    if (scrollLeft + clientWidth >= scrollWidth - 10) {
      // Loop back to start
      slider.value.scrollTo({ left: 0, behavior: 'smooth' })
    } else {
      slider.value.scrollBy({ left: scrollAmount, behavior: 'smooth' })
    }
  } else {
    slider.value.scrollBy({ left: -scrollAmount, behavior: 'smooth' })
  }
}

let autoScrollInterval = null

const startAutoScroll = () => {
  autoScrollInterval = setInterval(() => {
    scroll('right')
  }, 4000) // Scroll every 4 seconds
}

const stopAutoScroll = () => {
  if (autoScrollInterval) {
    clearInterval(autoScrollInterval)
  }
}

onMounted(() => {
  if (slider.value) {
    slider.value.addEventListener('scroll', updateProgress)
    startAutoScroll()
  }
})

onUnmounted(() => {
  if (slider.value) {
    slider.value.removeEventListener('scroll', updateProgress)
    stopAutoScroll()
  }
})
</script>

<style scoped>
.our-work {
  padding: 120px 0;
  background-color: var(--background);
  color: var(--text);
  overflow: hidden;
  transition: background-color 0.4s, color 0.4s;
}

.container {
  max-width: 1400px; /* Slightly wider for the slider */
  margin: 0 auto;
  padding: 0 40px;
}

.work-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 60px;
}

.work-title {
  font-size: 48px;
  font-weight: 700;
  letter-spacing: 2px;
  margin: 0;
}

.explore-btn {
  background-color: var(--accent);
  color: #fff;
  padding: 12px 30px;
  border-radius: 50px;
  text-decoration: none;
  font-weight: 600;
  font-size: 16px;
  transition: all 0.3s cubic-bezier(0.165, 0.84, 0.44, 1);
}

.explore-btn:hover {
  transform: scale(1.05);
  box-shadow: 0 5px 20px rgba(249, 168, 34, 0.4);
}

/* Slider Styles */
.work-slider-container {
  position: relative;
}

.work-slider {
  display: flex;
  gap: 30px;
  overflow-x: auto;
  scroll-behavior: smooth;
  scroll-snap-type: x mandatory;
  padding-bottom: 40px;
  -ms-overflow-style: none;  /* IE and Edge */
  scrollbar-width: none;  /* Firefox */
}

.work-slider::-webkit-scrollbar {
  display: none; /* Hide scrollbar for Chrome, Safari and Opera */
}



.work-item {
  flex: 0 0 calc(33.333% - 20px); /* 3 images visible */
  scroll-snap-align: start;
  position: relative;
  overflow: hidden;
}

.image-box {
  aspect-ratio: 3/4;
  overflow: hidden;
  background-color: #1a1a1a;
}

.image-box img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  transition: transform 1.2s cubic-bezier(0.165, 0.84, 0.44, 1);
}

.work-item:hover .image-box img {
  transform: scale(1.1);
}

.work-info {
  margin-top: 20px;
}

.work-info h3 {
  font-size: 20px;
  font-weight: 600;
  margin: 0;
  color: var(--text);
}

/* Controls */
.slider-controls {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-top: 20px;
}

.scroll-progress {
  flex: 1;
  height: 2px;
  background-color: rgba(255, 255, 255, 0.1);
  margin-right: 40px;
  position: relative;
}

.progress-bar {
  position: absolute;
  top: 0;
  left: 0;
  height: 100%;
  background-color: var(--accent);
  transition: width 0.2s ease;
}

.nav-buttons {
  display: flex;
  gap: 15px;
}

.nav-btn {
  background: rgba(255, 255, 255, 0.05);
  border: 1px solid rgba(255, 255, 255, 0.1);
  color: var(--text);
  width: 50px;
  height: 50px;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  cursor: pointer;
  transition: all 0.3s ease;
}

.nav-btn:hover {
  background: var(--accent);
  border-color: var(--accent);
  color: white;
}

.nav-btn svg {
  width: 24px;
  height: 24px;
}

/* Responsiveness */
@media (max-width: 1200px) {
  .work-item {
    flex: 0 0 calc(50% - 15px); /* 2 images visible */
  }
}

@media (max-width: 768px) {
  .container {
    padding: 0 20px;
  }
  
  .work-title {
    font-size: 36px;
  }

  .work-item {
    flex: 0 0 100%; /* 1 image visible */
  }

  .our-work {
    padding: 80px 0;
  }

  .scroll-progress {
    margin-right: 20px;
  }
}
</style>
