<template>
  <header class="header">
    <div class="header__content">
      <h1 class="header__headline">The <span class="header__headline--yellow">Activity</span> Network</h1>

      <!-- TODO: Change back to actual phone number: 076 686 26 84 -->
      <a
        href="sms:0766862600?body=I would like to enjoy a lunch."
        class="header__phone-number"
      >
        076 686 26 00
      </a>

      <p class="header__text">
        Feel lonely or just want to make new friends in all age groups?<br>
        Send a text to the number above and we will connect you to people with the same interest for a fun activity.<br>
      </p>
    </div>
  </header>
</template>

<script>
export default {
}
</script>

<style scoped>
.header {
  font-family: Nunito, "Helvetica Neue", Helvetica, Arial, sans-serif;
  font-weight: 700;
  display: flex;
  align-items: center;
  justify-content: center;
  background-color: #101F2B;
  height: 50vh;
  width: 100vw;
  padding: 30px;
  min-height: 300px;
  box-sizing: border-box;
}

.header__content {
  text-align: center;
}

.header__headline {
  color: white;
  margin: 0 0 30px;
  font-size: 30px;
}

.header__headline--yellow {
  color: #ffd738;
}

.header__phone-number {
  color: #ffd738;
  font-size: 40px;
  text-decoration: none;
  margin: 0 0 30px;
  display: inline-block;
}

.header__text {
  color: white;
  font-family: "Helvetica Neue";
  font-weight: 200;
  max-width: 300px;
  margin: 0;
}
</style>
