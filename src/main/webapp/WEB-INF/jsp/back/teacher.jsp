<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
  <head>
	<meta charset="utf-8">
    <title>员工管理</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/goodstudy.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/layer.js"></script>
  </head>
  <body>
  		<div>
		<%@include file="common.jsp" %>
		<div id="maincontent">
			<div id="container">
				<div class="crumb">
					<span class="breadcrumb">
					  <a href="javascript:void(0);">后台</a>&gt;
					  <a href="javascript:void(0);">用户管理</a>&gt;
					  <a href="javascript:void(0);">教师管理</a>
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
							<th>职位</th>
							<th>状态</th>
							<th>操作</th>
							<th>操作</th>
						</tr>
						<c:forEach items="${requestScope.teacherList }" var="teacher" varStatus="status">
							<tr id="${teacher.teacherId}">
								<td>${status.count}</td>
								<td>${teacher.teacherNickname}</td>
								<td>${teacher.teacherName}</td>
								<td>${teacher.role.roleName}</td>
								<td>
									<c:if test="${teacher.teacherStatus eq 1}">有效</c:if>
									<c:if test="${teacher.teacherStatus eq 0}">无效</c:if>
								</td>
								<td ><a class="modify" href="javascript:void(0);">修改</a></td>
								<td >
									<c:if test="${teacher.teacherStatus eq 1}">
										<a class="del" href="javascript:void(0);">删除</a>
									</c:if>
									<c:if test="${teacher.teacherStatus eq 0}">
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
					title:"教师新增",
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
				url:"${pageContext.request.contextPath}/user/editteacher",
				type:"get",
				data:"id="+id,
				dataType:"json",
				success:function (data) {
					layer.open({
						type:1,
						title:"教师修改",
						content:$("#sublayer"),
						closeBtn:1,
						success:function(layero,index) {
							$("input[name='teacherId']").val(data.teacherId);
							$("input[name='teacherName']").val(data.teacherName);
							$("input[name='teacherNickname']").val(data.teacherNickname);
							$("option[class="+"role"+data.role.roleId+"]").prop("selected",true);
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
			var jsonObject={teacherId:id,teacherStatus:status};
			$.ajax({
				url:"${pageContext.request.contextPath}/user/deleteteacher",
				type:"post",
				data:JSON.stringify(jsonObject),
				dataType:"json",
				contentType:"application/json;charset=utf-8",//设置格式,发送信息至服务器时内容编码类型
				success:function(data) {
					if (data) {
						if (status === 1) {
							$(tr).find("td").eq(4).html("有效");
							$(tr).find("td").eq(6).find("a").html("删除");
						} else {
							$(tr).find("td").eq(4).html("无效");
							$(tr).find("td").eq(6).find("a").html("恢复");
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
					url:"${pageContext.request.contextPath}/user/saveteacher",
    				type:"post",
    				data:$("#layerForm").serialize(),
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
    		<form class="editform" action="" id="layerForm">
    			<input type="hidden" name="teacherId" value="">
    			<div class="form-item">
    				<div class="form-label">
    					<label>姓名</label>
    				</div>
    				<div class="input-inline">
    					<input type="text" name="teacherNickname" class="txt">
    				</div>
    			</div>
    			<div class="form-item">
    				<div class="form-label">
    					<label>账号</label>
    				</div>
    				<div class="input-inline">
    					<input type="text" name="teacherName" class="txt">
    				</div>
    			</div>
    			<div class="form-item">
    				<div class="form-label">
    					<label>密码</label>
    				</div>
    				<div class="input-inline">
    					<input type="text" name="teacherPwd" class="txt">
    				</div>
    			</div>
    			<div class="form-item">
    				<div class="form-label">
    					<label>职位</label>
    				</div>
    				<div class="input-inline">
    					<select name="role.roleId">
    						<c:forEach items="${requestScope.roleList}" var="role">
    							<option class="role${role.roleId}" value="${role.roleId}">${role.roleName}</option>
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

