package cn.ceng.jbpm.base;


import java.util.List;

public interface BaseDao<T> {

	void save(T entity);

	void delete(Long id);

	void update(T entity);

	T getById(int id);

	List<T> getByIds(int[] ids);

	List<T> findAll();
}

