<template>
  <footer class="footer has-text-grey-light has-background-grey-darker">
    <div class="container">
      <div class="">
        <span style="float: right">
          <router-link :to="{ path: '/adminlogin' }"> 管理员登录 </router-link>
          |
          <a href="/?lang=zh_CN">中文</a> |
          <a href="/?lang=en_US">English</a>
        </span>
      </div>

      <div>
        <span>© Super Professor团队 All rights reserved</span>
        <div style="float: right">
          <template>
            <b-taglist attached>
              <b-tag type="is-dark" size="is-normal">Design by</b-tag>
              <b-tag type="is-info" size="is-normal">Super Professor团队</b-tag>
              &nbsp;
            </b-taglist>
          </template>
        </div>
      </div>
    </div>
    <back-top></back-top>
  </footer>
</template>

<script>
import BackTop from "@/components/Backtop/BackTop";

export default {
  name: "Footer",
  components: {
    BackTop,
  },
  data() {
    return {
      title: "© " + new Date().getFullYear() + "SuperProfessor",
      author: "SuperProfessor",
    };
  },
};
</script>

<style scoped>
footer {
  margin-top: 120px;
  height: 150px;
}
footer a {
  color: #bfbfbf;
}
</style>