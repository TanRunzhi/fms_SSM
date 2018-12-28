package test;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MyBatisUtil {
	//获得SqlSessionFactory对象的方法
	public static SqlSessionFactory getSqlSessionFactory() {
		//获得reader
		Reader reader = null;
		try {
			reader=Resources.getResourceAsReader("mybatis_conf.xml");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//
		 SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		 //
		 return sqlSessionFactory;
	}
	
	
	
	public static void main(String[] args) {
		// 测试代码
		 System.out.println(getSqlSessionFactory());
		 //
		 //SqlSession sqlSession =  sqlSessionFactory.openSession();

	}

}
