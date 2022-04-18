package com.pantao.superprofessor.controller;


import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.pantao.superprofessor.common.api.ApiResult;
import com.pantao.superprofessor.model.entity.BmsBillboard;
import com.pantao.superprofessor.model.entity.BmsTip;
import com.pantao.superprofessor.service.IBmsBillboardService;
import com.pantao.superprofessor.service.IBmsTipService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

@RestController
@RequestMapping("/tip")
public class BmsTipController extends BaseController {
    @Resource
    private IBmsTipService bmsTipService;

    @GetMapping("/today")
    public ApiResult<BmsTip> getRandomTip() {
        BmsTip tip = bmsTipService.getRandomTip();
        return ApiResult.success(tip);
    }
}

