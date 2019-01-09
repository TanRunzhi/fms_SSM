package com.yc.project.service;

import com.yc.project.dao.AccountDao;
import com.yc.project.dao.ItemDao;
import com.yc.project.entity.Account;
import com.yc.project.entity.Item;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class AccountService  {
	
	@Autowired
	AccountDao accountDao;

    public List<Account> getPageAccount(Integer page,Integer pageSize,String search){
        int start = ( page - 1 ) * pageSize;
        int len = pageSize;
        return accountDao.getPageAccount(start,len,search);
    }

    public int getItemCount(String search){
        if(search == null){
            search = "";
        }
        Integer i = accountDao.getItemCount(search);
        return i==null?0:i;
    }

    public Account  del(int id){
        Account a = getAccountById(id);
        accountDao.del(id);
        return a;
    }

    public Account getAccountById(int id){
        return accountDao.getAccountById(id);
    }

    public void saveOrUpdate(Account account){
        if(account.getId() == 0){
            save(account);
        }else{
            update(account);
        }
    }

    public int save(Account account){
        return accountDao.save(account);
    }

    public void update(Account account){
        accountDao.update(account);
    }

}
