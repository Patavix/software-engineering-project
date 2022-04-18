package com.pantao.superprofessor.service;


import com.baomidou.mybatisplus.extension.service.IService;
import com.pantao.superprofessor.model.dto.CommentDTO;
import com.pantao.superprofessor.model.entity.BmsComment;
import com.pantao.superprofessor.model.entity.UmsUser;
import com.pantao.superprofessor.model.vo.CommentVO;

import java.util.List;


public interface IBmsCommentService extends IService<BmsComment> {
    /**
     *
     *
     * @param topicid
     * @return {@link BmsComment}
     */
    List<CommentVO> getCommentsByTopicID(String topicid);

    BmsComment create(CommentDTO dto, UmsUser principal);
}

