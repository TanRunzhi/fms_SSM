package com.yc.project.dao;

import com.yc.project.entity.Item;
import com.yc.project.entity.User;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface ItemDao {

	@Select("select id,type,name,pid from items where flag = 1 and pid is null")
	List<Item> getAllParentItems();

	@Select("select id,type,name,pid from items where flag = 1 and pid = #{id}")
	@ResultMap("itemResultMap")
	List<Item> getItemsByParentId(int id);

	@Select("select id,type,name,pid from items where flag = 1 and id = #{id}")
	@ResultMap("itemResultMap")
	Item getItemById(int id);

	@Update(" update items set flag = 0 where id = #{id}")
	void del(int id);

	@Insert("insert into items(type,name,pid) values(#{type},#{name},#{p_Item.id})")
	@Options(useGeneratedKeys = true,keyProperty = "id")
	int save(Item item);

	@Update("update items set type=#{type},name=#{name},pid=#{p_Item.id} where id = #{id}")
	void update(Item item);
}
