<template>
  <div id="app">
    <router-view></router-view>
  </div>
</template>

<script>
import Navbar from "./components/Navbar.vue";
export default {
  components: {
    Navbar
  },
  name: 'app',
   data () {
    return {
    }
  },
  
  methods:{
    
  },
  created(){
    
  }
  
  
}


</script>

<style>
  .center{
    text-align: center;
    margin: 0 auto;
  }
</style>
