package com.pantao.superprofessor.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.pantao.superprofessor.model.entity.UmsUser;
import com.pantao.superprofessor.model.vo.UserVO;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import java.util.List;
/**
 * 用户
 *
 * @author
 */
@Repository
public interface UmsUserMapper extends BaseMapper<UmsUser> {
    /**
     * 分页查询用户列表
     * <p>
     *
     * @param page
     * @return
     */
    Page<UserVO> selectListAndPage(@Param("page") Page<UserVO> page);
}
