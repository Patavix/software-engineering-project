<template>
  <el-card class="box-card" shadow="never">
    <div slot="header">
      <span>🔧功能板块</span>
    </div>
    <div
      v-if="token != null && token !== '' && user.username === 'admin'"
      class="has-text-centered"
    >
      <b-button
        type="is-danger"
        tag="router-link"
        :to="{ path: '/post/create' }"
        >添加教授</b-button
      >
      <b-button
        type="is-primary"
        tag="router-link"
        :to="{ path: '/edituser' }"
        class="ml-2"
        >查看所有用户</b-button
      >
    </div>

    <div
      v-else-if="token != null && token !== '' && user.username !== 'admin'"
      class="has-text-centered"
    >
      <p>搜索教授然后添加你对他/她的评价吧</p>
    </div>

    <div v-else class="has-text-centered">
      <b-button
        type="is-primary"
        tag="router-link"
        :to="{ path: '/register' }"
        outlined
        >马上注册</b-button
      >
      <b-button
        type="is-danger"
        tag="router-link"
        :to="{ path: '/login' }"
        outlined
        class="ml-2"
      >
        马上登陆</b-button
      >
    </div>
  </el-card>
</template>

<script>
import { mapGetters } from "vuex";

export default {
  name: "LoginWelcome",
  computed: {
    ...mapGetters(["token", "user"]),
  },
};
</script>

<style scoped>
</style>