<template>
  <div class="more-info">
    <div class="more-info__content">
      <h1 class="more-info__header">Wanna sign up online? Sure!</h1>
      <p class="more-info__text">
        Many older people are alone or want to get to know new friends.<br>
        We believe there is a need for a service that connects people who also work for people who have low technical knowledge.
      </p>
      <SignUpForm class="more-info__sign-up" />
    </div>
  </div>
</template>

<script>
import SignUpForm from 'components/SignUpForm/SignUpForm';

export default {
  components: {
    SignUpForm,
  },
}
</script>

<style scoped>
.more-info {
  height: 50vh;
  width: 100vw;
  display: flex;
  justify-content: center;
  align-items: center;
  background-color: #ffd738;
  font-family: "Helvetica Neue";
  color: #101F2B;
  text-align: center;
  min-height: 300px;
}

.more-info__header {
  font-size: 20px;
  margin: 0 0 20px;
  font-weight: 400;
}

.more-info__text {
  font-weight: 200;
  max-width: 300px;
  margin: 0 0 20px;
  display: inline-block;
}

.more-info__sign-up {
  display: block;
}
</style>
