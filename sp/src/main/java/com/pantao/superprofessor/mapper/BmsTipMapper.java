package com.pantao.superprofessor.mapper;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.pantao.superprofessor.model.entity.BmsTip;
import org.springframework.stereotype.Repository;

@Repository
public interface BmsTipMapper extends BaseMapper<BmsTip> {
    BmsTip getRandomTip();
}

