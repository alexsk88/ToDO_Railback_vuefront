<template>
  <div class="jumbotron" v-if="user">
  <h4>{{user.name}} {{user.second_name}}</h4>
  <p class="lead">{{user.email}}</p>
  <p class="lead">{{user.born | moment("dddd, MMMM Do YYYY") }}</p>
  <p class="lead">{{user.sex == 'M' ? 'Maculino': 'Femenino'}}</p>
  <p class="lead">{{user.since | moment("dddd, MMMM Do YYYY") }}</p>
  <hr class="my-4">
  <p><small class="text-success">Puntos</small> {{user.points}}</p>
  <p><small class="text-success">Puntos R</small> {{user.pointsr}}</p>
</div>
</template>

<script>
import axios from "axios";
export default {
  props: ['id'],
  data() {
    return {
      user: null
    };
  },
  created() {
    this.getuser(this.id)
  },
  watch: {
    id(){
      this.getuser(this.id) 
    }
  },
  methods: {
    getuser(id) {
      axios.get(`http://localhost:3000/api/users//${id}`)
      .then(res=> {
        // console.log("USER", res);
        this.user = res.data.user[0]
      });
    }
  }
};
</script>

<style></style>
