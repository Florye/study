<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
  <head>
	<meta charset="utf-8">
    <title>My JSP 'test.jsp' starting page</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/goodstudy.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/layer.js"></script>
  <style type="text/css">
  	.table td {
	word-wrap: break-word;
    text-overflow: ellipsis;
    white-space: nowrap;
    overflow: hidden;
	
	}
	.table td:hover {
	            white-space: normal;
	            overflow: auto;
	}
  
  </style>
  </head>
  <body>
  		<div>
		<%@include file="common.jsp" %>
		<div id="maincontent">
			<div id="container">
				<div class="crumb">
					<span class="breadcrumb">
					  <a href="javascript:void(0);">后台</a>&gt;
					  <a href="javascript:void(0);">基础资料</a>&gt;
					  <a href="javascript:void(0);">用户管理</a>
					</span>
					<span class="operatebar">
						<input type="button" class="btn normal" value="新增" id="new"/>
					</span>
				</div>
				<div id="tabledata">
					<table class="table">
						<tr>
							<th>序号</th>
							<th>姓名</th>
							<th>账号</th>
							<th>电话</th>
							<th>状态</th>
							<th>备注</th>
							<th>修改时间</th>
							<th>头像</th>
							<th>班级</th>
							<th>操作</th>
							<th>操作</th>
						</tr>
						<c:forEach items="${requestScope.userList }" var="user" varStatus="status">
							<tr id="${user.userId}">
								<td>${status.count}</td>
								<td>${user.userName}</td>
								<td>${user.userLogin}</td>
								<td>${user.userTelephone}</td>
								<td>
									<c:if test="${user.userStatus eq 1}">有效</c:if>
									<c:if test="${user.userStatus eq 0}">无效</c:if>
								</td>
								<td>${user.userAdditional}</td>
								<td><fmt:formatDate  value="${user.userModified}" type="both" pattern="yyyy-MM-dd HH:mm:ss" /></td>
								<td><img alt="null" src="${pageContext.request.contextPath}/img/${user.userHead}"></td>
								<td>${user.cls.clsName}</td>
								<td ><a class="modify" href="javascript:void(0);">修改</a></td>
								<td >
									<c:if test="${user.userStatus eq 1}">
										<a class="del" href="javascript:void(0);">删除</a>
									</c:if>
									<c:if test="${user.userStatus eq 0}">
										<a class="del" href="javascript:void(0);">恢复</a>
									</c:if>
								</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<div class="rightmsg">
					${requestScope.msg}
				</div>
			</div>
		</div>
	</div>
	<!-- 新增弹出开始 -->
	<script type="text/javascript">
		$().ready(function () {
			$("#new").on("click", function() {
				layer.open({
					type:1,
					title:"用户新增",
					content:$("#sublayer"),
					closeBtn:1,
				});
			});
		});
	</script>
	<!-- 新增弹出结束 -->
	<!-- 修改开始 -->
	<script type="text/javascript">
	$().ready( function () {
		$(".table").on("click",".modify",function() {
			var tr=$(this).parent().parent();
			var id=$(tr).attr("id");
			$.ajax({
				url:"${pageContext.request.contextPath}/basic/edituser",
				type:"get",
				data:"id="+id,
				dataType:"json",
				success:function (data) {
					layer.open({
						type:1,
						title:"用户修改",
						content:$("#sublayer"),
						closeBtn:1,
						success:function(layero,index) {
							$("input[name='userId']").val(data.userId);
							$("input[name='userName']").val(data.userName);
							$("input[name='userLogin']").val(data.userLogin);
							$("input[name='userTelephone']").val(data.userTelephone);
							$("input[name='userAdditional']").val(data.userAdditional);
							$("input[name='userModified']").val(data.userModified);
							$("option[class="+"cls"+data.cls.clsId+"]").prop("selected",true);
						}
					});
				}
			});
		});
	
	});
	</script>
	<!-- 修改结束 -->
	<!-- 删除开始 -->
	<script type="text/javascript">
	$().ready( function () {
		$(".table").on("click",".del",function() {
			var tr=$(this).parent().parent();
			var id=$(tr).attr("id");
			var status=$(this).html()=="删除"?0:1;//修改后的数据
			var jsonObject={userId:id,userStatus:status};
			$.ajax({
				url:"${pageContext.request.contextPath}/basic/deleteuser",
				type:"post",
				data:JSON.stringify(jsonObject),
				dataType:"json",
				contentType:"application/json;charset=utf-8",//设置格式,发送信息至服务器时内容编码类型
				success:function(data) {
					if (data) {
						if (status === 1) {
							$(tr).find("td").eq(4).html("有效");
							$(tr).find("td").eq(10).find("a").html("删除");
						} else {
							$(tr).find("td").eq(4).html("无效");
							$(tr).find("td").eq(10).find("a").html("恢复");
						}
					}
				},
				error:function() {
					layer.msg("操作失败");
					layer.closeAll();
				}
			});
			
		});
	
	});
	</script>
	<!-- 删除结束 -->
	<!-- 弹出框保存开始 -->
	<script type="text/javascript">
		$().ready(function () {
			$("#saveBtn").on("click",function () {
				$.ajax({
					url:"${pageContext.request.contextPath}/basic/saveuser",
    				type:"post",
    				cache:false,
    				data:new FormData($("#layerForm")[0]),
    				 // 告诉jQuery不要去处理发送的数据
                    processData : false,
                    // 告诉jQuery不要去设置Content-Type请求头
                    contentType : false,
    				dataType:"json",
					success:function(data) { //使用刷新页面
						window.location.reload();
						layer.closeAll();
					},
					error:function() {
						layer.msg("操作失败");
						layer.closeAll();
					}
				});
			});
		});
	</script>
	<!-- 弹出框保存结束 -->
    <!-- 弹出层开始 -->
    <div id="sublayer">
    	<div class="operatewin">
    		<form class="editform" action="" id="layerForm" enctype="multipart/form-data">
    			<input type="hidden" name="userId" value="">
    			<div class="form-item">
    				<div class="form-label">
    					<label>姓名</label>
    				</div>
    				<div class="input-inline">
    					<input type="text" name="userName" class="txt">
    				</div>
    			</div>
    			<div class="form-item">
    				<div class="form-label">
    					<label>账号</label>
    				</div>
    				<div class="input-inline">
    					<input type="text" name="userLogin" class="txt">
    				</div>
    			</div>
    			<div class="form-item">
    				<div class="form-label">
    					<label>密码</label>
    				</div>
    				<div class="input-inline">
    					<input type="text" name="userPasswd" class="txt">
    				</div>
    			</div>
    			<div class="form-item">
    				<div class="form-label">
    					<label>电话</label>
    				</div>
    				<div class="input-inline">
    					<input type="text" name="userTelephone" class="txt">
    				</div>
    			</div>
    			<div class="form-item">
    				<div class="form-label">
    					<label>备注</label>
    				</div>
    				<div class="input-inline">
    					<input type="text" name="userAdditional" class="txt">
    				</div>
    			</div>
    			<div class="form-item">
    				<div class="form-label">
    					<label>头像</label>
    				</div>
    				<div class="input-inline">
    					<input type="file" name="phone" class="txt">
    				</div>
    			</div>
    			<div class="form-item">
    				<div class="form-label">
    					<label>修改时间</label>
    				</div>
    				<div class="input-inline">
    					<input type="text" name="userModified" class="txt"/>
    				</div>
    			</div>
    			<div class="form-item">
    				<div class="form-label">
    					<label>班级</label>
    				</div>
    				<div class="input-inline">
    					<select name="cls.clsId">
    						<c:forEach items="${requestScope.clsList}" var="cls">
    							<option class="cls${cls.clsId}" value="${cls.clsId}">${cls.clsName}</option>
    						</c:forEach>
    					</select>
    				</div>
    			</div>
    			<div class="form-item" align="center">
    				<div class="input-inline">
    					<input type="button" value="保存" class="btn" id="saveBtn"/>
    				</div>
    			</div>
    		</form>
    	</div>
    </div>
     <!-- 弹出层结束 -->
  </body>
</html>

