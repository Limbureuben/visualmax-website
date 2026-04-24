<template>
  <section class="partners-section">
    <div class="container">
      <h2 class="section-title reveal-on-scroll">Our Trusted Partners</h2>
      
      <div class="partners-carousel reveal-on-scroll delay-200">
        <!-- Partner Logos Grid (2 rows) -->
        <div class="partners-grid" :style="{ transform: `translateX(-${currentSlide * 100}%)` }">
          <div 
            v-for="(page, pageIndex) in partnerPages" 
            :key="pageIndex" 
            class="partners-page"
          >
            <!-- Row 1 -->
            <div class="partners-row">
              <div 
                v-for="partner in page.row1" 
                :key="partner.name" 
                class="partner-logo-wrapper"
              >
                <div class="partner-logo">
                  <img :src="partner.src" :alt="partner.name" />
                </div>
              </div>
            </div>
            
            <!-- Row 2 -->
            <div class="partners-row">
              <div 
                v-for="partner in page.row2" 
                :key="partner.name" 
                class="partner-logo-wrapper"
              >
                <div class="partner-logo">
                  <img :src="partner.src" :alt="partner.name" />
                </div>
              </div>
            </div>
          </div>
        </div>
        
        <!-- Dot Navigation -->
        <div class="dots-navigation">
          <button
            v-for="(page, index) in partnerPages"
            :key="index"
            :class="['dot', { active: currentSlide === index }]"
            @click="goToSlide(index)"
            :aria-label="`Go to slide ${index + 1}`"
          ></button>
        </div>
      </div>
    </div>
  </section>
</template>

<script setup>
import { ref, onMounted, onUnmounted } from 'vue'

// All partner logos
const allPartners = [
  { name: 'BlueScope', src: '/images/patiners/bluescope.jpg' },
  { name: 'ClimeAir', src: '/images/patiners/climeair.jpg' },
  { name: 'CRDB', src: '/images/patiners/crdb.jpg' },
  { name: 'ESRF', src: '/images/patiners/esrf.jpg' },
  { name: 'Fodex', src: '/images/patiners/fodex.jpg' },
  { name: 'Gwen', src: '/images/patiners/gwen.jpg' },
  { name: 'iFresh', src: '/images/patiners/ifresh.jpg' },
  { name: 'Jane', src: '/images/patiners/jane.jpg' },
  { name: 'LHRS', src: '/images/patiners/lhrs.jpg' },
  { name: 'MedBety', src: '/images/patiners/medbety.jpg' },
  { name: 'Mike', src: '/images/patiners/mike.jpg' },
  { name: 'Ofisi', src: '/images/patiners/ofisi.jpg' },
  { name: 'Policy', src: '/images/patiners/policy.jpg' },
  { name: 'SESC', src: '/images/patiners/sesc.jpg' },
  { name: 'SPack', src: '/images/patiners/spack.jpg' },
  { name: 'TACCI', src: '/images/patiners/tacci.jpg' },
  { name: 'TAN', src: '/images/patiners/tan.jpg' },
  { name: 'Tempo', src: '/images/patiners/tempo.jpg' },
  { name: 'TGNP', src: '/images/patiners/tgnp.jpg' },
  { name: 'Veritable', src: '/images/patiners/veritable.jpg' }
]

// Split partners into pages (5 per row, 2 rows = 10 per page, creates 2 pages for 20 partners)
const partnersPerRow = 5
const rowsPerPage = 2
const partnersPerPage = partnersPerRow * rowsPerPage

const partnerPages = ref([])
const currentSlide = ref(0)
let autoPlayInterval = null

// Create pages with two rows each
const createPages = () => {
  const pages = []
  for (let i = 0; i < allPartners.length; i += partnersPerPage) {
    const pagePartners = allPartners.slice(i, i + partnersPerPage)
    pages.push({
      row1: pagePartners.slice(0, partnersPerRow),
      row2: pagePartners.slice(partnersPerRow, partnersPerPage)
    })
  }
  partnerPages.value = pages
}

// Navigate to specific slide
const goToSlide = (index) => {
  currentSlide.value = index
  resetAutoPlay()
}

// Auto-play functionality
const startAutoPlay = () => {
  autoPlayInterval = setInterval(() => {
    currentSlide.value = (currentSlide.value + 1) % partnerPages.value.length
  }, 6000) // Change slide every 6 seconds
}

