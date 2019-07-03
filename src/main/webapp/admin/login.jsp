<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="javax.imageio.*"%>


<!DOCTYPE html>
<html>
	<head lang="en">
		<meta charset="UTF-8">
		<title>明日科技有限公司</title>
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport"
			content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<meta name="format-detection" content="telephone=no">
		<meta name="renderer" content="webkit">
		<meta http-equiv="Cache-Control" content="no-siteapp" />
		<link rel="stylesheet"
			href="${pageContext.request.contextPath }/admin/css/amazeui.min.css" />
		<style>
		
.header {
	text-align: center;
}

.header h1 {
	font-size: 200%;
	color: #333;
	margin-top: 30px;
}

.header p {
	font-size: 14px;
}
</style>
	</head>


	<body>
		
		<div class="header">
			<div class="am-g">
				<h1>
					明日科技有限公司
				</h1>
			</div>
			<hr />
		</div>
		
		<div class="am-g">
			<div class="am-u-lg-6 am-u-md-8 am-u-sm-centered">
				<form action="${pageContext.request.contextPath }/login" method="post" class="am-form login-form">
					<label for="name">
						用户名:
					</label>
					<input type="text" name="adminName" id="adminName"  value="">
					<br>
					<label for="ps">
						密码:
					</label>
					<input type="password" name="adminPwd"  id="adminPwd"  value="">
					<br>

					<br />
					<div class="am-cf">
					
					
					
					
					<input type="submit" value="登 录" id="save"	class="am-btn am-btn-primary am-btn-sm am-fl">

					</div>
				</form>
				
			</div>
		</div>
		
	</body>

	<script src="js/jquery.min.js"></script>
	<script src="js/amazeui.min.js"></script>

	<!--<![endif]-->
</html>