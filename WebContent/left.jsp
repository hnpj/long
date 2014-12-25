<%@ page language="java" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/Public/commons.jspf"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>导航菜单</title>
		<link type="text/css" rel="stylesheet" href="style/blue/menu.css" />
		<script type="text/javascript">
			function menuClick(topMenuDiv){
				$(".MenuLevel2").not($(topMenuDiv).siblings("ul")).hide();
				$(topMenuDiv).siblings("ul").toggle();
			}
		</script>
	</head>
	<body style="margin: 0">
		<div id="Menu">
			<ul id="MenuUl">
				<%-- 显示顶级菜单 --%>
				<c:forEach items="${menuList}" var="top">
					<c:if test="${top.parent eq null}">
						<li class="level1">
							<div class="level1Style" onclick="menuClick(this)">
								<img src="style/images/MenuIcon/${top.icon}" class="Icon" />
								${top.name }
							</div>

							<%-- 显示二级菜单 --%>
							<ul style="display: none;" class="MenuLevel2">
								<c:forEach items="${menuList}" var="child">
									<c:if test="${child.parent eq top}">
										<li class="level2">
											<div class="level2Style">
												<img src="style/images/MenuIcon/menu_arrow_single.gif" />
												<html:link target="desktop" action="${child.url}"> ${child.name}</html:link>
											</div>
										</li>
									</c:if>
								</c:forEach>
							</ul>
						</li>
					</c:if>
				</c:forEach>
			</ul>
		</div>
	</body>
</html>
