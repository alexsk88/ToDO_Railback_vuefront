<template>
  <div class="list-group">
    <a v-for="(item) in tasks" :key="item.id" 
    href="#" 
    class="list-group-item list-group-item-action">
      <div class="d-flex w-100 justify-content-between">
        <h5 class="mb-1">{{item.title}}</h5>
        <small>{{item.state}}</small>
      </div>
      <p class="mb-1">{{item.content}}</p>
      <small>Donec id elit non mi porta.</small>
    </a>
  </div>
</template>

<script>
export default {
  name: "Tasks",
  props: ["tasks"],
  mounted(){
    // console.log("ME MORNTE TSKS", this.tasks);
  }
};
</script>

<style></style>
