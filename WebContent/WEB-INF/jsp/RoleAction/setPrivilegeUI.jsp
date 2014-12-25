<%@ page language="java" pageEncoding="UTF-8"%>

<HTML>
	<HEAD>
		<TITLE>配置权限</TITLE>

		<%@ include file="/WEB-INF/jsp/Public/commons.jspf"%>
		<SCRIPT LANGUAGE="javascript" SRC="${pageContext.request.contextPath}/script/jquery_treeview/jquery.treeview.js"></SCRIPT>
		<LINK TYPE="text/css" REL="stylesheet"
			HREF="${pageContext.request.contextPath}/script/jquery_treeview/jquery.treeview.css" />

		<SCRIPT TYPE="text/javascript">
 		// 选择所有
    	function selectAll(checkedValue){
    		$("input[type=checkbox][name=resourceIds]").attr("checked", checkedValue);
    	}
    	
    	$(function(){
    		// 绑定click事件
    		$("[name=resourceIds]").click(function(){
    		
    			// 当前的选中状态
    			var checkedValue = this.checked;
    			
    			// 1，选中一个权限时：
    			if(checkedValue){
				     // a，应该选中他的所有直系上级
				     $(this).parents("li").children("[name=resourceIds]").attr("checked", checkedValue);
				     
				     // b，应该选中他的所有直系下级
				     $(this).siblings("ul").find("[name=resourceIds]").attr("checked", checkedValue);
				}
				// 2，取消选择一个权限时：
				else{
				     // a，应该取消选择 他的所有直系下级
				     $(this).siblings("ul").find("[name=resourceIds]").attr("checked", checkedValue);
				     
				     // b，如果同级的权限都是未选择状态，就应该取消选中他的直接上级，并递归向上做这个操作
				     if( $(this).parent("li").siblings("li").children("[name=resourceIds]:checked").size() == 0 ){
				     	$(this).parent("li").parent("ul").siblings("[name=resourceIds]").attr("checked", checkedValue);
				     	
				     	// 上级的上级也要进行同样的操作（仅当前为第三级时才可以）
				     	if( $(this).parent("li").parent("ul").parent("li").siblings("li").children("[name=resourceIds]:checked").size() == 0 ){
				     		$(this).parent("li").parent("ul").parent("li").parent("ul").siblings("[name=resourceIds]").attr("checked", checkedValue);
				     	}
				     }
				}
    		});
    		});
    	
    	$(function(){
    		$("#tree").treeview();
    	});
    </SCRIPT>
	</HEAD>
	<BODY>

		<!-- 标题显示 -->
		<DIV ID="Title_bar">
			<DIV ID="Title_bar_Head">
				<DIV ID="Title_Head"></DIV>
				<DIV ID="Title">
					<!--页面标题-->
					<IMG BORDER="0" WIDTH="13" HEIGHT="13" SRC="${pageContext.request.contextPath}/style/images/title_arrow.gif" />
					配置权限
				</DIV>
				<DIV ID="Title_End"></DIV>
			</DIV>
		</DIV>

		<!--显示表单内容-->
		<DIV ID=MainArea>
			<html:form action="RoleAction">
				<html:hidden property="method" value="setPrivilege" />
				<html:hidden property="id" />
				<DIV CLASS="ItemBlock_Title1">
					<!-- 信息说明 -->
					<DIV CLASS="ItemBlock_Title1">
						<IMG BORDER="0" WIDTH="4" HEIGHT="7" SRC="${pageContext.request.contextPath}/style/blue/images/item_point.gif" />
						正在为【${roleName}】配置权限
					</DIV>
				</DIV>

				<!-- 表单内容显示 -->
				<DIV CLASS="ItemBlockBorder">
					<DIV CLASS="ItemBlock">
						<TABLE CELLPADDING="0" CELLSPACING="0" CLASS="mainForm">
							<!--表头-->
							<THEAD>
								<TR ALIGN="LEFT" VALIGN="MIDDLE" ID="TableTitle">
									<TD WIDTH="300px" STYLE="padding-left: 7px;">
										<!-- 如果把全选元素的id指定为selectAll，并且有函数selectAll()，就会有错。因为有一种用法：可以直接用id引用元素 -->
										<INPUT TYPE="CHECKBOX" ID="cbSelectAll" onClick="selectAll(this.checked)" />
										<LABEL FOR="cbSelectAll">
											全选
										</LABEL>
									</TD>
								</TR>
							</THEAD>

							<!--显示数据列表-->
							<TBODY ID="TableData">
								<TR CLASS="TableDetail1">
									<!-- 显示权限树 -->
									<TD>
										<ul id="tree">
											<c:forEach items="${topResourceList}" var="topResource">
												<li id="1">
													<html:multibox property="resourceIds" value="${topResource.id}" styleId="cb_${topResource.id}" />
													<label for="cb_${topResource.id}">
														${topResource.name}
													</label>
													<ul>
														<%-- 第二级--%>
														<c:forEach items="${topResource.children}" var="childResource">
															<li id="2">
																<html:multibox property="resourceIds" value="${childResource.id}" styleId="cb_${childResource.id}" />
																<label for="cb_${childResource.id}">
																	${childResource.name}
																</label>
																<ul>
																	<c:forEach items="${childResource.children}" var="childResource">
																		<li id="3">
																			<html:multibox property="resourceIds" value="${childResource.id}" styleId="cb_${childResource.id}" />
																			<label for="cb_${childResource.id}">
																				${childResource.name}
																			</label>
																		</li>
																	</c:forEach>
																</ul>
															</li>
														</c:forEach>
													</ul>
												</li>
											</c:forEach>
										</ul>
									</TD>
								</TR>
							</TBODY>
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
			<BR />
			1，选中一个权限时：
			<BR>
			&nbsp;&nbsp;&nbsp;&nbsp; a，应该选中 他的所有直系上级。
			<BR />
			&nbsp;&nbsp;&nbsp;&nbsp; b，应该选中他的所有直系下级。
			<BR />
			2，取消选择一个权限时：
			<BR>
			&nbsp;&nbsp;&nbsp;&nbsp; a，应该取消选择 他的所有直系下级。
			<BR />
			&nbsp;&nbsp;&nbsp;&nbsp; b，如果同级的权限都是未选择状态，就应该取消选中他的直接上级，并递归向上做这个操作。
			<BR />

			3，全选/取消全选。
			<br>
			4，默认选中当前岗位已有的权限。
			<br>
		</DIV>

	</BODY>
</HTML>
