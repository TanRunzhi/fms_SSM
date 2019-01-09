package com.yc.project.service;

import com.yc.project.dao.ItemDao;
import com.yc.project.entity.Item;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class ItemService{
	
	@Autowired
	ItemDao itemDao;


	public List<Item> getAllParentItems() {
		return itemDao.getAllParentItems();
	}

	public List<Item> getItemsByParentId(int id) {
		return itemDao.getItemsByParentId(id);
	}

	public Item getItemById(int id){
	    if(id == 0){
	        return new Item().setP_Item(new Item());
        }
		return itemDao.getItemById(id);
	}

	public Item del(int id){
		Item item = getItemById(id);
		itemDao.del(id);
		return item;
	}

	public int saveOrUpdate(Item item){
	    if(item.getP_Item().getId()==0){
	        item.setP_Item(null);
        }
		if(item.getId() == 0){
			return save(item);
		}else{
			update(item);
			return item.getId();
		}
	}

	private int save(Item item){
		return itemDao.save(item);
	}

	private void update(Item item){
		itemDao.update(item);
	}

	public List<Item> getParentItemsByType(int type){
		return itemDao.getParentItemsByType(type);
	}
}
