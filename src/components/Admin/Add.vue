<template>
  <div class="container">

    <router-link to="/">
      <img src="static/images/election_commission.jpg" class="logo" />
    </router-link>
    <br>
    <br><br><br><br><br><br>
    <h1> 
      Add candidates and voters
    </h1>
    <hr>
    <div class="row">
      <div class="col-md-6">
        <div class="well">
          <p class="lead">Add Voter</p>
          <input type="text" class="form-control" placeholder="Name" v-model="voter.name" />
          <br>
          <input type="text" class="form-control" placeholder="Address" v-model="voter.address" />
           <br>
          <input type="text" class="form-control" placeholder="Date Of Birth" v-model="voter.dob" />
          <br>
          <button class="btn btn-success btn-sm" v-on:click="submitVoter">Submit</button>
        </div>        
      </div>
      <div class="col-md-6">
        <div class="voter-card" v-if="voter.hash">
          <img src="static/images/election_banner.jpg" height="35px" width="225px" />
          <br>
          <label>Voter Id: </label> {{Math.abs(voter.hash)}}
          <br>
          <label>Name: </label> {{voter.name}}
          <br>
          <label>Name: </label> {{voter.address}}
          <br>
          <VueQrcode :value="voter.hash + ''" :options="{ size: 50 }"></VueQrcode>
          <br>
        </div>
      </div>
    </div>

  </div>
</template>

<script>
import VueQrcode from '@xkeshi/vue-qrcode'
export default {
  name: 'Add',
  components: {VueQrcode},
  data () {
    return {
      voter: {
        name: 'Ram Prasad Chapagain',
        address: "Gyaneshowr, Kathmandu",
        dob: "1925/09/23",
        hash: '',
      },
      // candidate: {
      //   name: null,
      //   party: null,
      //   hash: null
      // }
    }
  },

  methods:{
    submitVoter(){
      if(this.voter.name.length > 0){
        this.voter.hash = this.hash(this.voter.name);
        console.log("voter: " + this.voter.hash);
        // this.$contract.addVoter(this.voter.hash);
      }      
    },

    // submitCandidate(){
    //   this.candidate.hash = this.hash(this.candidate.name);
    //   console.log(this.candidate.hash);
    //   this.$contract.addCandidate(this.candidate.hash, this.candidate.party);
    // },

    random(min, max){
	    return Math.floor(Math.random() * (max - min + 1)) + min;	
    },

    hash(str){
        var hash = 0;
        if (str.length == 0) return hash;
        for (var i = 0; i < str.length; i++) {
            var char = str.charCodeAt(i);
            hash = ((hash<<5)-hash)+char;
            hash = hash & hash; // Convert to 32bit integer
        }
        return hash;
    }
    


  },

  created: function(){
    this.$web3.eth.defaultAccount = this.$web3.eth.accounts[1];
  }

}
</script>

<style scoped>
  .voter-card{
    background-color: whitesmoke;
    border-style: solid;
    border-color: grey;
    border-width: 1px;
    width: 400px;
    height: 200px;
    padding: 5px;
  }

  .logo{
    width: 100px;
    height: 100px;
    position: absolute;
    left: 100px;
    top: 10px;
  }

</style>
