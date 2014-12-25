package cn.cengl.jbpm.service;

import cn.ceng.jbpm.base.BaseDao;
import cn.cengl.jbpm.entity.User;

public interface UserService extends BaseDao<User> {

	void initPassword(int id);

	User getByLoginName(String loginName);

	User getByLoginName(String loginName, String password);


}