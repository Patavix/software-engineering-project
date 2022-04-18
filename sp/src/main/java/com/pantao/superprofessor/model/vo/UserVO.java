package com.pantao.superprofessor.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserVO implements Serializable {
    private static final long serialVersionUID = -261082150965211545L;
    /**
     * 用户ID
     */
    private String id;
    /**
     * 用户名
     */
    private String username;

    private String alias;

    private String bio;

    /**
     * 头像
     */
    private String avatar;

    /**
     * email
     */
    private String email;

    /**
     * password
     */
    private String password;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 修改时间
     */
    private Date modifyTime;
}
