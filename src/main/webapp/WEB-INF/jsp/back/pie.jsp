<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>pie</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/goodstudy.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/layer.js"></script>
<script src="https://cdn.staticfile.org/echarts/4.3.0/echarts.min.js"></script>
<script>
	
</script>
</head>
<body>
	<div>
		<%@include file="common.jsp"%>
		<div id="maincontent">
			<div id="container">
				<div class="crumb">
					<span class="breadcrumb"> <a href="javascript:void(0);">后台</a>&gt;
						<a href="javascript:void(0);">统计管理</a>&gt; <a
						href="javascript:void(0);">图表管理</a>
					</span>
				</div>
				<div id="tabledata">
					<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
					<div id="main" style="width: 500px; height: 500px;"></div>
					<div>
						<script type="text/javascript">
									$.ajax({
										url : "${pageContext.request.contextPath}/charts/pie",
										type : "get",
										dataType : "json",
										success : function(data) {
											console.log(data);
											// 基于准备好的dom，初始化echarts实例
											var myChart = echarts.init(document
													.getElementById('main'));
											myChart.setOption(data);
										}
									});
						</script>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

