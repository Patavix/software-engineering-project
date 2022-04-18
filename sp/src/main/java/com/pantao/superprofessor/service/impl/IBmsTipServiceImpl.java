package com.pantao.superprofessor.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.pantao.superprofessor.mapper.BmsBillboardMapper;
import com.pantao.superprofessor.mapper.BmsTipMapper;
import com.pantao.superprofessor.model.entity.BmsBillboard;
import com.pantao.superprofessor.model.entity.BmsTip;
import com.pantao.superprofessor.service.IBmsBillboardService;
import com.pantao.superprofessor.service.IBmsTipService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Slf4j
@Service
public class IBmsTipServiceImpl extends ServiceImpl<BmsTipMapper
        , BmsTip> implements IBmsTipService {

    @Override
    public BmsTip getRandomTip() {
        BmsTip todayTip = null;
        try {
            todayTip = this.baseMapper.getRandomTip();
        } catch (Exception e) {
            log.info("tip转化失败");
        }
        return todayTip;
    }
}

