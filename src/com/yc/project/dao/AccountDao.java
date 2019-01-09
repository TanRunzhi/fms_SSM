package com.yc.project.dao;

import com.yc.project.entity.Account;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface AccountDao {

    List<Account> getPageAccount(@Param("start") int start, @Param("len")int len, @Param("search")String search);

    Integer getItemCount(@Param("search")String search);

    @Update("update accounts set flag = 0 where id = #{id}")
    void del(int id);

    Account getAccountById(@Param("id")int id);

    @Insert("insert into accounts(adate,amount,remark,user_id,item_id) values(#{date},#{amount},#{remark},#{user.id},#{item.id})")
    @Options(useGeneratedKeys = true,keyProperty = "id")
    int save(Account account);

    @Update("update accounts set adate=#{date},amount=#{amount},remark=#{remark},user_id=#{user.id},item_id=#{item.id} where id = #{id}")
    void update(Account account);

}
