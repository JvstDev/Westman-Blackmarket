<script setup>
// vue ref function import
import {ref, inject } from 'vue';

// mdi icon import
import SvgIcon from '@jamescoyle/vue-icon';
import { mdiLock } from '@mdi/js';

const path = ref(mdiLock);

const items_array = inject('items_array', {
  weapons: [],
  drugs: []
});

const information = ref(false)

const selected_category = ref('weapons');

const set_category = (category) => {
selected_category.value = category
}

const buy_item = (item) => {
  const { name: item_name, hash: item_hash, price: item_price, quantity: item_quantity } = item;

fetch('https://westman_blackmarket/buy', {
  method: 'POST',
    headers: {
      'Content-Type': 'application/json; charset=UTF-8',
    },
  body: JSON.stringify({item_name, item_hash, item_price, item_quantity})
  });
}


</script>

<template>
<img class="overlay" src="https://global.discourse-cdn.com/pocketgems/uploads/episodeinteractive/original/3X/7/0/7070d17578d0f4124c5f9264c5a70b21a98919d8.png">

<div class="container">

 <div class="header">
   <div class="website-url">
     <button class="arrow-back"><span class="material-symbols-outlined">arrow_forward</span></button> 
     <button class="arrow-forward"> <span class="material-symbols-outlined">arrow_back</span></button> 
     <button class="refresh"> <span class="material-symbols-outlined">refresh</span></button>
     <p> <svg-icon type="mdi" :path="path" id="url-lock"></svg-icon> www.blackmarket.com/main</p>
    </div>
</div>

  <v-layout>
      <v-navigation-drawer class="sidebar">
       
        <v-list density="compact" nav>
          <v-list-item title="Weapons" value="weapons" @click="set_category('weapons'); information = false"></v-list-item>
          <v-divider></v-divider>
          <v-list-item title="Drugs" value="drugs" @click="set_category('drugs'); information = false"></v-list-item>
          <v-divider></v-divider>
          <v-list-item title="Information" value="info" @click="set_category(''); information = true"></v-list-item>
          <v-divider></v-divider>
        </v-list>

      </v-navigation-drawer>
    </v-layout>

    <div class="grid-container" v-if="items_array[selected_category]">
      <div v-for="item in items_array[selected_category]" :key="item.hash">
        <img class="product-img" :src="item.img">
        <v-divider :thickness="1" class="border-opacity-50" id="divider"></v-divider>
        <p class="product-title">{{item.name}}</p>
        <p class="product-price">Price: {{item.price}} kr</p>
       <v-btn variant="text" class="buy-button" @click="buy_item(item)"> <span class="material-symbols-outlined" id="cash-icon">payments</span> Order</v-btn>
      </div>
    </div>
    <div class="info-div" v-if="information">
      <h3 class="policy-title">Policy</h3>

   <h4 class="shipping-title">Shipping</h4>
   <p class="shipping-paragraph">Direct delivery</p>

   <h4 class="guarantee-title">Guarantee</h4>
   <p class="guarantee-paragraph">100 % success rate</p>
    </div>
    

</div>
</template>

<style>

.sidebar {
  top: 378px !important;
  height: 591px !important;
  left: 679px !important;
  position: relative;
  width: 130px !important;
  background: rgb(39, 39, 39) !important;
  color: white !important;
}

.info-div {
  top: 55px;
  right: 0px;
  position: absolute;
  width: 1050px;
  height: 590px;
  background: rgb(22, 22, 22);
  color: white;
}

.policy-title {
  top: 10px;
  left: 460px;
  position: absolute;
}

.shipping-title {
  top: 150px;
  left: 455px;
  position: absolute;
}

.shipping-paragraph {
  top: 200px;
  left: 435px;
  position: absolute;
}

.guarantee-title {
  top: 300px;
  left: 450px;
  position: absolute;
}

.guarantee-paragraph {
  top: 350px;
  left: 410px;
  position: absolute;
}

.grid-container {
  right: 0px;
  bottom: 0px;
  display: grid;
  grid-template-columns: 310px 310px 310px;
  column-gap: 25px;
  row-gap: 15px;
  overflow: scroll;
  position: absolute;
  text-align: center;
  align-items: center;
  justify-content: center;
  height: 592px;
  width: 1020px;
  background: rgb(36, 36, 36);
}

::-webkit-scrollbar {
  display: none;
}

.grid-container > div {
  left: 5px;
  top: 30px;
  position: relative;
  width: 300px;
  height: 270px;
  background-color: rgb(26, 26, 26);
  color: white;
  border-radius: 10px;
}

.product-img {
  opacity: 0.6;
  margin-top: 15px;
  height: 110px;
  width: 250px;
  object-fit: contain;
}

.product-title {
  margin-top: 8px;
  position: absolute;
  left: 30px;
  display: inline;
  color: rgb(226, 226, 226);
}

.product-price {
  display: inline;
  position: absolute;
  bottom: 65px;
  left: 30px;
  color: rgb(226, 226, 226);
  font-size: 18px;
}


.buy-button {
  width: 160px;
  height: 40px !important;
  top: 85px;
  position: absolute;
  background: rgb(24, 24, 24) !important;
  color: rgb(5, 100, 5) !important;
  border-radius: 5px !important;
}

#divider {
  color: white;
}

#cash-icon {
  margin-right: 10px;
  color: color !important;
}

</style>