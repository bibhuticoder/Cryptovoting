<template>
  <div class="container center">
     <div class="row">
        <div class="col-md-10">            
        </div>
        <div class="col-md-2 button-group">
            <button id = "selected" class="btn">EN</button>
            <button id = "deselected" class="btn second">NP</button>
        </div>

        <router-link class="btn btn-primary btn-lg back" to="/">
          <span class="glyphicon glyphicon-arrow-left"></span>
        </router-link>
    </div>
    <br><br><br><br><br><br>
    <!-- Main -->
    <div class="container main center">
        <img alt="election commission banner" id = "short-logo" width="300px" height="300px" src ="static/images/election_commission.jpg">
        <br><br>
        <p class="thanks">Thank You for Voting.</p>
    </div>
  </div>
</template>

<script>
export default {
  name: "Thanks",
  components: { },
  mixins: [ ],
  data() {
    return {
    };
  },

  methods: {

  },

  created: function() {
   
  }
};
</script>

<style scoped>
  .top{
      margin-top: 5px;
  }

  .button-group{
      margin-top: 10px;
  }

  .button-group button{
      padding: 10px;
  }   

  .button-group button:first-of-type{
      margin-right: -4px;
      background-color: #C3C2C2;
      color: #FFFFFF;
      border-radius: 0;
  }


  .button-group btn-second{
      margin-right: -4px;
      background-color: #C3C2C2;
      color: #FFFFFF;
      border-radius: 0;
  }

  .button-group .second{
      background-color: white;
      color: #F14B31;
  }
  
  /* Main */

  .center{
      margin-top: 10px;
      text-align: center;
  }

  .center p{
      color: #95989A;
      margin-top: 10px;
      font-size: 50px;
  }

  .back{
    position: absolute;
    left: 20px;
    top: 20px;
  }


</style>
