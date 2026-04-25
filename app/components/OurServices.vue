<template>
  <section id="services" class="services-section" ref="sectionRef">
    <div class="container">
      <h2 class="section-title reveal-on-scroll">OUR SERVICES</h2>
      
      <div class="services-grid">
        <!-- Column 1: Service List -->
        <div class="services-list-container">
          <ul class="services-list reveal-on-scroll">
            <li 
              v-for="(service, index) in services" 
              :key="service.id"
              class="service-item"
              :class="{ 'highlight': activeService.id === service.id }"
              @mouseenter="setActiveService(service)"
            >
              <NuxtLink :to="service.link" class="service-link">
                <!-- Dot removed here, handled by CSS ::before -->
                <span class="service-name">{{ service.title }}</span>
                <!-- Indicators hidden via CSS or can be removed if strictly not needed -->
              </NuxtLink>
            </li>
          </ul>
        </div>

        <!-- Column 2: Description & CTA -->
        <div class="services-content reveal-on-scroll delay-200">
          <div class="description-container">
            <transition name="fade" mode="out-in">
              <p :key="activeService.id" class="service-description">
                {{ activeService.description }}
              </p>
            </transition>
          </div>
          <button class="cta-button" @click="openBooking">Get in touch</button>
        </div>

        <!-- Column 3: Featured Image -->
        <div class="services-image-container reveal-on-scroll delay-300">
          <transition name="slide-left" mode="out-in">
             <img 
              :key="activeService.image"
              :src="activeService.image" 
              :alt="activeService.title" 
              class="service-image"
            />
          </transition>
        </div>
      </div>
    </div>
  </section>
</template>

<script setup>
import { ref } from 'vue'

const services = [
  {
    id: 'photography',
    title: 'Photography',
    link: '/services/photography',
    description: 'We bring stories to life through high-quality photography. From concept to final delivery, we create compelling visuals that connect brands with their audience.',
    image: '/images/ourwork/photo1.png'
  },
  {
    id: 'videography',
    title: 'Videography',
    link: '/services/videography',
    description: 'We produce visually engaging videos that communicate your message clearly and creatively. From concept development to filming and post-production, we focus on storytelling.',
    image: '/images/ourwork/video1.png'
  },
  {
    id: 'design',
    title: 'Creative Design',
    link: '/services/creative-design',
    description: 'Exceptional creative design that transforms ideas into visual reality. We focus on brand identity, marketing materials, and digital assets that stand out.',
    image: '/images/ourwork/creative2.png'
  },
  {
    id: 'streaming',
    title: 'Live Streaming',
    link: '/services/live-streaming',
    description: 'Professional live streaming services for events, conferences, and webinars. We ensure high-quality broadcasts with multi-camera setups and seamless audio.',
    image: '/images/ourwork/stream2.png'
  },
  {
    id: 'podcasting',
    title: 'Podcasting',
    link: '/services/podcasting',
    description: 'Full-service podcast production including recording, editing, and distribution. Our studio offers the perfect environment for high-quality audio content.',
    image: '/images/ourwork/pod1.png'
  },
  {
    id: 'led',
    title: 'LED Rental',
    link: '/services/led-rental',
    description: 'High-resolution LED screens for events of all sizes. We provide rental, setup, and technical support to ensure your visuals make a massive impact.',
    image: '/images/ourwork/rental1.png'
  },
  {
    id: 'management',
    title: 'Influencer Management',
    link: '/services/influencer-management',
    description: 'Influencer marketing is more than followers. It’s about trust, relevance, and impact. We help brands build credibility and reach audiences through meaningful creator collaborations.',
    image: '/images/ourwork/creative3.png'
  }
]

const activeService = ref(services[0])

const setActiveService = (service) => {
  activeService.value = service
}

const isBookingOpen = useState('isBookingOpen')
const openBooking = () => {
  isBookingOpen.value = true
}
</script>

<style scoped>
.services-section {
  background-color: var(--background);
  color: var(--text);
  padding: 100px 60px 40px;
  display: flex;
  align-items: center;
  font-family: 'Poppins', sans-serif;
  transition: background-color 0.4s, color 0.4s;
}

.container {
  width: 100%;
  max-width: 1400px;
  margin: 0 auto;
}

.section-title {
  font-size: 48px;
  font-weight: 600;
  margin-bottom: 60px;
  letter-spacing: 1px;
}

.services-grid {
  display: grid;
  grid-template-columns: 1fr 1.2fr 1fr;
  gap: 60px;
  align-items: flex-start;
}

.services-list {
  list-style: none;
  padding: 0;
  margin: 0;
  display: flex;
  flex-direction: column;
  gap: 10px; /* Reduced gap */
}

