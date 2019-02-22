import Vue from 'vue/dist/vue.esm'
import App from 'components/app'

document.addEventListener('DOMContentLoaded', () => {
  new Vue({
    el: '#app',
    components: {
      App
    },
  });
});
