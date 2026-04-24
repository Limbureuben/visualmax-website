<template>
  <div class="booking-page">
    
    <div class="booking-container">
      <div class="booking-header reveal-on-scroll">
        <h1 class="booking-title">Book Our Services</h1>
        <p class="booking-subtitle">Fill out the form below and we'll get back to you within 24 hours</p>
      </div>

      <form @submit.prevent="handleSubmit" class="booking-form reveal-on-scroll delay-200">
        <div class="form-grid">
          <!-- Personal Information -->
          <div class="form-group">
            <label for="name">Full Name *</label>
            <input 
              type="text" 
              id="name" 
              v-model="formData.name" 
              required 
              placeholder="John Doe"
            />
          </div>

          <div class="form-group">
            <label for="email">Email Address *</label>
            <input 
              type="email" 
              id="email" 
              v-model="formData.email" 
              required 
              placeholder="john@example.com"
            />
          </div>

          <div class="form-group">
            <label for="phone">Phone Number *</label>
            <input 
              type="tel" 
              id="phone" 
              v-model="formData.phone" 
              required 
              placeholder="+255 XXX XXX XXX"
            />
          </div>

          <div class="form-group">
            <label for="company">Company/Organization</label>
            <input 
              type="text" 
              id="company" 
              v-model="formData.company" 
              placeholder="Your Company"
            />
          </div>

          <!-- Service Selection -->
          <div class="form-group full-width">
            <label for="service">Service Type *</label>
            <select id="service" v-model="formData.service" required>
              <option value="">Select a service</option>
              <option value="photography">Photography</option>
              <option value="videography">Videography</option>
              <option value="creative-design">Creative Design</option>
              <option value="live-streaming">Live Streaming</option>
              <option value="podcasting">Podcasting</option>
              <option value="led-rental">LED Screen Rental</option>
              <option value="multiple">Multiple Services</option>
            </select>
          </div>

          <!-- Event Details -->
          <div class="form-group">
            <label for="event-type">Event Type *</label>
            <input 
              type="text" 
              id="event-type" 
              v-model="formData.eventType" 
              required 
              placeholder="Wedding, Corporate Event, etc."
            />
          </div>

          <div class="form-group">
            <label for="event-date">Event Date *</label>
            <input 
              type="date" 
              id="event-date" 
              v-model="formData.eventDate" 
              required 
            />
          </div>

          <div class="form-group">
            <label for="location">Event Location *</label>
            <input 
              type="text" 
              id="location" 
              v-model="formData.location" 
              required 
              placeholder="Dar es Salaam, Tanzania"
            />
          </div>

          <div class="form-group">
            <label for="budget">Estimated Budget (TZS)</label>
            <select id="budget" v-model="formData.budget">
              <option value="">Select budget range</option>
              <option value="under-1m">Under 1,000,000</option>
              <option value="1m-3m">1,000,000 - 3,000,000</option>
              <option value="3m-5m">3,000,000 - 5,000,000</option>
              <option value="5m-10m">5,000,000 - 10,000,000</option>
              <option value="over-10m">Over 10,000,000</option>
            </select>
          </div>

          <!-- Additional Information -->
          <div class="form-group full-width">
            <label for="message">Additional Details *</label>
            <textarea 
              id="message" 
              v-model="formData.message" 
              required 
              rows="5"
              placeholder="Tell us more about your event and specific requirements..."
            ></textarea>
          </div>
        </div>

        <button type="submit" class="submit-btn" :disabled="isSubmitting">
          <span v-if="!isSubmitting">Submit Booking Request</span>
          <span v-else>Submitting...</span>
        </button>

        <p v-if="submitMessage" :class="['submit-message', submitStatus]">
          {{ submitMessage }}
        </p>
      </form>

      <!-- Contact Information -->
      <div class="contact-info-box reveal-on-scroll delay-400">
        <h3>Prefer to contact us directly?</h3>
        <div class="contact-methods">
          <a href="tel:+255714686167" class="contact-method">
            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
              <path d="M22 16.92V19.92C22.001 20.198 21.944 20.473 21.833 20.729C21.722 20.985 21.56 21.215 21.356 21.407C21.152 21.599 20.912 21.748 20.65 21.846C20.388 21.944 20.109 21.989 19.83 21.979C16.735 21.979 13.714 21.107 11.05 19.469C8.583 17.957 6.495 15.869 4.983 13.402C3.344 10.738 2.472 7.717 2.472 4.622C2.462 4.343 2.507 4.064 2.605 3.802C2.703 3.54 2.852 3.3 3.044 3.096C3.236 2.892 3.466 2.73 3.722 2.619C3.978 2.508 4.253 2.451 4.531 2.451H7.531C8.01 2.451 8.475 2.622 8.841 2.932C9.207 3.242 9.452 3.669 9.531 4.141C9.68 5.12 9.919 6.084 10.247 7.019C10.38 7.394 10.395 7.799 10.291 8.181C10.187 8.563 9.968 8.902 9.664 9.155L8.394 10.425C9.792 12.872 11.821 14.901 14.268 16.299L15.538 15.029C15.791 14.725 16.131 14.506 16.512 14.402C16.894 14.298 17.299 14.313 17.674 14.446C18.609 14.774 19.573 15.013 20.552 15.162C21.028 15.241 21.458 15.489 21.769 15.858C22.08 16.227 22.251 16.696 22.251 17.177V16.92Z"/>
            </svg>
            <span>+255 714 686 167</span>
          </a>
          <a href="mailto:info@visualmax.co.tz" class="contact-method">
            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
              <path d="M4 4H20C21.1 4 22 4.9 22 6V18C22 19.1 21.1 20 20 20H4C2.9 20 2 19.1 2 18V6C2 4.9 2.9 4 4 4Z"/>
              <path d="M22 6L12 13L2 6"/>
            </svg>
            <span>info@visualmax.co.tz</span>
          </a>
          <a href="https://wa.me/255714686167" target="_blank" class="contact-method whatsapp">
            <svg width="24" height="24" viewBox="0 0 24 24" fill="currentColor">
              <path d="M17.472 14.382c-.297-.149-1.758-.867-2.03-.967-.273-.099-.471-.148-.67.15-.197.297-.767.966-.94 1.164-.173.199-.347.223-.644.075-.297-.15-1.255-.463-2.39-1.475-.883-.788-1.48-1.761-1.653-2.059-.173-.297-.018-.458.13-.606.134-.133.298-.347.446-.52.149-.174.198-.298.298-.497.099-.198.05-.371-.025-.52-.075-.149-.669-1.612-.916-2.207-.242-.579-.487-.5-.669-.51-.173-.008-.371-.01-.57-.01-.198 0-.52.074-.792.372-.272.297-1.04 1.016-1.04 2.479 0 1.462 1.065 2.875 1.213 3.074.149.198 2.096 3.2 5.077 4.487.709.306 1.262.489 1.694.625.712.227 1.36.195 1.871.118.571-.085 1.758-.719 2.006-1.413.248-.694.248-1.289.173-1.413-.074-.124-.272-.198-.57-.347m-5.421 7.403h-.004a9.87 9.87 0 01-5.031-1.378l-.361-.214-3.741.982.998-3.648-.235-.374a9.86 9.86 0 01-1.51-5.26c.001-5.45 4.436-9.884 9.888-9.884 2.64 0 5.122 1.03 6.988 2.898a9.825 9.825 0 012.893 6.994c-.003 5.45-4.437 9.884-9.885 9.884m8.413-18.297A11.815 11.815 0 0012.05 0C5.495 0 .16 5.335.157 11.892c0 2.096.547 4.142 1.588 5.945L.057 24l6.305-1.654a11.882 11.882 0 005.683 1.448h.005c6.554 0 11.89-5.335 11.893-11.893a11.821 11.821 0 00-3.48-8.413Z"/>
            </svg>
            <span>WhatsApp Us</span>
          </a>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref } from 'vue'

