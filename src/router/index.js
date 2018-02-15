import Vue from 'vue'
import Router from 'vue-router'
import Home from '@/components/Home'
import Admin from '@/components/Admin/Admin'
import Add from '@/components/Admin/Add'
import Stats from '@/components/Admin/Stats'
import Ballot from '@/components/User/Ballot'
import Auth from '@/components/User/Auth'
import QRHelp from '@/components/User/QRHelp'
import BasicHelp from '@/components/User/BasicHelp'
import BallotHelp from '@/components/User/BallotHelp'
import Thanks from '@/components/User/Thanks'

Vue.use(Router)

export default new Router({
  routes: [
    { path: '/', name:'home', component: Home },
    { path: '/auth', name:'auth', component: Auth },
    { path: '/QRHelp', name:'QRHelp', component: QRHelp },
    { path: '/BasicHelp', name:'BasicHelp', component: BasicHelp },
    { path: '/BallotHelp', name:'BallotHelp', component: BallotHelp },
    { path: '/thanks', name:'thanks', component: Thanks },
    { path: '/ballot', name:'ballot', component: Ballot },
    { path: '/admin', name:'admin', component: Admin },       
    { path: '/admin/add', name:'add', component: Add },
    { path: '/stats', name:'stats', component: Stats },          
  ]
})
