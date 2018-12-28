package com.yc.project.web;

import com.yc.project.entity.Item;
import com.yc.project.service.ItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/item")
public class ItemController {

	@Autowired
	ItemService is;

	@RequestMapping("/list")
	public ModelAndView list(Integer id){
        List<Item> items ;
        if(id != null){
            items = is.getItemsByParentId(id);
        }else{
            items = is.getAllParentItems();
        }
        return new ModelAndView("/item/list")
                .addObject("items",items);
    }

    @RequestMapping("/saveOrUpdate")
    public ModelAndView saveOrUpdate(Item item){
	    is.saveOrUpdate(item);
        return new ModelAndView("redirect:/item/list");
    }

    @RequestMapping("/del")
    public ModelAndView del(Integer id){
        is.del(id);
	    return new ModelAndView("redirect:/item/list");
    }

    @RequestMapping("/addOrEdit")
    public ModelAndView addOrEdit(Integer id){
	    id = id == null ? 0 : id ;
        return new ModelAndView("/item/edit")
                .addObject("item",is.getItemById(id))
                .addObject("pItems",is.getAllParentItems())
                .addObject("op","w");
    }

    @RequestMapping("/view")
    public ModelAndView view(Integer id){
        return addOrEdit(id)
                .addObject("op","r");
    }

}
