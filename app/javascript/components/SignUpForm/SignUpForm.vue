<template>
  <div class="sign-up-form">
    <form v-if="!formSubmitted" class="sign-up-form__form" action="/api/users/v1" method="post" @submit.prevent="signUp">
      <div>
        <label class="sign-up-form__label" for="phone">Enter your phone number:</label>
      </div>
      <div>
        <input class="sign-up-form__input" type="tel" id="phone" name="phone" v-model="phoneNumber" @input="clearError">
      </div>

      <div>
        <input class="sign-up-form__button" type="submit" value="Sign up now!">
      </div>
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

<style scoped>
.sign-up-form__label {
  margin-bottom: 5px;
  font-weight: 200;
}

.sign-up-form__input {
  margin-bottom: 10px;
  background-color: transparent;
  border: 0;
  color: #101F2B;
  border-bottom: solid 1px #101F2B;
  width: 80%;
  padding: 10px 0;
  font-size: 16px;
  font-weight: 200;
  text-align: center;
}

.sign-up-form__button {
  border: solid 1px #101F2B;
  border-radius: 20px;
  font-size: 16px;
  color: #101F2B;
  font-weight: 200;
  background-color: transparent;
  padding: 10px 20px;
}
</style>
