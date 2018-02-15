<template>
  <div class="container">
    
    <router-link to="/">
      <img src="static/images/election_commission.jpg" class="logo" />
    </router-link>

    <img src="static/images/lang.jpg" class="lang" />

    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    
    <h1>Basic user help</h1>
    <hr>
    <ul class="list-group">
      <li class="list-group-item" v-for="(q, i) in questions" :key="i">
        {{q}}
      </li>
    </ul>
  </div>
</template>

<script>
export default {
  name: "BasicHelp",
  components: { },
  mixins: [ ],
  data() {
    return {
      questions: [
        "संविधान सभा सदस्य निर्वाचनका लागि कस्तो निर्वाचन प्रणालीको व्यवस्था गरिएको छ ?",
        "पहिलो हुने निर्वाचित हुने निर्वाचन प्रणाली भन्नाले के बुझिन्छ ?",
        "समानुपातिक निर्वाचन प्रणाली भन्नाले के बुझिन्छ ?",
        "उम्मेदवारको बन्दसूची भनेको के हो ?",
        "समानुपातिक निर्वाचन प्रणालीतर्फका दाबी विरोधसम्बन्धी व्यवस्था के छ ?",
        "उम्मेदवारको बन्दसूचीको ढाचा कस्तो हुन्छ ?",
        "राजनीतिक दलहरूले निर्वाचन आयोगमा पेश गर्ने उम्मेदवारको बन्दसूचीको ढाँचा देहाय बमोजिम छ"
      ]
    };
  },

  methods: {

  },

  created: function() {

  }
};
</script>

<style scoped>


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
