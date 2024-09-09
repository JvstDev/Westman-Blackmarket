<script setup>
// vue and vue router import
import {ref, onBeforeUnmount, onMounted, onUnmounted, provide} from "vue"
import { RouterView, useRouter } from "vue-router" // Importing vue router



// mdi icon import 
import SvgIcon from "@jamescoyle/vue-icon"
import {mdiLock} from "@mdi/js"

const path = ref(mdiLock)

const isAuthenticated = ref(false)
const loginInfo = ref({ username: '', password: '' })

const router = useRouter();

const show_nui = ref(false);

const handle_openui = (event) => {
  const data = event.data;
  if (data.action === 'open') {
    show_nui.value = true;
  } else if (data.action === 'close') {
    show_nui.value = false;
  }
}

const handle_keydown = (event) => {
  if (event.key === "Escape" || event.key === "Esc") {
    show_nui.value = false
    fetch("https://westman_blackmarket/close")
  }
}

const items_array = ref({
  weapons: [],
  drugs: []
});

const handle_items = (event) => {
  if (event.data.action === "get_items_info") {
  items_array.value = event.data.info;
  }
}

const handle_nui_message = (event) => {
  if (event.data.action === 'send_login_info') {

    const [username, password] = event.data.info
    loginInfo.value = { username, password }
  }
}

provide('items_array', items_array);

onMounted(() => {
  window.addEventListener('message', handle_nui_message);
  window.addEventListener('message', handle_items);
  window.addEventListener('message', handle_openui);
  window.addEventListener('keydown', handle_keydown);
})

onBeforeUnmount(() => {
  window.removeEventListener('message', handle_openui);
  window.removeEventListener('keydown', handle_keydown);
  window.removeEventListener('message', handle_items);
});

onUnmounted(() => {
  window.removeEventListener('message', handle_nui_message)
})

const password_input = ref('');
const username_input = ref('');

const username_rules = [
  value => !!value || 'You must enter a username',
  value => value === loginInfo.value.username || 'Incorrect username',
]

const password_rules = [
value => !!value || 'You must enter a password',
value => value === loginInfo.value.password || 'Incorrect password',
]

const handle_submit = () => {
  if (username_input.value === loginInfo.value.username && password_input.value === loginInfo.value.password) {
    isAuthenticated.value = true 
    router.push({ name: 'main'});
  } else {
   fetch("https://westman_blackmarket/error")
  }
}

</script>

<template>
  <div id="app" v-if="show_nui">
    
    <div v-if="!isAuthenticated">
      <img class="overlay" src="https://global.discourse-cdn.com/pocketgems/uploads/episodeinteractive/original/3X/7/0/7070d17578d0f4124c5f9264c5a70b21a98919d8.png">
      
      <div class="container">

        <div class="header">
          <div class="website-url">
            <button class="arrow-back"><span class="material-symbols-outlined">arrow_forward</span></button> 
            <button class="arrow-forward"><span class="material-symbols-outlined">arrow_back</span></button> 
            <button class="refresh"><span class="material-symbols-outlined">refresh</span></button>
            <p> <svg-icon type="mdi" :path="path" id="url-lock"></svg-icon> www.blackmarket.com/login</p>
          </div>

          <v-sheet class="mx-auto" width="300" id="login">
            <v-form @submit.prevent="handle_submit">
              <v-text-field class="field-input" v-model="username_input" :rules="username_rules" label="Username"></v-text-field>
              <v-text-field class="field-input" v-model="password_input" :rules="password_rules" label="Password"></v-text-field>
              <v-btn class="login-button" type="submit" block>Log in</v-btn>
            </v-form>
          </v-sheet>
        </div> 
      </div> 
    </div>

    
    <router-view v-if="isAuthenticated" :items="items_array"></router-view>
  </div>
</template>

<style>

body {
  margin: 0;
  height: 100vh; 
  display: flex;
  justify-content: center;
  align-items: center;
  overflow: hidden;
}


#app {
  top: -400px;
  position: relative;
}

.container {
  top: 225px;
  position: relative;
  font-family: arial;
  font-size: 24px;
  margin: 25px;
  width: 1150px;
  display: flex;
  justify-content: center;
  align-items: center;
  background-image: linear-gradient(65deg, rgb(31, 31, 31), rgb(12, 12, 12));
  height: 646px;
}

.header {
  border-top-left-radius: 10px;
  border-top-right-radius: 10px;
  width: 1600px;
  height: 50px;
  background: rgb(212, 212, 212);
  bottom: 295px;
  position: relative;
}

.website-url {
  width: 800px;
  background-color: rgb(173, 173, 173);
  height: 33px;
  border-radius: 15px;
  position: absolute;
  display: inline;
  top: 10px;
  left: 200px;
}

.website-url p {
  margin-left: 90px;
  font-size: 22px;
}

#url-lock {
  position: absolute;
  margin-top: 5px;
  left: 55px;
  color: rgb(53, 53, 53);
}

.arrow-forward {
  top: 5px;
  position: absolute;
  left: -130px;
  color: rgb(59, 59, 59);
  background: transparent;
  width: 30px;
  height: 30px;
}

.arrow-back {
  top: 5px;
  position: absolute;
  color: rgb(59, 59, 59);
  background: transparent;
  width: 30px;
  height: 30px;
  left: -90px;
}

.refresh {
  top: 5px;
  position: absolute;
  color: rgb(59, 59, 59);
  background: transparent;
  width: 30px;
  height: 30px;
  left: -45px;
}

.overlay {
  position: relative;
  right: 28px;
  top: 1200px;
  display: flex;
  align-items: center;
  justify-content: center;
}

#login {
  top: 250px ;
  position: relative ;
  background: transparent;
  color: white;
}

.field-input {
 color: white; 
 background: transparent;
}

.login-button {
  margin-top: 10px;
  background: rgb(43, 43, 43) !important;
  color: white !important;
  height: 45px !important;
}

</style>