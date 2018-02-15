<template>
  <div class="container center">
    <br><br>
    <h1> 
      Admin Panel
    </h1>
    <br>
    <hr>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <div class="row">
      <div class="col-md-6">
        <router-link to="/admin/add" class="btn btn-primary btn-lg pull-right"> Register Voters </router-link>
      </div>
      <div class="col-md-6">
        <router-link to="/stats" class="btn btn-primary btn-lg pull-left"> View Election Stats </router-link>
      </div>
    </div>
    
  </div>
</template>

<script>
export default {
  name: 'Admin',
  data () {
    return {}
  },

  methods:{
   
  },

  created: function(){

  }

}
</script>

<style scoped>

</style>
