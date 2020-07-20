<template>
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <span class="mx-5 navbar-brand pointer navlogoletter" @click="irahome">
      <img src="../assets/logon.png" class="imglognav" alt="" />
      ToDo List
    </span>
    <button
      class="navbar-toggler"
      type="button"
      data-toggle="collapse"
      data-target="#navbarSupportedContent"
      aria-controls="navbarSupportedContent"
      aria-expanded="false"
      aria-label="Toggle navigation"
    >
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse mx-5" id="navbarSupportedContent">
      <ul class="navbar-nav ml-auto pr-5">
        <li class="nav-item ">
          <router-link to="/home" active-class="active" class="nav-link">
            Home
            <span class="sr-only">(current)</span>
          </router-link>
        </li>
        <li class="nav-item active">
          <router-link to="/demo" active-class="active" class="nav-link">
            Demo
          </router-link>
        </li>
        <li class="nav-item dropdown">
          <a
            class="nav-link dropdown-toggle"
            href="#"
            id="navbarDropdown"
            role="button"
            data-toggle="dropdown"
            aria-haspopup="true"
            aria-expanded="false"
          >
            {{ nameuser }}
          </a>
          <div class="dropdown-menu" aria-labelledby="navbarDropdown">
            <a class="dropdown-item" href="#">Mi Perfil</a>
            <a class="dropdown-item" href="#">Another action</a>
            <div class="dropdown-divider"></div>
            <span class="dropdown-item" @click="logOut">Cerrar Sesion</span>
          </div>
        </li>
      </ul>
    </div>
  </nav>
</template>

<script>
export default {
  name: "Navbar",
  data() {
    return {
      nameuser: ""
    };
  },
  mounted() {
    this.SetNameUser();
  },
  methods: {
    irahome() {
      this.$router.push("/home");
    },
    SetNameUser() {
      let user = JSON.parse(localStorage.getItem("identity"));
      //  console.log( user.username)
      this.nameuser = user.username;
    },
    logOut() {
      localStorage.removeItem("identity");
      localStorage.removeItem("token");
      localStorage.clear();
      this.$router.push("/");
    }
  }
};
</script>

<style>
@import url("https://fonts.googleapis.com/css2?family=Modak&display=swap");
.imglognav {
  width: 35px;
  height: 35px;
}
.navlogoletter {
  font-family: "Modak", cursive;
  font-size: 28px;
}
</style>
