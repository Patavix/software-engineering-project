<template>
  <div>
    <img src="../img/login-background.jpg" id="bgvid" />
    <div class="login">
      <img class="login-img" src="../img/title_logo.png" />
      <el-form
        v-loading="loading"
        :model="ruleForm"
        status-icon
        :rules="rules"
        ref="ruleForm"
        label-width="0px"
        class="demo-ruleForm"
      >
        <el-form-item prop="name">
          <el-input v-model="ruleForm.name" placeholder="账户名">
            <i slot="prepend" class="el-icon-s-custom" />
          </el-input>
        </el-form-item>

        <el-form-item prop="pass">
          <el-input
            type="password"
            v-model="ruleForm.pass"
            autocomplete="off"
            placeholder="密码"
          >
            <i slot="prepend" class="el-icon-lock" />
          </el-input>
        </el-form-item>

        <el-form-item>
          <el-button type="primary" @click="submitForm('ruleForm')"
            >登陆</el-button
          >
          <el-button @click="resetForm('ruleForm')">重新输入</el-button>
          <el-button @click="returnHome">返回主页</el-button>
        </el-form-item>
      </el-form>
    </div>
  </div>
</template>

<script>
export default {
  name: "Login",
  data() {
    const checkName = (rule, value, callback) => {
      if (value !== "admin") {
        callback(new Error("你不是管理员"));
      } else {
        callback();
      }
    };
    return {
      redirect: undefined,
      loading: false,
      ruleForm: {
        name: "",
        pass: "",
        rememberMe: true,
      },
      rules: {
        name: [
          { required: true, message: "请输入账号", trigger: "blur" },
          { validator: checkName, trigger: "blur" },
        ],
        pass: [
          { required: true, message: "请输入密码", trigger: "blur" },
          {
            min: 6,
            max: 20,
            message: "长度在 6 到 20 个字符",
            trigger: "blur",
          },
        ],
      },
    };
  },
  methods: {
    submitForm(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          this.loading = true;
          this.$store
            .dispatch("user/login", this.ruleForm)
            .then(() => {
              this.$message({
                message: "恭喜你，登录成功",
                type: "success",
                duration: 2000,
              });

              setTimeout(() => {
                this.loading = false;
                this.$router.push({ path: this.redirect || "/" });
              }, 0.1 * 1000);
            })
            .catch(() => {
              this.loading = false;
            });
        } else {
          return false;
        }
      });
    },
    resetForm(formName) {
      this.$refs[formName].resetFields();
    },
    returnHome() {
      this.$router.push({ path: "/" });
    },
  },
};
</script>

<style scoped>
.login {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100%;
  flex-direction: column;
}
.demo-ruleForm {
  width: 30%;
  margin: 20px auto;
  border: 1px solid #dcdfe6;
  padding: 20px;
  border-radius: 10px;
  box-shadow: 0 0 30px #dcdfe6;
}
img#bgvid {
  position: fixed;
  right: 0;
  bottom: 0;
  min-width: 100%;
  min-height: 100%;
  width: auto;
  height: auto;
  z-index: -9999;
  background-size: cover;
}
.login-img {
  display: block;
  width: 300px;
  padding: 0px;
  margin-top: 20px;
  margin-bottom: 0px;
}
</style>