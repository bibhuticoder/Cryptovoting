export default {
    components: {},
  
    data () {
      return {
        loading: false
      }
    },
  
    methods: {
      async onInit (promise) {
        this.loading = true
  
        try {
          await promise
  
          this.$emit('success')
        } catch (error) {
          if (error.name === 'NotAllowedError') {
              alert('error');
            this.$emit('error', 'To detect and decode QR codes this page needs access to your camera')
          } else if (error.name === 'NotFoundError') {
            alert('error');
            this.$emit('error', 'Seems like you have no suitable camera on your device.');
            
          } else if (error.name === 'NotSupportedError') {
            alert('error');
            this.$emit('error', 'Seems like this page is served in non-secure context. Your browser doesn\'t support that')
            alert('error');
          } else if (error.name === 'NotReadableError') {
            alert('error');
            this.$emit('error', 'Couldn\'t access your camera. Is it already in use?')
          } else if (error.name === 'OverconstrainedError') {
            alert('error');
            this.$emit('error', 'Constraints don\'t match any installed camera. Did you asked for the front camera although there is none?')
          } else {
            alert('error');
            this.$emit('error', 'UNKNOWN ERROR: ' + error.message)
  
            console.error(error)
          }
        } finally {
          this.loading = false
        }
      }
    }
  }