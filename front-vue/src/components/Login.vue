<template src="./Login.html"></template>

<script>
import axios from 'axios'
import { required, minLength } from 'vuelidate/lib/validators'
import { Global } from '../Global'
export default {
  name: "Login",
  data() {
    return {
      login: {
        email: '',
        password: ''
      },
      error: '',
      url: Global.url,
      msg: 'Welcome to Your Vue.js App'
    };
  },
  methods: {
    submitFormLogin() {
      
     
        axios.post(`${this.url}user/login`, this.login)
        .then(res=>{
          if( res.data.status == 'success'){
            console.log("Suucces", res);
            localStorage.clear()
            localStorage.setItem('token', res.data.token);
            localStorage.setItem('identity', JSON.stringify(res.data.user));
            this.$router.go('/home')
          }
          else if (res.data.status == 'error') {
            this.error = res.data.error
       console.log("Error", res);
          } 
        })
        .catch(err=>console.log(err))
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Modak&display=swap');
.login_component {
  width: 100vw;
  height: 100vh;
}
.imagen_logo{
  align-items: center;
}
.imgcard-logo{
  width: 500px;
  height: 400px;
}
.form_login{
  width: 60%;
}
.title-logo{
  font-family: 'Modak', cursive;
}
</style>
