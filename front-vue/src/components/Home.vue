<template>
  <div >
    <Navbar />
    <div class="container my-5">
      <h1>My Tasks</h1>

      <router-link to="/addtask"  class="btn btn-danger my-3 text-white">Add task</router-link>
      <ul class="nav nav-tabs tabstaks_box" id="tabtasks" role="tablist" >
        <li class="nav-item" role="presentation">
          <a
            class="nav-link active"
            id="pending-tab"
            data-toggle="tab"
            href="#pending"
            role="tab"
            aria-controls="pending"
            aria-selected="true"
            >Pending</a
          >
        </li>
        <li class="nav-item" role="presentation">
          <a
            class="nav-link"
            id="completed-tab"
            data-toggle="tab"
            href="#completed"
            role="tab"
            aria-controls="completed"
            aria-selected="false"
            >Completed</a
          >
        </li>
      </ul>
      <div class="tab-content" id="tabtasksContent">
        <div
          class="tab-pane fade show active"
          id="pending"
          role="tabpanel"
          aria-labelledby="pending-tab"
        >
          <Tasks :tasks="tasks" />
        </div>
        <div
          class="tab-pane fade"
          id="completed"
          role="tabpanel"
          aria-labelledby="completed-tab"
        >
          <Tasks :tasks="tasks" />
        </div>
        <div
          class="tab-pane fade"
          id="contact"
          role="tabpanel"
          aria-labelledby="contact-tab"
        >
        
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";
import { Global } from "../Global";
import Navbar from "./Navbar";
import Tasks from "./Tasks";
export default {
  name: "Home",
  data() {
    return {
      tasks: null,
      configAxios: null,
      url: Global.url
    };
  },
  mounted() {
    this.getToken();
    this.getTasks();
  },

  components: {
    Navbar,
    Tasks
  },
  methods: {
    getToken() {
      // Este metodo se puede modular
      let token = localStorage.getItem("token");
      // console.log( localStorage.getItem('token'));
      this.configAxios = {
        headers: {
          Authorization: "Bearer " + token
        }
      };
    },
    getTasks() {
      axios
        .get(`${this.url}tasks/getall`, this.configAxios)
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

<style scope>
.tabstaks_box{
  width: 70%;
}
</style>j