const formData = ref({
  name: '',
  email: '',
  phone: '',
  company: '',
  service: '',
  eventType: '',
  eventDate: '',
  location: '',
  budget: '',
  message: ''
})

const isSubmitting = ref(false)
const submitMessage = ref('')
const submitStatus = ref('')

const handleSubmit = async () => {
  isSubmitting.value = true
  submitMessage.value = ''
  
  try {
    // Simulate form submission (replace with actual API call)
    await new Promise(resolve => setTimeout(resolve, 1500))
    
    // For now, we'll just show a success message
    // In production, you would send this to your backend/email service
    console.log('Booking submitted:', formData.value)
    
    submitMessage.value = 'Thank you! Your booking request has been submitted. We\'ll contact you within 24 hours.'
    submitStatus.value = 'success'
    
    // Reset form
    formData.value = {
      name: '',
      email: '',
      phone: '',
      company: '',
      service: '',
      eventType: '',
      eventDate: '',
      location: '',
      budget: '',
      message: ''
    }
  } catch (error) {
    submitMessage.value = 'Sorry, there was an error submitting your request. Please try again or contact us directly.'
    submitStatus.value = 'error'
  } finally {
    isSubmitting.value = false
  }
}
</script>

<style scoped>
.booking-page {
  min-height: 100vh;
  padding: 150px 20px 80px;
  background-color: var(--background);
  color: var(--text);
  transition: background-color 0.4s, color 0.4s;
}

