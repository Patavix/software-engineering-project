package com.pantao.superprofessor.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.pantao.superprofessor.mapper.BmsFollowMapper;
import com.pantao.superprofessor.model.entity.BmsFollow;
import com.pantao.superprofessor.service.IBmsFollowService;
import org.springframework.stereotype.Service;


@Service
public class IBmsFollowServiceImpl extends ServiceImpl<BmsFollowMapper, BmsFollow> implements IBmsFollowService {
}

