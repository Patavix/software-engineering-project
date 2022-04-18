import axios from 'axios'
import { Message, MessageBox } from 'element-ui'
import store from '@/store'
import { getToken } from '@/utils/auth'

// 1.创建axios实例
const service = axios.create({
  baseURL: process.env.VUE_APP_SERVER_URL,

  // baseURL: 'https://api.example.com',
  // 超时时间 单位是ms，这里设置了50s的超时时间
  timeout: 50 * 1000
})

// 2.请求拦截器request interceptor
service.interceptors.request.use(
  config => {
    // 注意使用token的时候需要引入cookie方法或者用本地localStorage等方法，推荐js-cookie
    if (store.getters.token) {
      // config.params = {'token': token}    // 如果要求携带在参数中
      // config.headers.token = token;       // 如果要求携带在请求头中
      // bearer：w3c规范
      config.headers['Authorization'] = 'Bearer ' + getToken()
    }
    return config
  },
  error => {
    // do something with request error
    // console.log(error) // for debug
    return Promise.reject(error)
  }
)

service.defaults.withCredentials = false

service.interceptors.response.use(
  // 接收到响应数据并成功后的一些共有的处理，关闭loading等
  response => {
    const res = response.data
    // 如果自定义代码不是200，则将其判断为错误。
    if (res.code !== 200) {
      // 50008: 非法Token; 50012: 异地登录; 50014: Token失效;
      if (res.code === 401 || res.code === 50012 || res.code === 50014) {
        // 重新登录
        MessageBox.confirm('会话失效', '权限不足', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning',
          center: true
        }).then(() => {
          window.location.href = '#/login'
        })
      } else { // 其他异常直接提示
        if(res.message != undefined){
          Message({
            showClose: true,
            message: '⚠' + res.message || 'Error',
            type: 'error',
            duration: 3 * 1000
          })
        }else{
          Message({
            showClose: true,
            message: '验证码发送成功',
            type: 'success',
            duration: 3 * 1000
          })
        }
      }
      return Promise.reject(new Error(res.message || 'Error'))
    } else {
      return res
    }
  },
  error => {
    /** *** 接收到异常响应的处理开始 *****/
    // console.log('err' + error) // for debug
    Message({
      showClose: true,
      message: error.message,
      type: 'error',
      duration: 5 * 1000
    })
    return Promise.reject(error)
  }
)
export default service