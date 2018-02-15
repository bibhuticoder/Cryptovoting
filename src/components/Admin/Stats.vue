<template>
  <div class="container">
    <div class="row">
        <div class="col-md-12">
          <router-link to="/">
            <img src="static/images/election_commission.jpg" class="logo" />
          </router-link>
          <br><br><br>
            <h3>Vote Statistics</h3>
            <hr>
            <div class="well">
              <ul class="list-group">
                <li class="list-group-item" v-for="(candidate, i) in candidates" :key="i">
                  <img :src="'static/images/' + candidate.party + '.png'" width="25px" height="25px" /> 
                  <label>{{candidate.party}}</label>
                  <button class="btn btn-primary pull-right">{{candidate.votes}}</button>
                </li>
              </ul>

            </div>            
        </div>
        
    </div>
  </div>
</template>

<script>
export default {
  name: "Stats",
  components: {},
  data() {
    return {};
  },

  methods: {
  },

  created: function() {   
    this.$web3.eth.defaultAccount = this.$web3.eth.accounts[1];

    var candidates = this.$contract.getAllCandidates();
    var self = this;
    candidates = candidates.map(function(candidate){
      var id = candidate.c[0];
      var can = self.$contract.getCandidate(id); 
      console.log(can);
      return({
        id: id,
        party: can[0],
        votes: can[1].c[0],
        selected: false
      });      
    });
    console.log(candidates);
    this.candidates = candidates;


  }

};
</script>

<style scoped>
.logo{
    width: 50px;
    height: 50px;
    position: absolute;
    left: 50px;
    top: 10px;
  }

</style>
