<template>
  <div>
    <Navbar />
    <div
      class="container my-5 animate__animated animate__fadeInLeft animate__faster"
    >
      <h1>My Tasks</h1>

      <router-link to="/addtask" class="btn btn-danger my-3 text-white"
        >Add task</router-link
      >
      <ul
        class="nav nav-tabs tabstaks_box mx-auto"
        id="tabtasks"
        role="tablist"
      >
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
      <div class="tab-content tabstaks_box mx-auto" id="tabtasksContent">
        <div
          class="tab-pane fade show active"
          id="pending"
          role="tabpanel"
          aria-labelledby="pending-tab"
        >
          <Tasks query="false" />
        </div>
        <div
          class="tab-pane fade"
          id="completed"
          role="tabpanel"
          aria-labelledby="completed-tab"
        >
          <Tasks query="true" />
        </div>
        <div
          class="tab-pane fade"
          id="contact"
          role="tabpanel"
          aria-labelledby="contact-tab"
        ></div>
      </div>
    </div>
  </div>
</template>

<script>
import Navbar from "./Navbar";
import Tasks from "./Tasks";
export default {
  name: "Home",
  data() {
    return {};
  },

  components: {
    Navbar,
    Tasks
  },
  methods: {}
};
</script>

<style scope>
.tabstaks_box {
  width: 60% !important;
}</style
>j
