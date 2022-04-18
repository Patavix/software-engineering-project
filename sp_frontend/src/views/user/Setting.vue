<template>
  <section>
    <el-card shadow="never">
      <div slot="header">个人设置</div>
      <div class="columns">
        <div class="column is-full">
          <el-tabs v-model="activeName" @tab-click="handleClick">
            <el-tab-pane label="基础信息" name="first">
              <el-form
                :label-position="labelPosition"
                label-width="100px"
                :model="user"
              >
                <el-form-item label="账号">
                  <el-input v-model="user.username" disabled />
                </el-form-item>
                <el-form-item label="昵称">
                  <el-input v-model="user.alias" />
                </el-form-item>
              </el-form>
            </el-tab-pane>
            <el-tab-pane label="密码" name="second">
              <el-form
                ref="dynamicValidateForm"
                :model="user"
                label-width="100px"
                class="demo-dynamic"
              >
                <el-form-item
                  prop="email"
                  label="密码"
                  :rules="[
                    {
                      required: true,
                      message: '请输入新的密码',
                      trigger: 'blur',
                    },
                    {
                      type: 'email',
                      message: '请输入正确的新密码',
                      trigger: ['blur', 'change'],
                    },
                  ]"
                >
                  <el-input v-model="user.password" />
                </el-form-item>
                <el-form-item>
                  <el-button
                    type="primary"
                    @click="submitForm('dynamicValidateForm')"
                    >修改密码</el-button
                  >
                </el-form-item>
              </el-form>
            </el-tab-pane>
          </el-tabs>
        </div>
      </div>
    </el-card>
  </section>
</template>

<script>
import { getInfo, update } from "@/api/user";

export default {
  name: "Setting",
  data() {
    return {
      activeName: "first",
      labelPosition: "right",
      user: {
        id: "",
        username: "",
        alias: "",
        bio: "",
        email: "",
        avatar: "",
        password: "",
      },
    };
  },
  created() {
    this.fetchInfo();
  },
  methods: {
    fetchInfo() {
      getInfo(this.$route.params.username).then((res) => {
        console.log(res);
        const { data } = res;
        this.user = data;
      });
    },
    handleClick(tab, event) {
      console.log(tab, event);
    },
    submitForm(formName) {
      console.log(this.user);
      update(this.user)
        .then((res) => {
          this.$message.success("密码重置成功，请重新登陆");
        })
        .then(
          this.$store.dispatch("user/logout").then(() => {
            setTimeout(() => {
              this.$router.push({ path: "/" });
            }, 500);
          })
        );
    },
    resetForm(formName) {
      this.$refs[formName].resetFields();
    },
  },
};
</script>

<style scoped>
</style>
