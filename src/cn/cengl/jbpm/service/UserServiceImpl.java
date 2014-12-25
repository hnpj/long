package cn.cengl.jbpm.service;

import java.util.List;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.orm.hibernate3.HibernateTemplate;

import cn.ceng.jbpm.base.BaseDaoImpl;
import cn.cengl.jbpm.entity.User;

public class UserServiceImpl extends BaseDaoImpl<User> implements UserService {
	private HibernateTemplate hibernateTemplate;

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	public void initPassword(int id) {
		// 11111111-->1bbd886460827015e5d605ed44252251
		String password = DigestUtils.md5Hex("11111111");
		// User user = (User) getSession().get(User.class, id);
		// User user = (User) hibernateTemplate.get(User.class,
		// Integer.getInteger(id+""));

		User user = (User) hibernateTemplate.get(User.class, id);
		user.setPassword(password);
		hibernateTemplate.update(user);

	}

	@Override
	public void save(User user) {
		String password = DigestUtils.md5Hex(user.getPassword());
		user.setPassword(password);
		// getSession().save(user);
		// hibernateTemplate.save(user);
		hibernateTemplate.save(user);
	}

	public User getByLoginName(String loginName) {

		/*
		 * return (User) getSession()//
		 * .createQuery("from User u where u.loginName=?")// .setParameter(0,
		 * loginName)// .uniqueResult();
		 */
		@SuppressWarnings("unchecked")
		List<User> users = hibernateTemplate.find("from User u where u.name=?",
				loginName);
		return users.isEmpty()==true?null : users.get(0);
	}

	@SuppressWarnings("unchecked")
	public User getByLoginName(String loginName, String password) {
		String digest = DigestUtils.md5Hex(password);
		List<User> users = hibernateTemplate.find(
				"FROM User u WHERE u.name=? AND u.password=?", new String[] {
						loginName, digest });
		System.out.print(users);
		return users.isEmpty() == true ? null : users.get(0);
	}

	@SuppressWarnings("unchecked")
	public List<User> findAll() {
		return hibernateTemplate.find("FROM User");
		// return getSession().createQuery("FROM " + clazz.getName()).list();
	}


	
}
