package com.pantao.superprofessor.controller;

import com.pantao.superprofessor.common.api.ApiResult;
import com.pantao.superprofessor.model.dto.CommentDTO;
import com.pantao.superprofessor.model.entity.BmsComment;
import com.pantao.superprofessor.model.entity.UmsUser;
import com.pantao.superprofessor.model.vo.CommentVO;
import com.pantao.superprofessor.service.IBmsCommentService;
import com.pantao.superprofessor.service.IUmsUserService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

import static com.pantao.superprofessor.jwt.JwtUtil.USER_NAME;


@RestController
@RequestMapping("/comment")
public class BmsCommentController extends BaseController {

    @Resource
    private IBmsCommentService bmsCommentService;
    @Resource
    private IUmsUserService umsUserService;

    @GetMapping("/get_comments")
    public ApiResult<List<CommentVO>> getCommentsByTopicID(@RequestParam(value = "topicid", defaultValue = "1") String topicid) {
        List<CommentVO> lstBmsComment = bmsCommentService.getCommentsByTopicID(topicid);
        return ApiResult.success(lstBmsComment);
    }
    @PostMapping("/add_comment")
    public ApiResult<BmsComment> add_comment(@RequestHeader(value = USER_NAME) String userName,
                                             @RequestBody CommentDTO dto) {
        UmsUser user = umsUserService.getUserByUsername(userName);
        BmsComment comment = bmsCommentService.create(dto, user);
        return ApiResult.success(comment);
    }
}

