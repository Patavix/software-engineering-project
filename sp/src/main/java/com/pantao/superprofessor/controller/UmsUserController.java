package com.pantao.superprofessor.controller;


import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.pantao.superprofessor.common.api.ApiResult;
import com.pantao.superprofessor.model.dto.LoginDTO;
import com.pantao.superprofessor.model.dto.RegisterDTO;
import com.pantao.superprofessor.model.entity.BmsPost;
import com.pantao.superprofessor.model.entity.UmsUser;
import com.pantao.superprofessor.model.vo.UserVO;
import com.pantao.superprofessor.service.IBmsPostService;
import com.pantao.superprofessor.service.IUmsUserService;
import org.apache.commons.mail.HtmlEmail;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.util.Assert;
import javax.annotation.Resource;
import javax.validation.Valid;
import java.util.HashMap;
import java.util.Map;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import static com.pantao.superprofessor.jwt.JwtUtil.USER_NAME;


@RestController
@RequestMapping("/ums/user")
public class UmsUserController extends BaseController {
    private String PWD;
    @Resource
    private IUmsUserService iUmsUserService;
    @Resource
    private IBmsPostService iBmsPostService;

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public ApiResult<Map<String, Object>> register(@Valid @RequestBody RegisterDTO dto) {
        UmsUser user = iUmsUserService.executeRegister(dto, PWD);
        if (ObjectUtils.isEmpty(user)) {
            return ApiResult.failed("账号注册失败");
        }
        Map<String, Object> map = new HashMap<>(16);
        map.put("user", user);
        return ApiResult.success(map);
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public ApiResult<Map<String, String>> login(@Valid @RequestBody LoginDTO dto) {
        String token = iUmsUserService.executeLogin(dto);
        if (ObjectUtils.isEmpty(token)) {
            return ApiResult.failed("账号密码错误");
        }
        Map<String, String> map = new HashMap<>(16);
        map.put("token", token);
        return ApiResult.success(map, "登录成功");
    }

    @RequestMapping(value = "/adminlogin", method = RequestMethod.POST)
    public ApiResult<Map<String, String>> adminlogin(@Valid @RequestBody LoginDTO dto) {
        String token = iUmsUserService.executeAdminLogin(dto);
        if (ObjectUtils.isEmpty(token)) {
            return ApiResult.failed("登陆失败");
        }
        Map<String, String> map = new HashMap<>(16);
        map.put("token", token);
        return ApiResult.success(map, "登录成功");
    }

    @RequestMapping(value = "/info", method = RequestMethod.GET)
    public ApiResult<UmsUser> getUser(@RequestHeader(value = USER_NAME) String userName) {
        UmsUser user = iUmsUserService.getUserByUsername(userName);
        return ApiResult.success(user);
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public ApiResult<Object> logOut() {
        return ApiResult.success(null, "退出成功");
    }

    @GetMapping("/{username}")
    public ApiResult<Map<String, Object>> getUserByName(@PathVariable("username") String username,
                                                        @RequestParam(value = "pageNo", defaultValue = "1") Integer pageNo,
                                                        @RequestParam(value = "size", defaultValue = "10") Integer size) {
        Map<String, Object> map = new HashMap<>(16);
        UmsUser user = iUmsUserService.getUserByUsername(username);
        Assert.notNull(user, "用户不存在");
        Page<BmsPost> page = iBmsPostService.page(new Page<>(pageNo, size),
                new LambdaQueryWrapper<BmsPost>().eq(BmsPost::getUserId, user.getId()));
        map.put("user", user);
        map.put("topics", page);
        return ApiResult.success(map);
    }
    @PostMapping("/update")
    public ApiResult<UmsUser> updateUser(@RequestBody UmsUser umsUser) {
        iUmsUserService.updateById(umsUser);
        return ApiResult.success(umsUser);
    }

    @GetMapping("/list")
    public ApiResult<Page<UserVO>> list(@RequestParam(value = "pageNo", defaultValue = "1")  Integer pageNo,
                                        @RequestParam(value = "size", defaultValue = "10") Integer pageSize) {
        Page<UserVO> list = iUmsUserService.getUserList(new Page<>(pageNo, pageSize));
        return ApiResult.success(list);
    }

    @GetMapping("/delete/{id}")
    public ApiResult<Object> delete(@PathVariable("id") Long id) {
        iUmsUserService.removeById(id);
        return ApiResult.success();
    }
    @RequestMapping("/sendMail")
    public String send(@Valid @RequestBody RegisterDTO sendTo){
        System.out.println(1111);
        System.out.println(sendTo.getEmail()+"1234");
        RandomPwd randomPwd = new RandomPwd();
        String pwd = randomPwd.getRandomPwd(10);
        HtmlEmail email=new HtmlEmail();
        try{
            email.setHostName("smtp.qq.com");
            email.setCharset("UTF-8");
            email.addTo(sendTo.getEmail());
            email.setFrom("2233709020@qq.com","SuperProfessor");
            email.setAuthentication("2233709020@qq.com","ytpghsdjdmytecdd");
            email.setSubject("Register Email");
            email.setMsg("Super Professor网站验证码为："+pwd);
            email.send();
        }catch (Exception e){
            e.printStackTrace();
        }
        PWD = pwd;
        return pwd;
    }

    public class RandomPwd {
        private static final String lowStr = "abcdefghijklmnopqrstuvwxyz";
        private static final String specialStr = "~!@#$%^&*()_+/-=[]{};:'>?.";
        private static final String numStr = "0123456789";

        // 随机获取字符串字符
        private char getRandomChar(String str) {
            SecureRandom random = new SecureRandom();
            return str.charAt(random.nextInt(str.length()));
        }

        // 随机获取小写字符
        private char getLowChar() {
            return getRandomChar(lowStr);
        }

        // 随机获取大写字符
        private  char getUpperChar() {
            return Character.toUpperCase(getLowChar());
        }

        // 随机获取数字字符
        private  char getNumChar() {
            return getRandomChar(numStr);
        }

        // 随机获取特殊字符
        private  char getSpecialChar() {
            return getRandomChar(specialStr);
        }

        //指定调用字符函数
        private  char getRandomChar(int funNum) {
            switch (funNum) {
                case 0:
                    return getLowChar();
                case 1:
                    return getUpperChar();
                case 2:
                    return getNumChar();
                default:
                    return getSpecialChar();
            }
        }

        // 指定长度，随机生成复杂密码
        public   String getRandomPwd(int num) {
            if (num > 20 || num < 8) {
                System.out.println("长度不满足要求");
                return "";
            }
            List<Character> list = new ArrayList<>(num);
            list.add(getLowChar());
            list.add(getUpperChar());
            list.add(getNumChar());
            list.add(getSpecialChar());

            for (int i = 4; i < num; i++) {
                SecureRandom random = new SecureRandom();
                int funNum = random.nextInt(4);
                list.add(getRandomChar(funNum));
            }

            Collections.shuffle(list);   // 打乱排序
            StringBuilder stringBuilder = new StringBuilder(list.size());
            for (Character c : list) {
                stringBuilder.append(c);
            }

            return stringBuilder.toString();
        }

        // 测试函数入口
    }
}
