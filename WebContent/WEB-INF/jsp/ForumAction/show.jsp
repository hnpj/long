<%@ page language="java" pageEncoding="UTF-8"%>
<html>
<head>
	<title>【${forum.name }】中的主题列表</title>
    <%@ include file="/WEB-INF/jsp/Public/commons.jspf" %>
	<link type="text/css" rel="stylesheet" href="${basePath}/style/blue/forum.css" />
</head>
<body>

<!-- 标题显示 -->
<div id="Title_bar">
    <div id="Title_bar_Head">
        <div id="Title_Head"></div>
        <div id="Title"><!--页面标题-->
            <img border="0" width="13" height="13" src="${basePath}/style/images/title_arrow.gif"/> 【${forum.name }】中的主题列表
        </div>
        <div id="Title_End"></div>
    </div>
</div>

<div id="MainArea">
	<div id="PageHead"></div>
	<center>
		<div class="ItemBlock_Title1" style="width: 98%;">
			<font class="MenuPoint"> &gt; </font>
			<html:link action="/ForumAction?method=list">论坛</html:link>
			<font class="MenuPoint"> &gt; </font>
			${forum.name}
			<span style="margin-left:30px;"><html:link action="/TopicAction?method=addUI&forumId=${forum.id}"> 
				<img align="absmiddle" src="${basePath}/style/blue/images/button/publishNewTopic.png"/></html:link>
			</span>
		</div>
		
		<div class="ForumPageTableBorder">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<!--表头-->
				<tr align="center" valign="middle">
					<td width="3" class="ForumPageTableTitleLeft">
						<img border="0" width="1" height="1" src="${basePath}/style/images/blank.gif" />
					</td>
					<td width="50" class="ForumPageTableTitle"><!--状态/图标-->&nbsp;</td>
					<td class="ForumPageTableTitle">主题</td>
					<td width="130" class="ForumPageTableTitle">作者</td>
					<td width="100" class="ForumPageTableTitle">回复数</td>
					<td width="130" class="ForumPageTableTitle">最后回复</td>
					<td width="3" class="ForumPageTableTitleRight">
						<img border="0" width="1" height="1" src="${basePath}/style/images/blank.gif" />
					</td>
				</tr>
				<tr height="1" class="ForumPageTableTitleLine"><td colspan="8"></td></tr>
				<tr height=3><td colspan=8></td></tr>
					
				<!--主题列表-->
				<c:forEach items="${topicList}" var="topic">				
					<tbody class="dataContainer">
						<tr height="35" id="d0" class="template">
							<td></td>
							<td class="ForumTopicPageDataLine" align="center"><img src="${basePath}/style/images/topicType_${topic.type}.gif" /></td>
							<td class="Topic"><html:link action="/TopicAction?method=show&id=${topic.id}" styleClass="Default">${topic.title}</html:link></td>
							<td class="ForumTopicPageDataLine">
								<ul class="ForumPageTopicUl">
									<li class="Author">${topic.author.name }</li>
									<li class="CreateTime">${topic.postTime }</li>
								</ul>
							</td>
							<td class="ForumTopicPageDataLine Reply" align="center"><b>${topic.replyCount}</b></td>
							<td class="ForumTopicPageDataLine">
								<ul class="ForumPageTopicUl">
									<li class="Author">${topic.lastReply.author.name }</li>
									<li class="CreateTime">${topic.lastReply.postTime }</li>
								</ul>
							</td>
							<td></td>
						</tr>
						</tbody>
					</c:forEach>
					<!--主题列表结束-->	
						
					<tr height="3"><td colspan="9"></td></tr>
				
			</table>
			
			<!--其他操作-->
			<div id="TableTail">
				<div id="TableTail_inside">
					<table border="0" cellspacing="0" cellpadding="0" height="100%" align="left">
						<tr valign=bottom>
							<td></td>
							<td><select name="postTimeSpan">
									<option value="0">全部主题</option>
									<option value="1">全部精华贴</option>
									<option value="2">当天的主题</option>
									<option value="3">本周的主题</option>
									<option value="4">本月的主题</option>
								</select>
								<select name="orderBy">
									<option value="0">按最后更新时间排序</option>
									<option value="1">按主题发表时间排序</option>
									<option value="2">按回复数量排序</option>
								</select>
								<select name="sortDirection">
									<option value="false">降序</option>
									<option value="true">升序</option>
								</select>
								<input type="IMAGE" src="${basePath}/style/blue/images/button/submit.PNG" align="ABSMIDDLE"/>
							</td>
						</tr>
					</table>
				</div>
			</div>
			
		</div>
	</center>
</div>

<!--分页信息-->
<div id=PageSelectorBar>
	<div id=PageSelectorMemo>
		页次：7/13页 &nbsp;
		每页显示：30条 &nbsp;
		总记录数：385条
	</div>
	<div id=PageSelectorSelectorArea>
		<!--
		<IMG SRC="${basePath}/style/blue/images/pageSelector/firstPage2.png"/>
		-->
		<a href="javascript:void(0)" title="首页" style="cursor: hand;">
			<img src="${basePath}/style/blue/images/pageSelector/firstPage.png"/></a>
		
		<span class="PageSelectorNum" style="cursor: hand;" onClick="gotoPageNum(2);">3</span>
		<span class="PageSelectorNum" style="cursor: hand;" onClick="gotoPageNum(2);">4</span>
		<span class="PageSelectorNum" style="cursor: hand;" onClick="gotoPageNum(2);">5</span>
		<span class="PageSelectorNum" style="cursor: hand;" onClick="gotoPageNum(2);">6</span>
		<span class="PageSelectorNum PageSelectorSelected">7</span>
		<span class="PageSelectorNum" style="cursor: hand;" onClick="gotoPageNum(2);">8</span>
		<span class="PageSelectorNum" style="cursor: hand;" onClick="gotoPageNum(2);">9</span>
		<span class="PageSelectorNum" style="cursor: hand;" onClick="gotoPageNum(2);">10</span>
		<span class="PageSelectorNum" style="cursor: hand;" onClick="gotoPageNum(2);">11</span>
		<span class="PageSelectorNum" style="cursor: hand;" onClick="gotoPageNum(2);">12</span>
		
		<!--
		<IMG SRC="${basePath}/style/blue/images/pageSelector/lastPage2.png"/>
		-->
		<a href="#" title="尾页" style="cursor: hand;">
			<img src="${basePath}/style/blue/images/pageSelector/lastPage.png"/></a>
		
		转到：
		<input onFocus="this.select();" maxlength="2" class="inputStyle" type="text" value="1" name="currPage" tabindex="0"/>
		<input type="submit" name="goBtn" value="Go" class="MiddleButtonStyle" />
	</div>
</div>

<div class="Description">
	说明：<br />
	1，主题默认按最后更新的时间降序排列。最后更新时间是指主题最后回复的时间，如果没有回复，就是主题发表的时间。<br />
	2，帖子有普通、置顶、精华之分。置顶贴始终显示在最上面，精华贴用不同的图标标示。<br />
</div>

</body>
</html>
	