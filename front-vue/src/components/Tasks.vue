<template>
  <div class="list-group">
    <span
      v-for="item in tasks"
      :key="item.id"
      class="list-group-item list-group-item-action"
    >
      <div class="d-flex w-100 justify-content-between">
        <h5 class="mb-1">{{ item.title }}</h5>
        <small :class="item.state ? 'text-success' : 'text-danger'">{{
          item.state ? "Completed" : "Pending"
        }}</small>
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
        <span
          @click="deleteTask(item.id, item.title)"
          class="material-icons text-danger pointer"
          data-toggle="tooltip"
          data-placement="top"
          title="Remove"
          >delete</span
        >
      </div>
    </span>
  </div>
</template>

<script>
import axios from "axios";
import swal from "sweetalert";
import { Global } from "../Global";
import { TokenBarer } from "../GetUser";
export default {
  name: "Tasks",
  props: ["query"],
  data() {
    return {
      tasks: null,
      tokenbarer: TokenBarer,
      url: Global.url
    };
  },
  mounted() {
    this.getTasks();
  },
  methods: {
    deleteTask(id, name) {
        let configAxios = {
        headers: {
          Authorization: this.tokenbarer
        }
      };
      swal({
        title: "Are you sure you want to delete ?",
        text: name,
        buttons: true,
        dangerMode: true
      }).then(willDelete => {
        if (willDelete) {
          axios
            .delete(`${this.url}tasks/remove?id=${id}/`,configAxios)
            .then(res => {
              console.log(res);
              console.log("-> ", res.data.status);
              if (res.data.status == "success") {
                swal({
                  title: "Deleted Task",
                  icon: "success"
                });
                 this.getTasks()
              }
            });
        } else {
          swal("You have canceled the deletion");
        }
      });
    },
    getTasks() {
      let configAxios = {
        headers: {
          Authorization: this.tokenbarer
        }
      };
      axios
        .get(`${this.url}tasks/getall?state=${this.query}`, configAxios)
        .then(res => {
          if (res.data.status == "success") {
            this.tasks = res.data.tasks;
            console.log(this.tasks);
          } else if (res.data.status == "error") {
            console.log(res.data.errors);
          }
        })
        .catch(err => console.log(err));
    }
  }
};
</script>

<style></style>
