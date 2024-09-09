import { createRouter, createWebHistory } from 'vue-router'

import Main from '../views/Main.vue'
import App from '../App.vue'

const routes = [
  {
    path: '/',
    name: 'login',
    component: App
  },
  {
    path: '/main',
    name: 'main',
    component: Main,
    meta: { requiresAuth: true } // Protect this route
  }
]
const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL), // saves routes so you can go forward and back in your application
  routes
})

export default router