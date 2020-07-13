<template src="./Formtask.html"></template>

<script>
import axios from "axios";
import { required, minLength } from "vuelidate/lib/validators";
import { Global } from "../Global";
import { TokenBarer } from "../GetUser";
import Task from "../models/TaskModel";
import Navbar from "./Navbar";

export default {
  name: "FormTask",
  data() {
    return {
      isEdit: false,
      tokenbarer: TokenBarer,
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
        required
      },
      date_end: {
        required
      },
      state: {}

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
      let configAxios = {
        headers: {
          Authorization: this.tokenbarer
        }
      };
      // console.log(configAxios);
      axios
        .get(`${this.url}tasks/getone?id=${this.id}`, configAxios)
        .then(res => {
          // console.log("DATA ",res);
          if (res.data.status == "success") {
            this.task = res.data.tasks;
            this.task.date_start = new Date(this.task.date_start)
              .toISOString()
              .slice(0, 10);
            this.task.date_end = new Date(this.task.date_end)
              .toISOString()
              .slice(0, 10);
            // console.log(this.task);
          } else if (res.data.status == "error") {
            console.log("ERROR>", res);
          }
        })
        .catch(err => console.log(err));
    },
    HandleFormTaks() {
      let configAxios = {
        headers: {
          Authorization: this.tokenbarer
        }
      };
      // console.log(this.task);
      if (this.isEdit) {
        axios
          .put(`${this.url}tasks/update?id=${this.id}`, this.task, configAxios)
          .then(res => {
            if (res.data.status == "success") {
              console.log("EDIATDO>", this.tasks);
            } else if (res.data.status == "error") {
              console.log("ERROR al editat>", res);
            }
          })
          .catch(err => console.log(err));
      } else {
        axios
          .post(`${this.url}tasks/create`, this.task, configAxios)
          .then(res => {
            if (res.data.status == "success") {
              console.log("SUCCES>", this.tasks);
            } else if (res.data.status == "error") {
              console.log("ERROR>", res);
            }
          })
          .catch(err => console.log(err));
      }
    }
  }
};
</script>

<style scope>
.formtasks {
  width: 60%;
}
</style>
