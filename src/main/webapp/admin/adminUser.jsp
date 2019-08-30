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
		<!--[if lte IE 9]>
<p class="browsehappy">你正在使用<strong>过时</strong>的浏览器，快点暂不支持。 请 <a href="http://browsehappy.com/" target="_blank">升级浏览器</a>
  以获得更好的体验！</p>
<![endif]-->

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
							<a href="${pageContext.request.contextPath }/shiro/logout"><span class="am-icon-power-off"></span>
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
						<strong>管理员信息</strong>
					</div>
				</div>
				
				<div class="am-g">

					<div class="am-u-sm-12 am-u-md-6">
						<div class="am-btn-toolbar">
							<div class="am-btn-group am-btn-group-xs">
								<button type="button" class="am-btn am-btn-success"
									data-am-modal="{target: '#new-popup'}">
									<span class="am-icon-plus"></span> 添加用户
								</button>
							</div>
						</div>
					</div>
				</div>

				<div class="am-g" style="height: 300px">
					<div class="am-u-sm-12">
						<form class="am-form">
							<table 	
								class="am-table am-table-striped am-table-hover table-main">
								<thead>
									<tr>
										<th>
											序号
										</th>
										
										<th>
											用户名
										</th>
										<th>
											用户密码
										</th>
										<th>
											上次登录时间
										</th>
										<th>
										操作
										</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${users }" var="user">
										<tr>
											<td>${user.adminID }</td>
											<td>${user.adminName }</td>
											<td>${user.adminPwd }</td>
											<td>${user.lastLoginTime }</td>
											<td>
											<a href="${pageContext.request.contextPath }/deleteUser?adminID=${user.adminID}">
												<button type="button" > 删除</button>
											</a>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</form>
					</div>

				</div>
			</div>
			<!-- content end -->

		</div>

		<div class="am-popup" id="new-popup">
			<div class="am-popup-inner">
				<div class="am-popup-hd">
					<h4 class="am-popup-title">
						添加用户
					</h4>
					<span data-am-modal-close class="am-close">&times;</span>
				</div>

				<div class="am-popup-bd">
					<form action="${pageContext.request.contextPath }/addUser" method="post"
						class="am-form" id="new-msg">
						<fieldset>
							<div class="am-form-group">
								<label for="doc-vld-ta-2-1">
									用户名：
								</label>
								<input name="adminName" id="adminName" type="text" maxlength="32"
									placeholder="请输入用户名" data-validation-message="不能为空" required />
							</div>
							
							<div class="am-form-group">
								<label for="doc-vld-ta-2-1">
									密码：
								</label>
								<input name="adminPwd" id="adminPwd" type="text" maxlength="32"
									placeholder="请输入密码" data-validation-message="不能为空" required />
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
