package cn.ceng.jbpm.web.action;

import java.util.Collection;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

import cn.ceng.jbpm.base.BaseAction;
import cn.cengl.jbpm.entity.User;



public class UserAction extends BaseAction {

	public ActionForward checkLoginName(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String loginName = request.getParameter("loginName");
		 System.out.println(loginName+"~~~~~~~~~~~~~~~~~~~~~~~~~~~");
		User user = userService.getByLoginName(loginName);
		String result = user == null ? "true" : "false";
		response.getWriter().write(result);
		return null;
	}

	public ActionForward list(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<User> userList = userService.findAll();
		request.setAttribute("userList", userList);
		return mapping.findForward("list");
	}

	public ActionForward delete(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Long id = Long.valueOf(request.getParameter("id"));
		userService.delete(id);
		return mapping.findForward("toList");
	}

//	public ActionForward addUI(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
//		List<Role> roleList = roleService.findAll();
//		request.setAttribute("roleList", roleList);
//
//		List<Department> topList = departmentService.findTopDepartment();
//		List<Department> departmentList = DepartmentUtils.getAllDepartmentList(topList);
//		request.setAttribute("departmentList", departmentList);
//		return mapping.findForward("addUI");
//	}
//
//	public ActionForward add(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
//		UserActionForm editUserForm = (UserActionForm) form;
//		User user = new User();
//
//		List<Role> roleList = roleService.getByIds(editUserForm.getRoleIdList());
//
//		user.setName(editUserForm.getName());
//		user.setDescription(editUserForm.getDescription());
//		user.setDepartment(departmentService.getById(editUserForm.getDepartmentId()));
//		user.setRoles(new HashSet<Role>(roleList));
//		user.setAvatarPath(editUserForm.getAvatarPath());
//		user.setEmail(editUserForm.getEmail());
//		user.setLoginName(editUserForm.getLoginName());
//		user.setPhoneNumber(editUserForm.getPhoneNumber());
//		user.setSex(editUserForm.getSex());
//
//		userService.save(user);
//
//		return mapping.findForward("toList");
//	}
//
//	public ActionForward editUI(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
//		Long id = Long.valueOf(request.getParameter("id"));
//		User user = userService.getById(id);
//		List<Role> allRoleList = roleService.findAll();
//		request.setAttribute("roleList", allRoleList);
//
//		UserActionForm userActionForm = (UserActionForm) form;
//		// UserActionForm userActionForm = new UserActionForm();
//
//		BeanUtils.copyProperties(userActionForm, user);
//		Department department = user.getDepartment();
//		if (department != null) {
//			userActionForm.setDepartmentId(department.getId());
//		}
//
//		Collection<Role> roleList = user.getRoles();
//		Long[] roleIdList = new Long[user.getRoles().size()];
//		int i = 0;
//		for (Role role : roleList) {
//			roleIdList[i] = role.getId();
//			i++;
//		}
//
//		userActionForm.setRoleIdList(roleIdList);
//
//		// form = userActionForm;
//
//		List<Department> topList = departmentService.findTopDepartment();
//		List<Department> departmentList = DepartmentUtils.getAllDepartmentList(topList);
//		request.setAttribute("departmentList", departmentList);
//
//		return mapping.findForward("editUI");
//	}
//
//	public ActionForward edit(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
//		UserActionForm editUserForm = (UserActionForm) form;
//		User user = userService.getById(editUserForm.getId());
//
//		user.setDepartment(departmentService.getById(editUserForm.getDepartmentId()));
//		user.setLoginName(editUserForm.getLoginName());
//		user.setName(editUserForm.getName());
//		user.setSex(editUserForm.getSex());
//		// System.out.println(user.getSex() + "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
//		user.setPhoneNumber(editUserForm.getPhoneNumber());
//		user.setEmail(editUserForm.getEmail());
//		user.setDescription(editUserForm.getDescription());
//
//		Long[] roleIdList = editUserForm.getRoleIdList();
//		if (roleIdList != null && roleIdList.length > 0) {
//			user.setRoles(new HashSet<Role>(roleService.getByIds(roleIdList)));
//		}
//		userService.update(user);
//
//		return mapping.findForward("toList");
//	}

	public ActionForward initPassword(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String idStr = request.getParameter("id");
		if (idStr != null) {
			int id = Integer.valueOf(idStr);
			userService.initPassword(id);
		}
		return mapping.findForward("toList");
	}

	public ActionForward loginUI(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {

		return mapping.findForward("loginUI");
	}

	public ActionForward login(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String loginName = request.getParameter("loginName");
		String password = request.getParameter("password");
		System.out.println(loginName);
		System.out.println(password);
		User user = userService.getByLoginName(loginName, password);
		if (user == null) {
			System.out.println("没有此用户");
			ActionErrors errors = new ActionErrors();
			errors.add("login", new ActionMessage("用户名或密码不正确!", false));
			saveErrors(request, errors);
			return mapping.findForward("loginUI");
		} else {
			System.out.println(user.getName());
			request.getSession().setAttribute("user", user);

			// 用户权限
//			Set<Resource> menuList = null;
//
//			if ("admin".equals(user.getLoginName())) {
//				menuList = new LinkedHashSet<Resource>(resourceService.findAll());
//			} else {
//				menuList = new TreeSet<Resource>();
//				for (Role role : user.getRoles()) {
//					menuList.addAll(role.getResources());
//				}
//				// System.out.println(menuList.toString());
//
//			}
//			request.getSession().setAttribute("menuList", menuList);
			// for (Resource resource : menuList) {
			// System.out.println(resource.getName());
			// System.out.println(resource.getParent());
			//			}
			return mapping.findForward("index");
		}

	}

	public ActionForward logout(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.getSession().removeAttribute("user");
		request.getSession().removeAttribute("menuList");
		
		return mapping.findForward("logout");
	}

}
