<template>
  <div>
    <img src="../img/login-background.jpg" id="bgvid" />
    <div class="register">
      <img class="register-img" src="../img/title_logo.png" />
      <el-form
        ref="ruleForm"
        v-loading="loading"
        :model="ruleForm"
        status-icon
        :rules="rules"
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
            v-model="ruleForm.pass"
            type="password"
            autocomplete="off"
            placeholder="密码"
          >
            <i slot="prepend" class="el-icon-lock" />
          </el-input>
        </el-form-item>

        <el-form-item prop="checkPass">
          <el-input
            v-model="ruleForm.checkPass"
            type="password"
            autocomplete="off"
            placeholder="确认密码"
          >
            <i slot="prepend" class="el-icon-lock" />
          </el-input>
        </el-form-item>

        <el-form-item prop="email">
          <el-input
            v-model="ruleForm.email"
            autocomplete="off"
            placeholder="账户邮箱"
          >
            <i slot="prepend" class="el-icon-message" />
          </el-input>
        </el-form-item>

        <el-form-item prop="code">
          <el-input
            v-model="ruleForm.code"
            autocomplete="off"
            placeholder="验证码"
          >
            <i slot="prepend" class="el-icon-key" />
          </el-input>
        </el-form-item>

        <el-form-item>
          <el-button type="primary" @click="submitForm('ruleForm')"
            >注册</el-button
          >
          <el-button @click="resetForm('ruleForm')">重新输入</el-button>
          <el-button @click="returnHome">返回主页</el-button>
          <el-button type="primary" @click="getCode('ruleForm')"
            >获取验证吗</el-button
          >
        </el-form-item>
      </el-form>
    </div>
  </div>
</template>

<script>
import { userRegister } from "@/api/auth/auth";
import { sendMail } from "@/api/auth/auth";
export default {
  name: "Register",
  data() {
    var reg = /^[0-9]+@link.cuhk.edu.cn$/;
    var reg_professor = /^[0-9]+@cuhk.edu.cn$/;
    const validatePass = (rule, value, callback) => {
      if (value === "") {
        callback(new Error("请再次输入密码"));
      } else if (value !== this.ruleForm.pass) {
        callback(new Error("两次输入密码不一致!"));
      } else {
        callback();
      }
    };
    const checkEmail = (rule, value, callback) => {
      if (!reg.test(value) && !reg_professor.test(value)) {
        callback(new Error("请输入港中深邮箱进行注册"));
      } else {
        callback();
      }
    };
    return {
      loading: false,
      ruleForm: {
        name: "",
        pass: "",
        checkPass: "",
        email: "",
        code: "",
      },
      rules: {
        name: [
          { required: true, message: "请输入账号", trigger: "blur" },
          {
            min: 2,
            max: 10,
            message: "长度在 2 到 10 个字符",
            trigger: "blur",
          },
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
        checkPass: [
          { required: true, message: "请再次输入密码", trigger: "blur" },
          { validator: validatePass, trigger: "blur" },
        ],
        email: [
          { required: true, message: "请输入邮箱地址", trigger: "blur" },
          {
            validator: checkEmail,
            trigger: "blur",
          },
        ],
        code: [{ required: false, message: "请输入验证码", trigger: "blur" }],
      },
    };
  },
  methods: {
    submitForm(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          this.loading = true;
          userRegister(this.ruleForm)
            .then((value) => {
              const { code, message } = value;
              if (code === 200) {
                this.$message({
                  message: "账号注册成功",
                  type: "success",
                });
                setTimeout(() => {
                  this.loading = false;
                  this.$router.push({ path: this.redirect || "/login" });
                }, 0.1 * 1000);
              } else {
                this.$message.error("注册失败，" + message);
              }
            })
            .catch(() => {
              this.loading = false;
            });
        } else {
          return false;
        }
      });
    },
    getCode(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          this.loading = true;
          sendMail(this.ruleForm).catch(() => {
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
.register {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100%;
  flex-direction: column;
}
.demo-ruleForm {
  width: 34%;
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
.register-img {
  display: block;
  width: 300px;
  padding: 0px;
  margin-top: 20px;
  margin-bottom: 0px;
}
</style>