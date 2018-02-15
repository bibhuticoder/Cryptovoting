<template>
  <div class="container center">
      
      <router-link to="/">
        <img src="static/images/election_commission.jpg" class="logo" />
      </router-link>

      <router-link to="/qrhelp">
        <img src="static/images/help.png" class="help" />
      </router-link>
      
      
      <img src="static/images/lang.jpg" class="lang" />
      <br>
      <br>
      <br>
      <br>
      <br>
      <br>
      <qrcode-reader
          class="qr-reader"
          @init="onInit"
          facingMode= "user"
          @decode="onDecode"
          @locate="onLocate"
      >
      </qrcode-reader>
      <br><br>
      <h1 style="color: #A9A9A9">Place QR Code of ID Card in the frames</h1>
  </div>
</template>

<script>
import { QrcodeReader } from "vue-qrcode-reader";
import InitHandler from '@/mixins/InitHandler'
export default {
  name: "Auth",
  components: { QrcodeReader },
  mixins: [ InitHandler ],
  data() {
    return {
      useQR: true,
      qrReaderStatus: false,
      voterId: 1212
    };
  },

  methods: {
    
    authenticate(content) {
      console.log(content);
      var authCode = this.$contract.authenticateVoter(this.voterId);
      if(authCode == 0){
        this.$router.push({path: "/ballot?asd=" + this.voterId});
      }else if(authCode == 1){
        alert("You have already voted");
      }else if(authCode == 2){
        alert("Voter not registered");
      }
    },

    useQRScanner() {
      this.takePhoto = true;
    },

    onDecode(content) {
      this.voterId = content;
      if(isNaN(this.voterId)){
        alert('Invalid QR code');
        return;
      } 
      this.qrReaderStatus = true;
      this.useQR = false;
      this.authenticate(this.voterId);
    },

    onLocate() {
      console.log("located");
    },

    async onInit(promise) {
      // show loading indicator

      try {
        await promise;

        // successfully initialized
      } catch (error) {
        if (error.name === "NotAllowedError") {
          // user denied camera access permisson
        } else if (error.name === "NotFoundError") {
          // no suitable camera device installed
        } else if (error.name === "NotSupportedError") {
          // page is not served over HTTPS (or localhost)
        } else if (error.name === "NotReadableError") {
          // maybe camera is already in use
        } else if (error.name === "OverconstrainedError") {
          // passed constraints don't match any camera. Did you requested the front camera although there is none?
        } else {
          // browser is probably lacking features (WebRTC, Canvas)
        }
      } finally {
        // hide loading indicator
      }
    }
  },

  created: function() {
    this.$web3.eth.defaultAccount = this.$web3.eth.accounts[1];
  }
};
</script>

<style scoped>
  .qr-reader {
    height: 400px !important;
    width: 400px !important;
    border-style: solid;
    padding-top: 75px;
    border-width: 1px;
    border-color: grey;
    background: #373737;
    margin: 0 auto;
  }

  .logo{
    width: 100px;
    height: 100px;
    position: absolute;
    left: 100px;
    top: 10px;
  }

  .help{
    width: 50px;
    height: 50px;
    position: absolute;
    right: 400px;
    top: 50%;
    cursor: pointer;
  }

  .lang{
    position: absolute;
    top: 20px;
    right: 50px;
  }



</style>
