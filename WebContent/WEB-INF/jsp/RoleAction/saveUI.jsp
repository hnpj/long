<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
	<HEAD>
		<TITLE>岗位设置</TITLE>
		<%@ include file="/WEB-INF/jsp/Public/commons.jspf"%>
	</HEAD>
	<BODY>

		<!-- 标题显示 -->
		<DIV ID="Title_bar">
			<div ID="Title_bar_Head">
				<div ID="Title_Head"></div>
				<div ID="Title">
					<!--页面标题-->
					<IMG BORDER="0" WIDTH="13" HEIGHT="13" SRC="${pageContext.request.contextPath}/style/images/title_arrow.gif" />
					岗位设置
				</div>
				秘书
				<div ID="Title_End"></div>
			</div>
		</div>

		<!--显示表单内容-->
		<div ID="MainArea">
			<html:form action="/RoleAction">
				<html:hidden property="method" value="${param.id eq null ? 'add' :'edit' }" />
				<html:hidden property="id" />
				<div CLASS="ItemBlock_Title1">
					<!-- 信息说明<div CLASS="ItemBlock_Title1">
        	<IMG BORDER="0" WIDTH="4" HEIGHT="7" SRC="${pageContext.request.contextPath}/style/blue/images/item_point.gif" /> 岗位信息 </div>  -->
				</div>

				<!-- 表单内容显示 -->
				<div CLASS="ItemBlockBorder">
					<div CLASS="ItemBlock">
						<TABLE CELLPADDING="0" CELLSPACING="0" CLASS="mainForm">
							<TR>
								<TD WIDTH="100">
									岗位名称
								</TD>
								<TD>
									<html:text property="name" value="${role.name}" styleClass="InputStyle required" />
									*
								</TD>
							</TR>
							<TR>
								<TD>
									岗位说明
								</TD>
								<TD>
									<html:textarea property="description" value="${role.description}" styleClass="TextareaStyle" />
								</TD>
							</tr>
						</TABLE>
					</div>
				</div>

				<!-- 表单操作 -->
				<div ID="InputdetailBar">
					<html:image src="${pageContext.request.contextPath}/style/images/save.png" />
					<A HREF="javascript:history.go(-1);"><IMG SRC="${pageContext.request.contextPath}/style/images/goBack.png" />
					</A>
				</div>
			</html:form>

		</div>
	</BODY>
</HTML>
