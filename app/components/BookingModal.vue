<template>
  <Teleport to="body">
    <Transition name="modal">
      <div v-if="isOpen" class="modal-overlay" @click="closeModal">
        <div class="modal-container" @click.stop>
          <button class="close-btn" @click="closeModal" aria-label="Close modal">
            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
              <path d="M18 6L6 18M6 6l12 12"/>
            </svg>
          </button>

          <div class="modal-content">
            <div class="modal-header">
              <h2 class="modal-title">Book Our Services</h2>
              <p class="modal-subtitle">Fill out the form below and we'll get back to you within 24 hours</p>
            </div>

            <form @submit.prevent="handleSubmit" class="booking-form">
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

                <!-- Additional Information -->
                <div class="form-group full-width">
                  <label for="message">Additional Details *</label>
                  <textarea 
                    id="message" 
                    v-model="formData.message" 
                    required 
                    rows="4"
                    placeholder="Tell us more about your event..."
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
          </div>
        </div>
      </div>
    </Transition>
  </Teleport>
</template>

<script setup>
import { ref, watch } from 'vue'

const props = defineProps({
  isOpen: {
    type: Boolean,
    default: false
  }
})

const emit = defineEmits(['close'])

const formData = ref({
  name: '',
  email: '',
  phone: '',
  service: '',
  eventDate: '',
  location: '',
  message: ''
})

const isSubmitting = ref(false)
const submitMessage = ref('')
const submitStatus = ref('')

const closeModal = () => {
  emit('close')
}

const handleSubmit = async () => {
  isSubmitting.value = true
  submitMessage.value = ''
  
  try {
    // Simulate form submission
    await new Promise(resolve => setTimeout(resolve, 1500))
    
    console.log('Booking submitted:', formData.value)
    
    submitMessage.value = 'Thank you! Your booking request has been submitted. We\'ll contact you within 24 hours.'
    submitStatus.value = 'success'
    
    // Reset form after 3 seconds
    setTimeout(() => {
      formData.value = {
        name: '',
        email: '',
        phone: '',
        service: '',
        eventDate: '',
        location: '',
        message: ''
      }
      submitMessage.value = ''
      closeModal()
    }, 3000)
  } catch (error) {
    submitMessage.value = 'Sorry, there was an error. Please try again or contact us directly.'
    submitStatus.value = 'error'
  } finally {
    isSubmitting.value = false
  }
}

// Prevent body scroll when modal is open
watch(() => props.isOpen, (newVal) => {
  if (newVal) {
    document.body.style.overflow = 'hidden'
  } else {
    document.body.style.overflow = ''
  }
})
</script>

<style scoped>
.modal-overlay {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: rgba(0, 0, 0, 0.75);
  backdrop-filter: blur(8px);
  display: flex;
  align-items: center;
  justify-content: center;
  z-index: 9999;
  padding: 20px;
  overflow-y: auto;
}

.modal-container {
  position: relative;
  background: var(--background);
  border-radius: 20px;
  max-width: 800px;
  width: 100%;
  max-height: 90vh;
  overflow-y: auto;
  box-shadow: 0 20px 60px rgba(0, 0, 0, 0.5);
  border: 1px solid var(--card-border);
}

.close-btn {
  position: absolute;
  top: 20px;
  right: 20px;
  background: var(--surface);
  border: 1px solid var(--card-border);
  width: 40px;
  height: 40px;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  cursor: pointer;
  transition: all 0.3s;
  z-index: 10;
  color: var(--text);
}

.close-btn:hover {
  background: var(--accent);
  border-color: var(--accent);
  color: white;
  transform: rotate(90deg);
}

.modal-content {
  padding: 50px 40px;
}

.modal-header {
  text-align: center;
  margin-bottom: 40px;
}

.modal-title {
  font-size: 36px;
  font-weight: 800;
  margin-bottom: 10px;
  color: var(--text);
}

.modal-subtitle {
  font-size: 16px;
  color: var(--text-dim);
}

.booking-form {
  width: 100%;
}

.form-grid {
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  gap: 20px;
  margin-bottom: 25px;
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
  padding: 12px 16px;
  border: 2px solid var(--card-border);
  border-radius: 10px;
  font-size: 15px;
  font-family: inherit;
  background: var(--surface);
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
  min-height: 100px;
}

.submit-btn {
  width: 100%;
  padding: 16px;
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
  margin-top: 15px;
  padding: 12px;
  border-radius: 8px;
  text-align: center;
  font-weight: 500;
  font-size: 14px;
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

/* Modal Transitions */
.modal-enter-active,
.modal-leave-active {
  transition: opacity 0.3s ease;
}

.modal-enter-active .modal-container,
.modal-leave-active .modal-container {
  transition: all 0.3s cubic-bezier(0.165, 0.84, 0.44, 1);
}

.modal-enter-from,
.modal-leave-to {
  opacity: 0;
}

.modal-enter-from .modal-container {
  transform: scale(0.9) translateY(20px);
}

.modal-leave-to .modal-container {
  transform: scale(0.95) translateY(-20px);
}

/* Responsive */
@media (max-width: 768px) {
  .modal-overlay {
    padding: 15px;
    align-items: center;
    padding-top: 15px;
  }

  .modal-container {
    max-height: 90vh; /* Using safer vh over calc for mobile */
    border-radius: 16px;
  }

  .modal-content {
    padding: 40px 20px 30px;
  }

  .modal-title {
    font-size: 28px;
  }

  .modal-subtitle {
    font-size: 14px;
  }

  .form-grid {
    grid-template-columns: 1fr;
    gap: 18px;
  }

  input,
  select,
  textarea {
    padding: 14px 16px;
    font-size: 16px; /* Prevents zoom on iOS */
  }

  .submit-btn {
    padding: 18px;
    font-size: 17px;
  }

  .close-btn {
    top: 15px;
    right: 15px;
    width: 36px;
    height: 36px;
  }
}

@media (max-width: 480px) {
  .modal-overlay {
    padding: 10px;
    align-items: center;
  }

  .modal-container {
    max-height: 92vh;
    border-radius: 12px;
  }

  .modal-content {
    padding: 35px 16px 25px;
  }

  .modal-header {
    margin-bottom: 30px;
  }

  .modal-title {
    font-size: 24px;
    margin-bottom: 8px;
  }

  .modal-subtitle {
    font-size: 13px;
  }

  .form-grid {
    gap: 16px;
    margin-bottom: 20px;
  }

  label {
    font-size: 13px;
  }

  input,
  select,
  textarea {
    padding: 13px 14px;
    font-size: 16px;
    border-radius: 8px;
  }

  textarea {
    min-height: 90px;
  }

  .submit-btn {
    padding: 16px;
    font-size: 16px;
    border-radius: 10px;
  }

  .submit-message {
    font-size: 13px;
    padding: 10px;
  }

  .close-btn {
    top: 12px;
    right: 12px;
    width: 32px;
    height: 32px;
  }

  .close-btn svg {
    width: 18px;
    height: 18px;
  }
}

/* Prevent body scroll on mobile when modal is open */
@media (max-width: 768px) {
  body.modal-open {
    overflow: hidden;
    position: fixed;
    width: 100%;
  }
}

/* Scrollbar styling for modal */
.modal-container::-webkit-scrollbar {
  width: 8px;
}

.modal-container::-webkit-scrollbar-track {
  background: var(--surface);
}

.modal-container::-webkit-scrollbar-thumb {
  background: var(--card-border);
  border-radius: 4px;
}

.modal-container::-webkit-scrollbar-thumb:hover {
  background: var(--accent);
}
</style>
