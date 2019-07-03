<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!doctype html>
<html class="no-js">
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>明日科技有限公司</title>
		<meta name="viewport"
			content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
		<meta name="renderer" content="webkit">
		<meta http-equiv="Cache-Control" content="no-siteapp">
		<link rel="stylesheet"
			href="${pageContext.request.contextPath }/admin/css/amazeui.min.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath }/admin/css/admin.css">
	</head>
	<body>
		<header class="am-topbar admin-header">
		<div class="am-topbar-brand">
			<strong>明日科技</strong>
			<small>后台管理</small>
		</div>

		<button
			class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-success am-show-sm-only"
			data-am-collapse="{target: '#topbar-collapse'}">
			<span class="am-sr-only">导航切换</span>
			<span class="am-icon-bars"></span>
		</button>

		<div class="am-collapse am-topbar-collapse" id="topbar-collapse">

			<ul
				class="am-nav am-nav-pills am-topbar-nav am-topbar-right admin-header-list">

				<li class="am-dropdown" data-am-dropdown>
					<a class="am-dropdown-toggle" data-am-dropdown-toggle
						href="javascript:;"> <span class="am-icon-users"></span>
						<%=session.getAttribute("AdminName")%>，欢迎您 <span class="am-icon-caret-down"></span> </a>
					<ul class="am-dropdown-content">
						<li>
							<a href="${pageContext.request.contextPath }/logout"><span class="am-icon-power-off"></span>
								退出</a>
						</li>
					</ul>
				</li>
			</ul>
		</div>
		</header>

		<div class="am-cf admin-main">
			<!-- sidebar start -->
			<div class="admin-sidebar am-offcanvas" id="admin-offcanvas">
				<div class="am-offcanvas-bar admin-offcanvas-bar">
					<ul class="am-list admin-sidebar-list">
						<li>
							<a href="${pageContext.request.contextPath }/admin/includeRedirect.jsp" title="新闻管理"><span
								class="am-icon-pencil-square-o"></span> 新闻管理</a>
						</li>

						<li>
							<a href="${pageContext.request.contextPath }/admin/includeAdmin.jsp" title="管理员管理"><span
								class="am-icon-bookmark"></span> 管理员管理</a>
						</li>
					</ul>

					<div class="am-panel am-panel-default admin-sidebar-panel">
						<div class="am-panel-bd">
							<p>
								 公告
							</p>
							<p>
								技术支持：明日科技

							</p>
						</div>
					</div>

				</div>

			</div>
			<!-- sidebar end -->

			<!-- content start -->
			<div class="admin-content">

				<div class="am-cf am-padding">
					<div class="am-fl am-cf">
						<strong>后台管理</strong>/
						<strong>新闻管理</strong>
					</div>
				</div>
				
				<div class="am-g">

					<div class="am-u-sm-12 am-u-md-6">
						<div class="am-btn-toolbar">
							<div class="am-btn-group am-btn-group-xs">
								<button type="button" class="am-btn am-btn-success"
									data-am-modal="{target: '#new-popup'}">
									<span class="am-icon-plus"></span> 添加新闻
								</button>
							</div>
						</div>
					</div>
				</div>

				<div class="am-g" style="height: 300px">
					<div class="am-u-sm-12">
						
							<table
								class="am-table am-table-striped am-table-hover table-main">
								<thead>
									<tr>
										<th class="table-id">
											序号
										</th>

										<th class="table-title">
											新闻标题
										</th>
										<th class="table-title">
											创建人
										</th>
										<th class="table-author ">
											创建时间
										</th>
										
										<th class="table-author ">
											操作
										</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${news }" var="news">
										<tr>
											<td>${news.newsID }</td>
											<td>${news.newsTitle }</td>
											<td>${news.adminName }</td>
											<td>${news.newsTime }</td>
											<td> 
								<button type="button" 
									data-am-modal="{target: '#edit-popup'}">
									 修改
								</button>	
								
								<a href="${pageContext.request.contextPath }/deleteNews?newsID=${news.newsID}">
								<button type="button" 
									>
									 删除
								</button>	
								</a>

											</td>
												
											
										</tr>
									</c:forEach>
								</tbody>
							</table>
						
					</div>

				</div>
			</div>
			<!-- content end -->

		</div>

		<div class="am-popup" id="new-popup">
			<div class="am-popup-inner">
				<div class="am-popup-hd">
					<h4 class="am-popup-title">
						添加新闻
					</h4>
					<span data-am-modal-close class="am-close">&times;</span>
				</div>

				<div class="am-popup-bd">
					<form action="${pageContext.request.contextPath }/addNews" method="post"
						class="am-form" >
						<fieldset>
							<div class="am-form-group">
								<label for="doc-vld-ta-2-1">
									新闻标题：
								</label>
								
									 <input type="text" name="newsTitle" id="newsTitle" class="form-control input-sm">
							</div>
							<div class="am-form-group">
								<label for="doc-vld-ta-2-1">
									新闻内容：
								</label>
								<textarea name="newsContent" id="newsContent" cols="30" rows="10"
									placeholder="请输入新闻内容。段落间请用#分隔。" data-validation-message="不能为空" required></textarea>
							</div>
							
							
							
							<button class="am-btn am-btn-secondary" type="submit">
								提交
							</button>
							<button onclick='javascript:$("#new-popup").modal("close");'
								class="am-btn am-btn-secondary" type="button">
								关闭
							</button>
						</fieldset>
					</form>
				</div>

			</div>
		</div>
		
		<div class="am-popup" id="edit-popup">
			<div class="am-popup-inner">
				<div class="am-popup-hd">
					<h4 class="am-popup-title">
						修改新闻
					</h4>
					<span data-am-modal-close class="am-close">&times;</span>
				</div>

				<div class="am-popup-bd">
					<form action="${pageContext.request.contextPath }/updateNews" method="post"
						class="am-form" id="edit-msg">
						<fieldset>
							<div class="am-form-group">
								<label for="doc-vld-ta-2-1">
									新闻标题：
								</label>
								<input id="newsTitle" name="newsTitle" type="text" maxlength="32"
									placeholder="请输入新闻标题" data-validation-message="不能为空" required />
							</div>
							<div class="am-form-group">
								<label for="doc-vld-ta-2-1">
									新闻内容：
								</label>
								<textarea id="newsContent" name="newsContent"  cols="30" rows="10"
									placeholder="请输入新闻内容" data-validation-message="不能为空" required></textarea>
							</div>
							
							
							
							<button class="am-btn am-btn-secondary" type="submit">
								提交
							</button>
							<button onclick='javascript:$("#edit-popup").modal("close");'
								class="am-btn am-btn-secondary" type="button">
								关闭
							</button>
						</fieldset>
					</form>
				</div>

			</div>
		</div>


		<a class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu"
			data-am-offcanvas="{target: '#admin-offcanvas'}"></a>


		<footer>
		<hr>
		<p class="am-padding-left">
			© 2016 明日科技
		</p>
		</footer>

		
		<script src="js/jquery.min.js">
</script>
	<script src="js/amazeui.min.js">
</script>
		
	</body>
</html>
