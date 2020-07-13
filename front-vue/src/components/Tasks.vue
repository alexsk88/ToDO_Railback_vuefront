<template>
  <div class="list-group">
    <span
      v-for="item in tasks"
      :key="item.id"
      class="list-group-item list-group-item-action"
    >
      <div class="d-flex w-100 justify-content-between">
        <h5 class="mb-1">{{ item.title }}</h5>
        <small :class="item.state ? 'text-success': 'text-danger'"
        >{{ item.state ? 'Completed': 'Pending' }}</small>
      </div>
      <p class="mb-1">{{ item.content }}</p>
      <small class="text-success"
        ><b>START:</b>
        {{ item.date_start | moment("dddd, MMMM Do YYYY") }}</small
      >
      <small class="text-danger"
        >|<b>END: </b> {{ item.date_end | moment("dddd, MMMM Do YYYY") }}</small
      >
      <div class="d-flex w-100 justify-content-left">
        <router-link
          :to="'edittask/' + item.id"
          class="material-icons text-warning"
          data-toggle="tooltip"
          data-placement="top"
          title="Edit"
          >edit</router-link
        >
        <router-link
          to="/home"
          class="material-icons text-success"
          data-toggle="tooltip"
          data-placement="top"
          title="Show"
          >visibility</router-link
        >
        <router-link
          to="/home"
          class="material-icons text-danger"
          data-toggle="tooltip"
          data-placement="top"
          title="Remove"
          >delete</router-link
        >
      </div>
    </span>
  </div>
</template>

<script>
export default {
  name: "Tasks",
  props: ["tasks"],
  mounted() {
    // console.log("ME MORNTE TSKS", this.tasks);
  }
};
</script>

<style></style>
