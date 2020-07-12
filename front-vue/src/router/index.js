import Vue from "vue";
import Router from "vue-router";
import Login from "@/components/Login/";
import Home from "@/components/Home/";
import Formtask from "@/components/Formtask/";

Vue.use(Router);

function guardMyroute(to, from, next) {
  var isAuthenticated = false;
  if (localStorage.getItem("identity") && localStorage.getItem("token")) isAuthenticated = true;
  else isAuthenticated = false;
  if (isAuthenticated) {
    next(); 
  } else {
    next("/login");
  }
}

function IsAuth(to, from, next) {
  var isAuthenticated = false;
  if (localStorage.getItem("identity") && localStorage.getItem("token")) isAuthenticated = true;
  else isAuthenticated = false;
  if (isAuthenticated) {
    next("/home");
  } else {
    next(); 
  }
}

export default new Router({
  routes: [
    {
      path: "/",
      name: "Login",
      beforeEnter : IsAuth,
      component: Login
    },
    {
      path: "/login",
      name: "Login",
      beforeEnter : IsAuth,
      component: Login
    },
    {
      path: "/home",
      beforeEnter : guardMyroute,
      name: "Home",
      component: Home
    },
    {
      path: "/addtask",
      beforeEnter : guardMyroute,
      name: "addtask",
      component: Formtask
    },
    {
      path: "/edittask/:id",
      beforeEnter : guardMyroute,
      name: "addtask",
      component: Formtask
    }
  ],
  mode: "history"
});
