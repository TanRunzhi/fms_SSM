package com.yc.project.dao;

import com.yc.project.entity.Account;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface AccountDao {

    List<Account> getPageAccount(@Param("start") int start, @Param("len")int len, @Param("search")String search);

    Integer getItemCount(@Param("search")String search);

    @Update("update accounts set flag = 0 where id = #{id}")
    void del(int id);

    Account getAccountById(@Param("id")int id);
}
