<template>
  <div>
    <Navbar />
    <div class="container my-5 animate__animated animate__fadeInLeft animate__faster">
      <h1 v-if="!isEdit">Add Task</h1>
      <h1 v-if="isEdit">Edit Task</h1>
      <form @submit.prevent="HandleFormTaks" class="formtasks">
        <div class="form-group">
          <label for="title">Title</label>
          <input
            type="text"
            class="form-control"
            id="title"
            aria-describedby="titleHelp"
            v-model.trim="$v.task.title.$model"
            :class="{'is-valid':!$v.task.title.$invalid,
            'is-invalid':$v.task.title.$invalid}"
          />
          <small id="emailHelp" class="form-text text-muted"
            >We'll never share your email with anyone else.</small
          >
        </div>
        <div class="form-group">
          <label for="content">Content</label>
          <textarea
            type="text"
            class="form-control"
            id="content"
            rows="3"
            v-model.trim="$v.task.content.$model"
            :class="{'is-valid':!$v.task.content.$invalid,
            'is-invalid':$v.task.content.$invalid}"
          ></textarea>
        </div>

        <div class="form-group">
          <label for="date_start">Date Start</label>
          <input type="date" class="form-control" 
          v-model.trim="$v.task.date_start.$model"
          :class="{'is-valid':!$v.task.date_start.$invalid,
            'is-invalid':$v.task.date_start.$invalid}"
          id="date_start" rows="3" />
        </div>

        <div class="form-group">
          <label for="date_end">Date End</label>
          <input type="date" class="form-control" 
          v-model.trim="$v.task.date_end.$model"
          :class="{'is-valid':!$v.task.date_end.$invalid,
            'is-invalid':$v.task.date_end.$invalid}"
          id="date_end" rows="3" />
        </div>

        <div class="form-group form-check">
          <input type="checkbox" class="form-check-input" 
          v-model="task.state" id="state"  />
          <label class="form-check-label" for="state">State</label>
        </div>
        <button type="submit" class="btn btn-primary"
        :disabled="$v.task.$invalid">
        {{isEdit ? 'Update': 'Save'}}</button>
      </form>
    </div>
  </div>
</template>

<script>
import axios from "axios";
import { required, minLength } from "vuelidate/lib/validators";
import { Global } from "../Global";
import { Token } from "../GetUser";
import Task from "../models/TaskModel";
import Navbar from "./Navbar";

export default {
  name: "FormTask",
  data() {
    return {
      isEdit: false,
      id: null,
      task: new Task("", "", "", "", false),
      url: Global.url
    };
  },
  validations: {
    task: {
      title: {
        required,
        minLength: minLength(2)
      },
      content: {
        required,
        minLength: minLength(2)
      },
      date_start: {
        required,
    
      },
      date_end: {
        required,
       
      },

      // image: null
    }
  },
  mounted() {
    if (this.$route.params.id) {
      this.id = this.$route.params.id;
      this.isEdit = true;
      this.gettaskbyID();
    }
  },
  components: {
    Navbar
  },
  methods: {
    gettaskbyID() {

    },
    HandleFormTaks(){
        console.log(this.task);
    }
  }
};
</script>

<style scope>
.formtasks{
    width: 60%;
}
</style>
