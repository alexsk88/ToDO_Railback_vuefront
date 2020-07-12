<template>
  <div class="list-group">
    <a v-for="(item) in productos" :key="item.id" 
    href="#" 
    class="list-group-item list-group-item-action active">
      <div class="d-flex w-100 justify-content-between">
        <h5 class="mb-1">List group item heading</h5>
        <small>3 days ago</small>
      </div>
      <p class="mb-1">
        Donec id elit non mi porta gravida at eget metus. Maecenas sed diam eget
        risus varius blandit.
      </p>
      <small>Donec id elit non mi porta.</small>
    </a>
  </div>
</template>

<script>
export default {
  name: "Tasks",
  props: ["productos"],
};
</script>

<style></style>
