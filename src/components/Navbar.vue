<template>
  <nav class="navbar navbar-inverse">
    <div class="container-fluid">
      <div class="navbar-header">
        <router-link class="navbar-brand" to="/">
          <span class="glyphicon glyphicon-king"></span>&nbsp;  CryptoVoting
        </router-link>
      </div>

      <!--<div class="collapse navbar-collapse" id="to-collapse">-->
        <ul class="nav navbar-nav navbar-right">
          <li>            
            <router-link to="/admin">              
              <span class="glyphicon glyphicon-dashboard"></span>
              Admin Panel
            </router-link>
            
          </li>
        </ul>
      <!--</div>-->
    </div>
  </nav>
</template>

<script>
export default {
  components: {},
  name: 'navbar',
  methods: {

  },
  computed: {

  }
}
</script>

<style scoped>
  .navbar{
    border-radius: 0px !important;
    height: 50px;
    z-index:10;
    background-color: #24292E;
    /* box-shadow: 1px 1px 2px black; */
  }

</style>
