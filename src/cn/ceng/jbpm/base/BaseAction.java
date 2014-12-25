package cn.ceng.jbpm.base;

import javax.annotation.Resource;

import org.apache.struts.actions.DispatchAction;

import cn.cengl.jbpm.service.UserService;



public class BaseAction extends DispatchAction {

//	protected UserService userService = BeanFactory.getImpl(UserService.class);
//	protected DepartmentService departmentService = BeanFactory.getImpl(DepartmentService.class);
//	protected RoleService roleService = BeanFactory.getImpl(RoleService.class);
//	protected ResourceService resourceService = BeanFactory.getImpl(ResourceService.class);
//	protected ForumService forumService = BeanFactory.getImpl(ForumService.class);
//	protected TopicService topicService = BeanFactory.getImpl(TopicService.class);
//	protected ReplyService replyService = BeanFactory.getImpl(ReplyService.class);
	@Resource(name="userService")
	protected UserService userService ;
//	protected DepartmentService departmentService = BeanFactory.getImpl(DepartmentService.class);
//	protected RoleService roleService = BeanFactory.getImpl(RoleService.class);
//	protected ResourceService resourceService = BeanFactory.getImpl(ResourceService.class);
//	protected ForumService forumService = BeanFactory.getImpl(ForumService.class);
//	protected TopicService topicService = BeanFactory.getImpl(TopicService.class);
//	protected ReplyService replyService = BeanFactory.getImpl(ReplyService.class);
	
}
