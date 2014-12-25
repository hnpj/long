<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
	<HEAD>
		<TITLE>部门列表</TITLE>
		<%@ include file="/WEB-INF/jsp/Public/commons.jspf"%>
	</HEAD>
	<BODY>

		<DIV ID="Title_bar">
			<DIV ID="Title_bar_Head">
				<DIV ID="Title_Head"></DIV>
				<DIV ID="Title">
					<!--页面标题-->
					<IMG BORDER="0" WIDTH="13" HEIGHT="13" SRC="${pageContext.request.contextPath}/style/images/title_arrow.gif" />
					部门管理
				</DIV>
				<DIV ID="Title_End"></DIV>
			</DIV>
		</DIV>

		<DIV ID="MainArea">
			<TABLE CELLSPACING="0" CELLPADDING="0" CLASS="TableStyle">

				<!-- 表头-->
				<THEAD>
					<TR ALIGN=center VALIGN=middle ID=TableTitle>
						<TD WIDTH="150px">
							部门名称
						</TD>
						<TD WIDTH="150px">
							上级部门名称
						</TD>
						<TD WIDTH="200px">
							职能说明
						</TD>
						<TD>
							相关操作
						</TD>
					</TR>
				</THEAD>

				<!--显示数据列表-->
				<TBODY ID="TableData" CLASS="dataContainer">
					<c:forEach items="${departmentList}" var="department">
						<TR CLASS="TableDetail1 template">
							<TD>
								<html:link action="/DepartmentAction.do?method=list&&parentId=${department.id}" property="">${department.name}</html:link>
							</TD>
							<TD>
								${department.parent.name}&nbsp;
							</TD>
							<TD>
								${department.description}&nbsp;
							</TD>
							<TD>
								<html:link action="/DepartmentAction.do?method=delete&&id=${department.id}&&parentId=${department.parent.id}"
									onclick="return confirm('这将删除所有的下级部门，您确定要删除吗？')">删除</html:link>
								<html:link action="/DepartmentAction.do?method=editUI&&id=${department.id}">修改</html:link>
							</TD>
						</TR>
					</c:forEach>
				</TBODY>
			</TABLE>

			<!-- 其他功能超链接 -->
			<DIV ID="TableTail">
				<DIV ID="TableTail_inside">
					<A HREF="${pageContext.request.contextPath}/DepartmentAction.do?method=addUI&&parentId=${parent.id}"><img
							src="${pageContext.request.contextPath}/style/images/createNew.png" /> </A>
					<c:if test="${parent.id ne null}">
						<A HREF="${pageContext.request.contextPath}/DepartmentAction.do?method=list&&parentId=${parent.parent.id}"><img
								src="${pageContext.request.contextPath}/style/blue/images/button/ReturnToPrevLevel.png" /> </A>
					</c:if>

				</DIV>
			</DIV>
		</DIV>

		<!--说明-->
		<DIV ID="Description">
			说明：
			<BR />
			1，列表页面只显示一层的（同级的）部门数据，默认显示最顶级的部门列表。
			<BR />
			2，点击部门名称，可以查看此部门相应的下级部门列表。
			<BR />
			3，删除部门时，此部门的所有下级部门也同时被删除。
		</DIV>

	</BODY>
</HTML>
