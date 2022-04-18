package com.pantao.superprofessor.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.pantao.superprofessor.mapper.BmsBillboardMapper;
import com.pantao.superprofessor.model.entity.BmsBillboard;
import com.pantao.superprofessor.service.IBmsBillboardService;
import org.springframework.stereotype.Service;

@Service
public class IBmsBillboardServiceImpl extends ServiceImpl<BmsBillboardMapper, BmsBillboard> implements IBmsBillboardService {
}
