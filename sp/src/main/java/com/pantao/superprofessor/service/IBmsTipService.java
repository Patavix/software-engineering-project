package com.pantao.superprofessor.service;


import com.baomidou.mybatisplus.extension.service.IService;
import com.pantao.superprofessor.model.entity.BmsTip;

public interface IBmsTipService extends IService<BmsTip> {
    BmsTip getRandomTip();
}

