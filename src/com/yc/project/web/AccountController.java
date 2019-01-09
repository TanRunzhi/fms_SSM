package com.yc.project.web;

import com.yc.project.entity.Account;
import com.yc.project.entity.Item;
import com.yc.project.service.AccountService;
import com.yc.project.service.ItemService;
import com.yc.project.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/account")
public class AccountController {

    @Autowired
    AccountService as;

    @Autowired
    ItemService is;

    @Autowired
    UserService us;

    @RequestMapping("/list")
    public ModelAndView list(Integer page, String search, Integer delId, Integer[] delIds, HttpSession s) {
        if (delId != null) {
            as.del(delId);
        }
        if (delIds != null && delIds.length != 0) {
            for (int id : delIds) {
                as.del(id);
            }
        }
        if (page == null) {
            page = 1;
        }
        if (search == null) {
            search = "";
        }
        int pageSize = 10;
        int totalPage = (int) Math.ceil(1.0 * as.getItemCount(search) / pageSize);
        if (page > totalPage) {
            page = totalPage;
        }
        if (page < 1) {
            page = 1;
        }
        return new ModelAndView("account/list")
                .addObject("search", search)
                .addObject("page", page)
                .addObject("totalPage", totalPage)
                .addObject("accounts", as.getPageAccount(page, pageSize, search));
    }


    @RequestMapping("/toAddOrEdit")
    public ModelAndView toAddOrEdit(Integer id, HttpSession s) {
        if (id == null) {
            return new ModelAndView("account/add")
                    .addObject("account", new Account().setDate(new Date()))
                    .addObject("users", us.getAll())
                    .addObject("pItems", is.getAllParentItems());
        } else {
            Account account = as.getAccountById(id);
            return new ModelAndView("account/add")
                    .addObject("account", account)
                    .addObject("users", us.getAll())
                    .addObject("cItems", is.getItemsByParentId(account.getItem().getP_Item().getId()))
                    .addObject("pItems", is.getAllParentItems());
        }

    }

    @RequestMapping("/detail")
    public ModelAndView detail(Integer id, HttpSession s) {
        return toAddOrEdit(id, s)
                .addObject("op", "v");
    }

    @RequestMapping("/getFatherAccountByType")
    @ResponseBody
    public List<Item> getFatherAccountByType(Integer type, HttpSession s) {
        return is.getParentItemsByType(type);
    }

    @RequestMapping("/getSonAccountByFatherAccount")
    @ResponseBody
    public List<Item> getSonAccountByFatherAccount(Integer id, HttpSession s) {
        return is.getItemsByParentId(id);
    }


    @RequestMapping("/save")
    public ModelAndView save(Account account, HttpSession s) {
        as.saveOrUpdate(account);
        return new ModelAndView("redirect:/account/list");
    }

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));   //true:允许输入空值，false:不能为
    }
}