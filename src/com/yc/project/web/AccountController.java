package com.yc.project.web;

import com.yc.project.entity.Account;
import com.yc.project.service.AccountService;
import com.yc.project.service.ItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.Date;

@Controller
@RequestMapping("/account")
public class AccountController {

    @Autowired
    AccountService as;

    @Autowired
    ItemService is;

    @RequestMapping("/list")
    public ModelAndView list(Integer page, String search, Integer delId,Integer[] delIds, HttpSession s) {
        if (delId != null) {
//            as.del(delId);
        }
        if(delIds != null && delIds.length != 0){
            for(int id:delIds){
//                as.del(id);
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
        return new ModelAndView("account/add")
                .addObject("account", id == null? new Account().setDate(new Date()) : as.getAccountById(id))
                .addObject("pItems",is.getAllParentItems());
    }

    @RequestMapping("/detail")
    public ModelAndView detail(Integer id, HttpSession s) {
        return toAddOrEdit(id, s)
                .addObject("op", "v");
    }

    @RequestMapping("/getFatherAccountByType")
    @ResponseBody
    public ModelAndView getFatherAccountByType(Integer type, HttpSession s) {
        return null;
    }

    @RequestMapping("/getSonAccountByFatherAccount")
    @ResponseBody
    public ModelAndView getSonAccountByFatherAccount(Integer id, HttpSession s) {
        return null;
    }


    @RequestMapping("/save")
    public ModelAndView save(Account account, HttpSession s) {
        return null;
    }


}
