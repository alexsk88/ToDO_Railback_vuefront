<template>
  <div id="app">
    <router-view/>
  </div>
</template>

<script>
export default {
  name: 'App',
};
</script>

<style>
.doted{
  border: 1px dotted red;
}
.flexcolumcenter{
  display: flex;
  flex-flow: column wrap;
  justify-content: center;
}
.pointer {
  cursor: pointer;
}
</style>