.service-item {
  font-size: 24px;
  color: var(--text); /* dynamic color for light/dark mode */
  position: relative;
  cursor: pointer;
  transition: all 0.3s ease;
  opacity: 1;
  font-weight: 500;
  border-bottom: none; /* Removed border */
  border-radius: 8px; /* Added for hover effect */
}

.service-link {
  color: inherit;
  text-decoration: none;
  display: flex;
  align-items: center;
  justify-content: space-between;
  width: 100%;
  padding: 12px 15px; /* Reduced vertical padding, added horizontal */
}

.service-name {
  display: flex;
  align-items: center;
  width: 100%;
}

.service-name::before {
  content: ">"; /* Changed from dot to > */
  margin-right: 15px;
  font-size: 18px;
  color: var(--text); /* dynamic color for light/dark mode */
  transition: color 0.2s ease-in-out;
  font-weight: 700; /* Make arrow bolder */
}

.service-item.highlight .service-name::before,
.service-item:hover .service-name::before {
  color: var(--accent);
}

/* Hover & functional Active State */
.service-item:hover, 
.service-item.highlight {
  color: var(--accent);
  opacity: 1; /* Force opacity to stay 1 */
  background-color: rgba(39, 141, 226, 0.1); /* Add view appearance background */
  padding-left: 10px; /* Slight movement on hover */
}

.service-item.highlight {
  font-weight: 600;
}

/* Image & Description containers */
.services-content {
  display: flex;
  flex-direction: column;
  gap: 30px;
  padding-top: 5px;
  min-height: 200px;
}

.description-container {
  display: flex;
  flex-direction: column;
  gap: 15px;
}

.service-description {
  font-size: 20px;
  line-height: 1.8;
  color: var(--text-dim);
  max-width: 500px;
}

.cta-button {
  background-color: var(--accent);
  color: #fff;
  border: none;
  padding: 18px 40px;
  font-size: 18px;
  font-weight: 500;
  border-radius: 40px;
  cursor: pointer;
  width: fit-content;
  transition: transform 0.2s ease, background-color 0.2s ease;
}

.cta-button:hover {
  background-color: #0d487c;
  transform: translateY(-2px);
}

.services-image-container {
  display: flex;
  justify-content: flex-end;
  height: 400px; /* Fixed height to prevent layout jumps */
  width: 100%;
  position: relative;
}

.service-image {
  width: 100%;
  max-width: 400px;
  height: 100%;
  border-radius: 30px;
  object-fit: cover;
  box-shadow: 0 20px 40px rgba(0, 0, 0, 0.4);
  transition: all 0.5s cubic-bezier(0.165, 0.84, 0.44, 1);
}

/* Animations */
.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.3s ease, transform 0.3s ease;
}

.fade-enter-from,
.fade-leave-to {
  opacity: 0;
  transform: translateY(10px);
}

.slide-left-enter-active,
.slide-left-leave-active {
  transition: all 0.6s cubic-bezier(0.22, 1, 0.36, 1); /* Slower and smoother */
}

.slide-left-enter-from {
  opacity: 0;
  transform: translateX(-150px); /* Much larger starting distance */
}

.slide-left-leave-to {
  opacity: 0;
  transform: translateX(50px); /* Slide out to right slightly */
}

/* Reveal Animations */
.reveal-on-scroll {
    opacity: 0;
    transform: translateY(30px);
    transition: all 1s ease;
}

.reveal-on-scroll.revealed {
    opacity: 1;
    transform: translateY(0);
}

.delay-200 { transition-delay: 200ms; }
.delay-300 { transition-delay: 300ms; }

/* Responsiveness */
@media (max-width: 1200px) {
  .services-grid {
    grid-template-columns: 1fr 1fr;
    gap: 40px;
  }
  .services-image-container {
    grid-column: span 2;
    justify-content: center;
    margin-top: 40px;
    height: 350px;
  }
  .service-image {
    max-width: 600px;
  }
}

@media (max-width: 992px) {
  .section-title {
    font-size: 36px;
  }
  .service-item {
    font-size: 20px;
  }
}

@media (max-width: 768px) {
  .services-section {
    padding: 60px 20px;
  }
  .services-grid {
    grid-template-columns: 1fr;
    gap: 40px;
  }
  .services-image-container {
    grid-column: auto;
    height: 300px;
  }
  .section-title {
    text-align: center;
    margin-bottom: 40px;
  }
  .services-list {
    align-items: center;
  }
  .services-content {
    align-items: center;
    text-align: center;
  }
}
</style>
