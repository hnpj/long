<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
	<HEAD>
		<TITLE>岗位列表</TITLE>
		<%@ include file="/WEB-INF/jsp/Public/commons.jspf"%>
	</HEAD>
	<BODY>

		<DIV ID="Title_bar">
			<DIV ID="Title_bar_Head">
				<DIV ID="Title_Head"></DIV>
				<DIV ID="Title">
					<!--页面标题-->
					<IMG BORDER="0" WIDTH="13" HEIGHT="13" SRC="${pageContext.request.contextPath}/style/images/title_arrow.gif" />
					岗位管理
				</DIV>
				<DIV ID="Title_End"></DIV>
			</DIV>
		</DIV>

		<DIV ID="MainArea">
			<TABLE CELLSPACING="0" CELLPADDING="0" CLASS="TableStyle">

				<!-- 表头-->
				<THEAD>
					<TR ALIGN="CENTER" VALIGN="MIDDLE" ID="TableTitle">
						<TD WIDTH="200px">
							岗位名称
						</TD>
						<TD WIDTH="300px">
							岗位说明
						</TD>
						<TD>
							相关操作
						</TD>
					</TR>
				</THEAD>

				<!--显示数据列表-->
				<TBODY ID="TableData" CLASS="dataContainer">
					<c:forEach items="${roleList}" var="role">
						<TR CLASS="TableDetail1 template">
							<TD>
								${role.name}&nbsp;
							</TD>
							<TD>
								${role.description}&nbsp;
							</TD>
							<TD>
								<html:link action="/RoleAction?method=delete&&id=${role.id}" onclick="return confirm('确定删除该记录吗?')">删除</html:link>
								<html:link action="/RoleAction?method=editUI&&id=${role.id}">修改</html:link>
								<html:link action="/RoleAction?method=setPrivilegeUI&&id=${role.id}">设置权限</html:link>
							</TD>
						</TR>
					</c:forEach>
				</TBODY>
			</TABLE>

			<!-- 其他功能超链接 -->
			<DIV ID="TableTail">
				<DIV ID="TableTail_inside">
					<A HREF="${pageContext.request.contextPath}/RoleAction.do?method=addUI"><IMG SRC="${pageContext.request.contextPath}/style/images/createNew.png" /> </A>
				</DIV>
			</DIV>
		</DIV>
	</BODY>
</HTML>