.booking-container {
  max-width: 900px;
  margin: 0 auto;
}

.booking-header {
  text-align: center;
  margin-bottom: 60px;
}

.booking-title {
  font-size: 48px;
  font-weight: 800;
  margin-bottom: 15px;
  letter-spacing: -1px;
}

.booking-subtitle {
  font-size: 18px;
  color: var(--text-dim);
  max-width: 600px;
  margin: 0 auto;
}

.booking-form {
  background: var(--card-background, #ffffff);
  padding: 50px;
  border-radius: 20px;
  box-shadow: 0 10px 40px rgba(0, 0, 0, 0.1);
  margin-bottom: 40px;
}

.form-grid {
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  gap: 25px;
  margin-bottom: 30px;
}

.form-group {
  display: flex;
  flex-direction: column;
  gap: 8px;
}

.form-group.full-width {
  grid-column: 1 / -1;
}

label {
  font-size: 14px;
  font-weight: 600;
  color: var(--text);
}

input,
select,
textarea {
  padding: 14px 18px;
  border: 2px solid var(--card-border, #e0e0e0);
  border-radius: 10px;
  font-size: 15px;
  font-family: inherit;
  background: var(--background);
  color: var(--text);
  transition: all 0.3s;
}

input:focus,
select:focus,
textarea:focus {
  outline: none;
  border-color: var(--accent);
  box-shadow: 0 0 0 3px rgba(249, 168, 34, 0.1);
}

textarea {
  resize: vertical;
  min-height: 120px;
}

.submit-btn {
  width: 100%;
  padding: 18px;
  background: var(--accent);
  color: white;
  border: none;
  border-radius: 12px;
  font-size: 16px;
  font-weight: 600;
  cursor: pointer;
  transition: all 0.3s cubic-bezier(0.165, 0.84, 0.44, 1);
}

.submit-btn:hover:not(:disabled) {
  transform: translateY(-2px);
  box-shadow: 0 10px 30px rgba(249, 168, 34, 0.3);
  background: #ff5a6e;
}

.submit-btn:disabled {
  opacity: 0.6;
  cursor: not-allowed;
}

.submit-message {
  margin-top: 20px;
  padding: 15px;
  border-radius: 10px;
  text-align: center;
  font-weight: 500;
}

.submit-message.success {
  background: rgba(76, 175, 80, 0.1);
  color: #4CAF50;
  border: 1px solid rgba(76, 175, 80, 0.3);
}

.submit-message.error {
  background: rgba(244, 67, 54, 0.1);
  color: #F44336;
  border: 1px solid rgba(244, 67, 54, 0.3);
}

.contact-info-box {
  background: var(--card-background, #ffffff);
  padding: 40px;
  border-radius: 20px;
  box-shadow: 0 10px 40px rgba(0, 0, 0, 0.1);
  text-align: center;
}

.contact-info-box h3 {
  font-size: 24px;
  font-weight: 700;
  margin-bottom: 25px;
}

.contact-methods {
  display: flex;
  flex-direction: column;
  gap: 15px;
  max-width: 400px;
  margin: 0 auto;
}

.contact-method {
  display: flex;
  align-items: center;
  gap: 15px;
  padding: 15px 20px;
  background: var(--background);
  border-radius: 12px;
  text-decoration: none;
  color: var(--text);
  transition: all 0.3s;
  border: 2px solid var(--card-border, #e0e0e0);
}

.contact-method:hover {
  transform: translateX(5px);
  border-color: var(--accent);
  box-shadow: 0 5px 20px rgba(249, 168, 34, 0.15);
}

.contact-method.whatsapp:hover {
  border-color: #25D366;
  box-shadow: 0 5px 20px rgba(37, 211, 102, 0.15);
}

.contact-method svg {
  flex-shrink: 0;
  color: var(--accent);
}

.contact-method.whatsapp svg {
  color: #25D366;
}

/* Dark mode support */
:global(.dark-mode) .booking-form,
:global(.dark-mode) .contact-info-box {
  background: rgba(255, 255, 255, 0.05);
  box-shadow: 0 10px 40px rgba(0, 0, 0, 0.3);
}

/* Responsive */
@media (max-width: 768px) {
  .booking-page {
    padding: 120px 20px 60px;
  }

  .booking-title {
    font-size: 36px;
  }

  .booking-subtitle {
    font-size: 16px;
  }

  .booking-form,
  .contact-info-box {
    padding: 30px 20px;
  }

  .form-grid {
    grid-template-columns: 1fr;
    gap: 20px;
  }
}
</style>
