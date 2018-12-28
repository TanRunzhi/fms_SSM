package test;

import com.yc.project.dao.AccountDao;
import org.apache.ibatis.session.SqlSession;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class AccountDaoTest {
	
	SqlSession ss = null;
    AccountDao ad = null;
	
	
	@Before
	public void init() {
		ss = MyBatisUtil.getSqlSessionFactory().openSession();
        ad = ss.getMapper(AccountDao.class);
	}
	
	@Test
	public void testGetPageAccount() {
        System.out.println("AccountDaoTest.testGetPageAccount");
        System.out.println(ad.getPageAccount(0,2,""));
	}

	@After
	public void destroy() {
		ss.commit();
		ss.close();
	}
	
	
}
