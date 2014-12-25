package test;

import java.util.List;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.ceng.jbpm.base.BaseDao;
import cn.cengl.jbpm.entity.User;
import cn.cengl.jbpm.service.UserService;

public class UserServiceTest {
	private ApplicationContext ctx;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
	}

	@Before
	public void setUp() throws Exception {
		ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
	}

	@After
	public void tearDown() throws Exception {
	}
	
	@Test
	public void testSave() {

		UserService userService = (UserService) ctx.getBean("userService");
		User user = new User();
		user.setName("emtcl");
		user.setPassword("dbconsole");
		userService.save(user);
		System.out.print("保存User信息" + user.toString());
	}

	@Test
	public void testInitPassword() {
		
		UserService userService = (UserService) ctx.getBean("userService");
		//User user = new User();
		//user.setName("jbpm");
		// user.setPassword("11111111");
		
		userService.initPassword(2);
		//System.out.print("保存User信息" + userService.getById((long) 1).toString());
	}

	
	
	@SuppressWarnings("unchecked")
	@Test
	public void testupdate() {
		
		BaseDao<User> baseDao = (BaseDao<User>) ctx.getBean("baseDao");
		User user =new User();
		user.setName("zl");
		user.setId(2);
		//user.setPassword("1bbd886460827015e5d605ed44252251");
		//System.out.print(userService);
		
		baseDao.update(user);
	}
	@Test
	public void testgetByLoginName1() {
		
		UserService userService = (UserService) ctx.getBean("userService");
		String username="zl";
		User user = userService.getByLoginName(username);
		// user.setPassword("11111111");
		if (user==null){
			System.out.print("获得的User失败,没有找到username" + username);

		}else{
		System.out.print("获得的User信息" + user.toString());
		}
	}
	
	@Test
	public void testgetByLoginName2() {
		
		UserService userService = (UserService) ctx.getBean("userService");
		// user.setPassword("11111111");
		String username="zl";
		String password ="11111111";
		User user = userService.getByLoginName(username,password);

		if (user==null){
			System.out.print("获得的User失败,没有找到username" + username);

		}else{
		System.out.print("获得的User信息" + user.toString());
		}
	}
	
	@Test
	public void testGetAll() {
		
		UserService userService = (UserService) ctx.getBean("userService");
		List <User> users=userService.findAll();
		// user.setPassword("11111111");
		
		System.out.print("获得的User信息" + users.toString());
	}
}
