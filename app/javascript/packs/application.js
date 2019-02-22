import Vue from 'vue/dist/vue.esm'
import App from 'components/App/App'

document.addEventListener('DOMContentLoaded', () => {
  new Vue({
    el: '#app',
    components: {
      App
    },
  });
});
