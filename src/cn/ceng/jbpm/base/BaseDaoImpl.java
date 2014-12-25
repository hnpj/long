package cn.ceng.jbpm.base;

import java.lang.reflect.ParameterizedType;
import java.util.List;

import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateTemplate;

@SuppressWarnings("unchecked")
public class BaseDaoImpl<T> implements BaseDao<T> {
	private HibernateTemplate hibernateTemplate;

	protected Class<T> clazz;
	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	public BaseDaoImpl() {
		
	}

	public Class<T> getClazz() {
		return clazz;
	}

	public void setClazz(Class<T> clazz) {
		ParameterizedType pt = (ParameterizedType) this.getClass()
				.getGenericSuperclass();
		clazz = (Class<T>) pt.getActualTypeArguments()[0];
		System.out.println("clazz = " + clazz);
		this.clazz = clazz;
	}

	public void save(T entity) {
		hibernateTemplate.save(entity);
		// getSession().save(entity);
	}

	public void update(T entity) {
		
		hibernateTemplate.update(entity);
	}

	public void delete(Long id) {

		Object obj = hibernateTemplate.get(clazz, id);
		hibernateTemplate.delete(obj);
//		Object obj = hibernateTemplate.get(clazz, id);
//		hibernateTemplate.delete(obj);
	}

	@Override
	public T getById(int id) {
		// TODO Auto-generated method stub

		return (T) hibernateTemplate.get(clazz, id);
	}

	public List<T> getByIds(int[] ids) {
		return hibernateTemplate.find("FROM " + clazz.getName()
				+ " WHERE ID IN (:ids)", ids);
		/*
		 * return getSession()// .createQuery("FROM " + clazz.getName() +
		 * " WHERE ID IN (:ids)")// .setParameterList("ids", ids)// .list();//
		 */
	}

	public List<T> findAll() {
		return hibernateTemplate.find("FROM " + clazz.getName());
		// return getSession().createQuery("FROM " + clazz.getName()).list();
	}

	/*
	 * protected Session getSession() { Session session =
	 * HibernateUtils.getCurrentSession(); if (session == null) { session =
	 * HibernateUtils.openSession(); session.beginTransaction();
	 * System.out.println("------->开启事务"); } return session;
	 * 
	 * }
	 */

}
