<template>
  <div>
    <form v-if="!formSubmitted" class="sign-up-form" action="/api/users/v1" method="post" @submit.prevent="signUp">
      <label for="phone">Enter your phone number:</label>
      <input type="tel" id="phone" name="phone" v-model="phoneNumber" @input="clearError">

      <input type="submit" value="Sign up now!">
      {{ error }}
    </form>

    <p v-else>
      Thanks for signing up! We will contact you shortly via text.
    </p>
  </div>
</template>

<script>
export default {
  data () {
    return {
      formSubmitted: false,
      phoneNumber: undefined,
      error: undefined,
    };
  },
  computed: {
    creationBody() {
      return JSON.stringify({
        phone_number: this.$data.phoneNumber,
      });
    }
  },
  methods: {
    clearError() {
      this.$data.error = null;
    },
    signUp(event) {
      const phoneNumberRegex = /^(\+?46|0046|0)[\s\-]?7[\s\-]?[02369]([\s\-]?\d){7}$/;

      if (!this.$data.phoneNumber.match(phoneNumberRegex)) {
        this.$data.error = 'That phone number is invalid, try again';
        return;
      }

      const action = event.target.getAttribute('action');
      const method = event.target.getAttribute('method');

      fetch(action, {
        method,
        body: this.creationBody,
        headers: {
          "Content-Type": "application/json",
        },
      })
        .then(response => response.json())
        .then((response) => {
          if (response.errors) {
            this.$data.error = response.errors[0];
            return;
          }

          this.$data.formSubmitted = true;
        });
    }
  }
}
</script>
