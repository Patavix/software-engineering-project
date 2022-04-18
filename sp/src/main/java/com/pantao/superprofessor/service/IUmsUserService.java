package com.pantao.superprofessor.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.pantao.superprofessor.model.dto.LoginDTO;
import com.pantao.superprofessor.model.dto.RegisterDTO;
import com.pantao.superprofessor.model.entity.UmsUser;
import com.pantao.superprofessor.model.vo.UserVO;
import com.pantao.superprofessor.model.vo.ProfileVO;

public interface IUmsUserService extends IService<UmsUser> {

    /**
     * 获取用户列表
     *
     * @param page
     * @return
     */
    Page<UserVO> getUserList(Page<UserVO> page);
    /**
     * 注册功能
     *
     * @param dto
     * @return 注册对象
     */
    UmsUser executeRegister(RegisterDTO dto, String PWD);
    /**
     * 获取用户信息
     *
     * @param username
     * @return dbUser
     */
    UmsUser getUserByUsername(String username);
    /**
     * 用户登录
     *
     * @param dto
     * @return 生成的JWT的token
     */
    String executeLogin(LoginDTO dto);
    /**
     * 获取用户信息
     *
     * @param id 用户ID
     * @return
     */
    ProfileVO getUserProfile(String id);
    /**
     * admin登录
     *
     * @param dto
     * @return 生成的JWT的token
     */
    String executeAdminLogin(LoginDTO dto);
}
