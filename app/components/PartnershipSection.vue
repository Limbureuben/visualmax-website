<template>
  <section class="partnership">
    <div class="container partnership-grid">
      <!-- Left Content -->
      <div class="partnership-text reveal-on-scroll">
        <h2 class="cta-heading">LET'S TAKE OUR RELATIONSHIP TO THE NEXT LEVEL</h2>
        <NuxtLink to="/contact" class="partnership-btn">Start a patinership</NuxtLink>
      </div>

      <!-- Right Image -->
      <div class="partnership-img-col reveal-on-scroll delay-200">
        <div class="img-box">
          <img src="/images/ourwork/work1.jpeg" alt="Partner with Visualmax" />
        </div>
      </div>
    </div>
  </section>
</template>

<style scoped>
.partnership {
  padding: 150px 0;
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

.partnership-grid {
  display: grid;
  grid-template-columns: 1.1fr 0.9fr;
  gap: 80px;
  align-items: center;
}

.cta-heading {
  font-size: 64px;
  font-weight: 800;
  line-height: 1.1;
  margin-bottom: 50px;
  letter-spacing: -2px;
}

.partnership-btn {
  display: inline-block;
  background-color: var(--accent);
  color: #fff;
  padding: 18px 45px;
  border-radius: 60px;
  text-decoration: none;
  font-weight: 600;
  font-size: 18px;
  transition: all 0.3s cubic-bezier(0.165, 0.84, 0.44, 1);
}

.partnership-btn:hover {
  transform: translateY(-5px);
  box-shadow: 0 10px 30px rgba(249, 168, 34, 0.4);
}

.img-box {
  width: 100%;
  aspect-ratio: 1; /* Square as per the mockup visually appearing balanced */
  overflow: hidden;
}

.img-box img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  transition: transform 1.5s cubic-bezier(0.165, 0.84, 0.44, 1);
}

.partnership-img-col:hover img {
  transform: scale(1.08);
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
  transition-delay: calc(var(--delay) * 0.2s);
}

/* Responsiveness */
@media (max-width: 1024px) {
  .cta-heading {
    font-size: 48px;
  }
}

@media (max-width: 992px) {
  .partnership-grid {
    grid-template-columns: 1fr;
    gap: 60px;
    text-align: center;
  }
  
  .img-box {
    max-width: 600px;
    margin: 0 auto;
  }
  
  .partnership-btn {
    margin-bottom: 20px;
  }
}

@media (max-width: 768px) {
  .partnership {
    padding: 100px 0;
  }
  
  .cta-heading {
    font-size: 36px;
    margin-bottom: 30px;
  }
}
</style>
