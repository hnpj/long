<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
	<HEAD>
		<TITLE>部门设置</TITLE>
		<%@ include file="/WEB-INF/jsp/Public/commons.jspf"%>
	</HEAD>
	<BODY>

		<!-- 标题显示 -->
		<DIV ID="Title_bar">
			<DIV ID="Title_bar_Head">
				<DIV ID="Title_Head"></DIV>
				<DIV ID="Title">
					<!--页面标题-->
					<IMG BORDER="0" WIDTH="13" HEIGHT="13" SRC="${pageContext.request.contextPath}/style/images/title_arrow.gif" />
					部门信息
				</DIV>
				<DIV ID="Title_End"></DIV>
			</DIV>
		</DIV>
		<!--显示表单内容-->
		<DIV ID=MainArea>

			<html:form action="/DepartmentAction.do">
				<html:hidden property="method" value="${param.id eq null ? 'add' : 'edit' }" />
				<html:hidden property="id" />
				<DIV CLASS="ItemBlock_Title1">
					<!-- 信息说明<DIV CLASS="ItemBlock_Title1">
        	<IMG BORDER="0" WIDTH="4" HEIGHT="7" SRC="${pageContext.request.contextPath}/style/blue/images/item_point.gif" /> 部门信息 </DIV>  -->
				</DIV>

				<!-- 表单内容显示 -->
				<DIV CLASS="ItemBlockBorder">
					<DIV CLASS="ItemBlock">
						<TABLE CELLPADDING="0" CELLSPACING="0" CLASS="mainForm">
							<TR>
								<TD WIDTH="100">
									上级部门
								</TD>
								<TD>
									<html:select property="parentId" styleClass="SelectStyle">
										<html:option value="0">请选择部门</html:option>
										<c:forEach items="${departmentList}" var="departmentIndex">
											<html:option value="${departmentIndex.id}">${departmentIndex.name}</html:option>
										</c:forEach>
									</html:select>
								</TD>
							</TR>
							<TR>
								<TD>
									部门名称
								</TD>
								<TD>
									<html:text property="name" styleClass="InputStyle required"></html:text>
									*
								</TD>
							</TR>
							<TR>
								<TD>
									职能说明
								</TD>
								<TD>
									<html:textarea property="description" styleClass="TextareaStyle" />
								</TD>
							</TR>
						</TABLE>
					</DIV>
				</DIV>

				<!-- 表单操作 -->
				<DIV ID="InputDetailBar">
					<INPUT TYPE="image" SRC="${pageContext.request.contextPath}/style/images/save.png" />
					<A HREF="javascript:history.go(-1);"><IMG SRC="${pageContext.request.contextPath}/style/images/goBack.png" />
					</A>
				</DIV>

			</html:form>
		</DIV>

		<DIV CLASS="Description">
			说明：
			<BR>
			1，上级部门的列表是有层次结构的（树形）。
			<BR />
			2，如果是修改：上级部门列表中不能显示当前修改的部门及其子孙部门。因为不能选择自已或自已的子部门作为上级部门。
			<BR>
		</DIV>

	</BODY>
</HTML>
