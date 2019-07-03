<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="cn.sjxy.myWeb.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path;
%>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta name="viewport"
			content="width=device-width, initial-scale=1, maximum-scale=1">
		<title>明日科技有限公司</title>
		<link href="${pageContext.request.contextPath }/front/css/main.css" rel="stylesheet" type="text/css">
		<link href="${pageContext.request.contextPath }/front/css/container.css" rel="stylesheet" type="text/css">
		<link href="${pageContext.request.contextPath }/front/css/reset.css" rel="stylesheet" type="text/css">
		<link href="${pageContext.request.contextPath }/front/css/screen.css" rel="stylesheet" type="text/css">
		<script src="${pageContext.request.contextPath }/front/js/jquery.min.js">
</script>
		<script src="${pageContext.request.contextPath }/front/js/tab.js">
</script>
	</head>

	<body>
		<jsp:include page="common_header.jsp"></jsp:include>

		<!--banner-->
		<div class="second_banner">
			<img src="${pageContext.request.contextPath }/front/img/3.gif" alt="">
		</div>
		<!--//banner-->
		<!--新闻-->
		<div class="container">
	<div class="left">
        <div class="menu_plan">
            <div class="menu_title">公司动态<br><span>news of company</span></div>
			 <ul id="tab">
                <li ><a href="#">公司新闻</a></li>
            </ul>
        </div>
     </div>
     <div class="right">
            <div class="location">
                <span>当前位置：<a href="javascript:void(0)" id="a">公司新闻</a></span>
                <div class="brief" id="b"><a href="#">公司新闻</a></div>
            </div>
            <div style=" font-size:14px; margin-top:53px; line-height:36px;">
               
							<table style="margin-top:70px">
								<thead>
									<tr class="tt_bg">
										
										<th>
											新闻标题
										</th>
										<th>
											发布人
										</th>
										<th>
											发布时间
										</th>
										<th>
											详情
										</th>
										
									</tr>
									
									
							</thead>
							<tbody>
							<c:forEach items="${news}" var="item">
								<tr>
									<td>${item.newsTitle }</td>
									<td>${item.adminName }</td>
									<td>${item.newsTime }</td>
									<td>
									<a href="${pageContext.request.contextPath }/showNews?newsID=${item.newsID}">详情</a>
									</td>
								</tr>
							</c:forEach>
								
							</tbody>
							</table>
						</div>
                    
				</div>
            </div>

		<!--//新闻-->
		<!--底部-->
	
		<jsp:include page="common_footer.jsp"></jsp:include>
	</body>

	<!--//底部-->


</html>