const resetAutoPlay = () => {
  if (autoPlayInterval) {
    clearInterval(autoPlayInterval)
  }
  startAutoPlay()
}

onMounted(() => {
  createPages()
  startAutoPlay()
})

onUnmounted(() => {
  if (autoPlayInterval) {
    clearInterval(autoPlayInterval)
  }
})
</script>

<style scoped>
.partners-section {
  padding: 120px 0;
  background-color: var(--background);
  color: var(--text);
  overflow: hidden;
  transition: background-color 0.4s, color 0.4s;
}

.container {
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 20px;
}

.section-title {
  font-size: 48px;
  font-weight: 800;
  text-align: center;
  margin-bottom: 60px;
  letter-spacing: -1px;
}

.partners-carousel {
  position: relative;
  overflow: hidden;
  padding-bottom: 60px;
}

.partners-grid {
  display: flex;
  transition: transform 1s cubic-bezier(0.165, 0.84, 0.44, 1);
}

.partners-page {
  min-width: 100%;
  display: flex;
  flex-direction: column;
  gap: 40px;
}

.partners-row {
  display: grid;
  grid-template-columns: repeat(5, 1fr);
  gap: 30px;
  align-items: center;
  justify-items: center;
}

.partner-logo-wrapper {
  display: flex;
  justify-content: center;
  align-items: center;
}

.partner-logo {
  width: 180px;
  height: 180px;
  /* Removed background, border-radius, and initial box-shadow */
  padding: 10px; /* Reduced padding */
  display: flex;
  align-items: center;
  justify-content: center;
  transition: all 0.3s cubic-bezier(0.165, 0.84, 0.44, 1);
}

.partner-logo:hover {
  transform: translateY(-8px);
  /* Removed box-shadow on hover or made it very subtle if needed, but request said display "as it is" */
}

.partner-logo img {
  width: 100%;
  height: 100%;
  object-fit: contain;
  transition: all 0.3s ease;
  /* Removed grayscale and opacity to keep original color */
}

.partner-logo:hover img {
  /* No change needed on hover as they are already original color */
  transform: scale(1.05); /* Optional: slight zoom on hover for interactivity */
}

/* Dot Navigation */
.dots-navigation {
  display: flex;
  justify-content: center;
  gap: 12px;
  margin-top: 40px;
}

.dot {
  width: 12px;
  height: 12px;
  border-radius: 50%;
  background-color: var(--text-secondary, #999);
  border: none;
  cursor: pointer;
  transition: all 0.3s ease;
  padding: 0;
  opacity: 0.4;
}

.dot:hover {
  opacity: 0.7;
  transform: scale(1.2);
}

.dot.active {
  background-color: var(--accent);
  opacity: 1;
  width: 32px;
  border-radius: 6px;
}

/* Dark mode support */
:global(.dark-mode) .partner-logo {
  background: rgba(255, 255, 255, 0.05);
  box-shadow: 0 4px 20px rgba(0, 0, 0, 0.3);
}

:global(.dark-mode) .partner-logo:hover {
  background: rgba(255, 255, 255, 0.08);
  box-shadow: 0 12px 40px rgba(0, 0, 0, 0.5);
}

/* Responsive Design */
@media (max-width: 1024px) {
  .section-title {
    font-size: 40px;
  }
  
  .partners-row {
    grid-template-columns: repeat(4, 1fr);
    gap: 25px;
  }
  
  .partner-logo {
    width: 120px;
    height: 120px;
    padding: 18px;
  }
}

@media (max-width: 768px) {
  .partners-section {
    padding: 80px 0;
  }
  
  .section-title {
    font-size: 32px;
    margin-bottom: 40px;
  }
  
  .partners-row {
    grid-template-columns: repeat(3, 1fr);
    gap: 20px;
  }
  
  .partners-page {
    gap: 30px;
  }
  
  .partner-logo {
    width: 100px;
    height: 100px;
    padding: 15px;
  }
}

@media (max-width: 480px) {
  .section-title {
    font-size: 28px;
  }
  
  .partners-row {
    grid-template-columns: repeat(2, 1fr);
    gap: 15px;
  }
  
  .partner-logo {
    width: 80px;
    height: 80px;
    padding: 12px;
  }
  
  .dots-navigation {
    gap: 8px;
  }
  
  .dot {
    width: 10px;
    height: 10px;
  }
  
  .dot.active {
    width: 24px;
  }
}
</style>
