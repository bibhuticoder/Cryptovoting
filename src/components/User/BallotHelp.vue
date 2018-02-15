<template>
  <div class="container center">
    <br><br><br>
    <img src="static/images/ballotguide.gif" width="512px" height="334px" />
  </div>
</template>

<script>
export default {
  name: "BallotHelp",
  components: { },
  mixins: [ ],
  data() {
    return {
    };
  },

  methods: {

  },

  created: function() {
    var self = this;
    setTimeout(function(){
      self.$router.go(-1);
    }, 4000);
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
    left: 50px;
    top: 10px;
  }

  .help{
    width: 50px;
    height: 50px;
    position: absolute;
    right: 100px;
    top: 50%;
    cursor: pointer;
  }

  .lang{
    position: absolute;
    top: 20px;
    right: 50px;
  }



</style>
