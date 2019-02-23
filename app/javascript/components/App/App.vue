<template>
  <div>
    <Header />
    <MoreInfo />
  </div>
</template>

<script>
import Header from 'components/Header/Header';
import MoreInfo from 'components/MoreInfo/MoreInfo';

export default {
  components: {
    Header,
    MoreInfo,
  },
};
</script>

<style>
body {
  margin: 0;
}
</style>
