<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
	<HEAD>
		<TITLE>用户列表</TITLE>
		<%@ include file="/WEB-INF/jsp/Public/commons.jspf"%>
	</HEAD>
	<BODY>

		<DIV ID="Title_bar">
			<DIV ID="Title_bar_Head">
				<DIV ID="Title_Head"></DIV>
				<DIV ID="Title">
					<!--页面标题-->
					<IMG BORDER="0" WIDTH="13" HEIGHT="13" SRC="${pageContext.request.contextPath}/style/images/title_arrow.gif" />
					用户管理
				</DIV>
				<DIV ID="Title_End"></DIV>
			</DIV>
		</DIV>

		<DIV ID="MainArea">
			<TABLE CELLSPACING="0" CELLPADDING="0" CLASS="TableStyle">

				<!-- 表头-->
				<THEAD>
					<TR ALIGN=center VALIGN=middle ID=TableTitle>
						<TD WIDTH="100">
							登录名
						</TD>
						<TD WIDTH="100">
							姓名
						</TD>
						<TD WIDTH="100">
							所属部门
						</TD>
						<TD WIDTH="200">
							岗位
						</TD>
						<TD>
							备注
						</TD>
						<TD>
							相关操作
						</TD>
					</TR>
				</THEAD>

				<!--显示数据列表-->
				<TBODY ID="TableData" CLASS="dataContainer">
					<c:forEach items="${userList}" var="user">
						<TR CLASS="TableDetail1 template">
							<TD>
								${user.loginName}&nbsp;
							</TD>
							<TD>
								${user.name}&nbsp;
							</TD>
							<TD>
								${user.department.name}&nbsp;
							</TD>
							<TD>
								<c:forEach items="${user.roles}" var="role">${role.name} </c:forEach>
								&nbsp;
							</TD>
							<TD>
								${user.description}&nbsp;
							</TD>
							<TD>
								<html:link action="/UserAction.do?method=delete&&id=${user.id}" onclick="return confirm('您确定要删除该用户吗？')">删除</html:link>
								<html:link action="/UserAction.do?method=editUI&&id=${user.id}">修改</html:link>
								<html:link action="/UserAction.do?method=initPassword&&id=${user.id}" onclick="return confirm('您确定要初始化密码吗？')">初始化密码</html:link>
							</TD>
						</TR>
					</c:forEach>
				</TBODY>
			</TABLE>

			<!-- 其他功能超链接 -->
			<DIV ID="TableTail">
				<DIV ID="TableTail_inside">
					<A HREF="${pageContext.request.contextPath}/UserAction.do?method=addUI"> <IMG
							SRC="${pageContext.request.contextPath}/style/images/createNew.png" /> </A>
				</DIV>
			</DIV>
		</DIV>

	</BODY>
</HTML>
