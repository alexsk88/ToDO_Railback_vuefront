<template>
  <div>
    <Navbar />
    <div class="container mt-5">
      <div class="form-group">
        <label for="exampleFormControlSelect1">Seleccione Usuario</label>
        <select class="form-control" id="exampleFormControlSelect1" v-model="selected">
          <option v-for="user in users" :value="user.id" :key="user.id">
          {{user.id}} - {{user.name}}
          </option>
        </select>
      </div>
      <UserData :id="selected"/>
      <line-chart :id="selected" />
      <RadarChart :id="selected" />
    </div>
  </div>
</template>

<script>
import LineChart from "@/components/LineChart";
import RadarChart from "@/components/RadarChart";
import Navbar from "./Navbar";  
import UserData from "./UserData";  

import axios from "axios";
export default {
  name: "Demo",
  components: {
    LineChart,
    RadarChart,
    Navbar,
    UserData
  },
  data() {
    return {
      users: null,
      selected: 134
    }
  },
  mounted() {
    this.getUsers()
  },
  methods: {
    getUsers(){
        axios
      .get(`http://localhost:3000/api/users`)
      .then(response => {
        // console.log("mis users", response);
        this.users = response.data.users
      })

    }
  },
};
</script>

<style></style>
