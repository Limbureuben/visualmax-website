<template>
  <section class="our-work">
    <div class="container">
      <!-- Section Header -->
      <div class="work-header reveal-on-scroll">
        <h2 class="work-title">OUR WORK</h2>
        <NuxtLink to="#" class="explore-btn">Explore more</NuxtLink>
      </div>

      <!-- Work Grid -->
      <div class="work-grid">
        <div class="work-item reveal-on-scroll delay-100">
          <div class="image-box">
            <img src="/images/ourwork/work1.jpeg" alt="Recent Project 1" />
          </div>
        </div>
        <div class="work-item reveal-on-scroll delay-200">
          <div class="image-box">
            <img src="/images/ourwork/work2.jpeg" alt="Recent Project 2" />
          </div>
        </div>
        <div class="work-item reveal-on-scroll delay-300">
          <div class="image-box">
            <img src="/images/ourwork/workimage2.png" alt="Recent Project 3" />
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<style scoped>
.our-work {
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

.work-grid {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 30px;
}

.work-item {
  position: relative;
  overflow: hidden;
}

.image-box {
  aspect-ratio: 3/4; /* Maintains the tall portrait look from the mockup */
  overflow: hidden;
  border-radius: 0; /* Boxy look as per design */
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

/* Entry Animations */
.reveal-item {
  opacity: 0;
  transform: translateY(40px);
  transition: all 1s cubic-bezier(0.165, 0.84, 0.44, 1);
}

.reveal-item.is-visible {
  opacity: 1;
  transform: translateY(0);
}

.reveal-item[style*="--delay"] {
  transition-delay: calc(var(--delay) * 0.15s);
}

/* Responsiveness */
@media (max-width: 992px) {
  .work-grid {
    grid-template-columns: repeat(2, 1fr);
  }
}

@media (max-width: 768px) {
  .work-header {
    flex-direction: column;
    gap: 20px;
    text-align: center;
    margin-bottom: 40px;
  }
  
  .work-title {
    font-size: 36px;
  }

  .work-grid {
    grid-template-columns: 1fr;
    gap: 20px;
  }

  .our-work {
    padding: 80px 0;
  }
}
</style>
