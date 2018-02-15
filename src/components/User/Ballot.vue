<template>
  <div class="container center">
    <br>
     <router-link to="/">
        <img src="static/images/election_commission.jpg" class="logo" />
      </router-link>
    <div class="text center">
        <h1>For Local State Representative</h1>
        <h3>Place <img src="static/images/vote_marker.png" width="40px" height="40px"e> marker in any <i>ONE(1)</i> choice of candidate</h3>
    </div>
    <br>

    <div class="ballot-paper">
      <div v-for="(c, i) in candidates" :key="i" v-on:click="selectCandidate(i)"
        :class="((c.selected === true)?'ballot-candidate ballot-candidate-selected':'ballot-candidate')">
        <img class="party-logo" :src="'static/images/'+ c.party + '.png'" />
      </div>
    </div>
    <br>
    <button class="btn btn-danger btn-lg" v-on:click="submitVote">Submit Vote</button>

    <router-link to="/ballothelp">
        <img src="static/images/help.png" class="help" />
    </router-link>

  </div>
</template>

<script>
export default {
  name: "Ballot",
  data() {
    return {
      voterId: 34534534,
      selectedIndex: null,
      candidates: null
    };
  },

  methods: {
    selectCandidate(index) {
      for (var i = 0; i < this.candidates.length; i++)
        this.candidates[i].selected = false;
      this.candidates[index].selected = true;
      this.selectedIndex = index;
    },

    submitVote() {
      //if success
      this.$contract.vote(this.voterId, this.candidates[this.selectedIndex].id);
      this.$router.push("/thanks");
    }
  },

  created: function() {
    this.$web3.eth.defaultAccount = this.$web3.eth.accounts[1];

    this.voterId = this.$route.query.asd;
    console.log(this.voterId);

    var candidates = this.$contract.getAllCandidates();
    var self = this;
    candidates = candidates.map(function(candidate) {
      var id = candidate.c[0];
      var can = self.$contract.getCandidate(id);
      return {
        id: id,
        party: can[0],
        selected: false
      };
    });
    console.log(candidates);
    this.candidates = candidates;
  }
};
</script>

<style scoped>
.ballot-paper {
  width: 1000px;
  height: 400px;
  padding: 30px;
  margin: 0 auto;
  border-style: solid;
  border-color: grey;
  border-width: 2px;
}

.ballot-candidate {
  width: 295px;
  height: 100px;
  margin: 5px;
  float: left;
  border-style: solid;
  border-color: grey;
  border-width: 1px;
  background-color: white;
  background-size: cover;
  cursor: pointer;
}

.ballot-candidate:hover {
  background-image: url("/static/images/swastik.png");
}

.ballot-candidate-selected {
  background-image: url("/static/images/swastik.png");
}

.party-logo {
  height: 80px;
  width: 80px;
  float: left;
  margin-top: 8px;
}

/* Text */
div.text h3 {
  color: #95989a;
}

i {
  color: #2f4f4f;
}

  .logo{
    width: 100px;
    height: 100px;
    position: absolute;
    left: 100px;
    top: 10px;
  }

  .btn{
    border-radius: 0px;
  }

  .help{
    width: 50px;
    height: 50px;
    position: absolute;
    right: 50px;
    top: 50%;
    cursor: pointer;
  }

</style>
