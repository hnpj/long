package test;

import org.apache.log4j.Logger;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.cengl.jbpm.entity.User;
import cn.cengl.jbpm.service.UserService;

public class Springtest {
public static Logger log=Logger.getLogger(Springtest.class);
	public static void main(String[] args) {
		log.info("开始运行");
		ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
//		UserService userService=(UserService) ctx.getBean("userService");
//		User user=new User();
//		user.setName("chencan");
//		user.setPassword("11111111");
//		userService.save(user);
//		log.debug("保存User信息"+user.toString());
		log.debug("启动测试完成");
	}

}
