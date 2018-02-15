import Vue from 'vue'
import Vuex from 'vuex'
Vue.use(Vuex)

export const store = new Vuex.Store({
  state:{
    service: null
  },

  getters: {
    service(state){
      return state.service;
    },
  },

  mutations:{
    setService(state, service){
      state.service = service;
    },
  },

  actions:{
  }
   
});
