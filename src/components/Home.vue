<template>
  <div class="container center">

            <div class = "container top">
            <div class="row">
                <div class="col-md-10">
                    <img alt="election commission banner" id = "elction-commission-logo" src ="static/images/election_banner.jpg">
                </div>
                <div class="col-md-2 button-group">
                    <button id = "selected" class="btn">EN</button>
                    <button id = "deselected" class="btn second">NP</button>
                </div>            
            </div>

            <div class="row info">
                    <div class="col-md-6">    
                        <div id = "vote-count">
                            <h2 class="center">
                              Vote Count
                            </h2> 
                            <br><br>                            
                            <!-- Insert vote counter -->
                            <div id = "vote-count-counter">
                              <div id="votes-counter"></div>
                              <label>{{numVotes}}</label> of  <label>{{numVoters}}</label> have already voted.
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div id = "time-count">
                            <h2 class="center">Time Remaining</h2> 
                            <br>    <br>                                 
                            <!-- Insert time counter  -->
                            <div id = "time-count-counter">
                              <div id="clock"></div>
                              <!-- {{timeRemaining}} -->
                            </div>
                        </div>
                    </div>
            </div>
                        
            <div class="container lower center">
                <router-link id="cast-vote" class="btn btn-danger" to="/auth">CAST VOTE</router-link>
                <br><br>
                <router-link class="btn btn-default" to="/basichelp">
                  <img src="static/images/help.png" width="35px" height="35px">
                  Help/ Assistance
                </router-link>
            </div>
        </div>
  </div>
</template>

<script>
export default {
  name: "Home",
  data() {
    return {
      numVoters: 5679,
      numVotes: 0,
      timeRemaining: null,
      message: "",
      messageInput: ""
    };
  },

  methods: {
    setMessage(msg) {
      // this.$contract.setMessage(msg);
    }
  },

  created: function() {
    console.log(this.$contract);
    this.$web3.eth.defaultAccount = this.$web3.eth.accounts[1];

    //total number of voters
    this.numVoters = this.$contract.totalVoters().c[0];

    //total number of votes
    this.numVotes = this.$contract.totalVotes().c[0];

    var votedEvt = this.$contract.Voted();
    var self = this;
    votedEvt.watch(function(error, result) {
      if (error) console.log(error);
      else {
        console.log(result.args.total.c[0]);
      }
    });
  },

  mounted() {
    //election end time
    this.timeRemaining = (this.$contract.getEndTime().c[0] - Date.now())/1000;
    console.log(this.timeRemaining);

    var clock = $("#clock").FlipClock({
      autoStart: false,
      callbacks: {
        stop: function() {
          $(".message").html("Election has ended.");
        }
      }
    });

    clock.setTime(this.timeRemaining);
    clock.setCountdown(true);
    clock.start();

    // Votes
    var voteCount = $("#votes-counter").FlipClock(this.numVotes, {
      clockFace: 'Counter'
    });


  }
};
</script>

<style scoped>
/* Header */

.top {
  margin-top: 5px;
}

.button-group {
  margin-top: 10px;
}

.button-group button {
  padding: 10px;
}

.button-group button:first-of-type {
  margin-right: -4px;
  background-color: #c3c2c2;
  color: #ffffff;
  border-radius: 0;
}

.button-group btn-second {
  margin-right: -4px;
  background-color: #c3c2c2;
  color: #ffffff;
  border-radius: 0;
}

.button-group .second {
  background-color: white;
  color: #f14b31;
}

/* Info */

div.info {
  margin-top: 80px;
  color: #95989a;
  font-weight: bolder;
  font-family: Segoe UI;
}

.center {
  text-align: center;
}

/* Lower */
div.lower {
  position: relative;
  margin-top: 140px;
}

#cast-vote {

  text-align: center;
  line-height: 50px;
  padding: 10px;
  padding-right: 20px;
  padding-left: 20px;
  border-radius: 0;

  font-size: 30px;
}

div.lower button.help {
  background-color: white;
  border-style: solid;
  border-width: 1px;
  border-color: #c0c0c0;
  color: #95989a;
  padding: 10px 10px;
  border-radius: 0;
  margin-top: 10px;
}

#votes-counter{
  width: 140px;
  margin: 0 auto !important;
}

#clock{
  width: 460px;
  margin: 0 auto !important;
}

</style>