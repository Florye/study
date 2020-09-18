<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
  <head>
	<meta charset="utf-8">
    <title>My JSP 'test.jsp' starting page</title>
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
					  <a href="javascript:void(0);">基础资料</a>&gt;
					  <a href="javascript:void(0);">班级管理</a>
					</span>
					<span class="operatebar">
						<input type="button" class="btn normal" value="新增" id="new"/>
					</span>
				</div>
				<div id="tabledata">
					<table class="table">
						<tr>
							<th>序号</th>
							<th>名称</th>
							<th>教师</th>
							<th>管理</th>
							<th>教室</th>
							<th>状态</th>
							<th>操作</th>
							<th>操作</th>
						</tr>
						<c:forEach items="${requestScope.clsList }" var="cls" varStatus="status">
							<tr id="${cls.clsId}">
								<td>${status.count}</td>
								<td>${cls.clsName}</td>
								<td>${cls.teacher.teacherNickname}</td>
								<td>${cls.manager.teacherNickname}</td>
								<td>${cls.classroom.clsroomName}</td>
								<td>
									<c:if test="${cls.clsStatus eq 1}">有效</c:if>
									<c:if test="${cls.clsStatus eq 0}">无效</c:if>
								</td>
								<td ><a class="modify" href="javascript:void(0);">修改</a></td>
								<td >
									<c:if test="${cls.clsStatus eq 1}">
										<a class="del" href="javascript:void(0);">删除</a>
									</c:if>
									<c:if test="${cls.clsStatus eq 0}">
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
					title:"班级新增",
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
				url:"${pageContext.request.contextPath}/basic/editcls",
				type:"get",
				data:"id="+id,
				dataType:"json",
				success:function (data) {
					layer.open({
						type:1,
						title:"教室修改",
						content:$("#sublayer"),
						closeBtn:1,
						success:function(layero,index) {
							var teacherId=data.teacher.teacherId;
							var managerId=data.manager.teacherId;
							var clsroomId=data.classroom.clsroomId;
							$("input[name='clsId']").val(data.clsId);
							$("input[name='clsName']").val(data.clsName);
							$("option[class="+"teacher"+teacherId+"]").prop("selected",true);
							$("option[class="+"manager"+managerId+"]").prop("selected",true);
							$("option[class="+"classroom"+clsroomId+"]").prop("selected",true);
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
			var jsonObject={clsId:id,clsStatus:status};
			$.ajax({
				url:"${pageContext.request.contextPath}/basic/deletecls",
				type:"post",
				data:JSON.stringify(jsonObject),
				dataType:"json",
				contentType:"application/json;charset=utf-8",//设置格式,发送信息至服务器时内容编码类型
				success:function(data) {
					if (data) {
						if (status === 1) {
							$(tr).find("td").eq(5).html("有效");
							$(tr).find("td").eq(7).find("a").html("删除");
						} else {
							$(tr).find("td").eq(5).html("无效");
							$(tr).find("td").eq(7).find("a").html("恢复");
						}
					}
				},
				error:function() {
					layer.msg("操作失败");
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
					url:"${pageContext.request.contextPath}/basic/savecls",
    				type:"post",
    				data:$("#layerForm").serialize(),
    				dataType:"json",
					success:function(data) {
						var lastTr=$(".table").find("tr").last();
						var lastId=$(lastTr).attr("id");
						if (data.clsId>lastId) {//新增
							window.location.reload();
						} else {
							$("tr[id="+data.clsId+"]").find("td").eq(1).html(data.clsName);
							$("#"+data.clsId).find("td").eq(2).html(data.teacher.teacherNickname);
							$("#"+data.clsId).find("td").eq(3).html(data.manager.teacherNickname);
							$("#"+data.clsId).find("td").eq(4).html(data.classroom.clsroomName);
						}
						layer.closeAll();
					},
					error:function() {
						layer.msg("操作失败");
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
    			<input type="hidden" name="clsId" value="">
    			<div class="form-item">
    				<div class="form-label">
    					<label>班级名称</label>
    				</div>
    				<div class="input-inline">
    					<input type="text" name="clsName" class="txt">
    				</div>
    			</div>
    			<div class="form-item">
    				<div class="form-label">
    					<label>班级教师</label>
    				</div>
    				<div class="input-inline">
    					<select name="teacher.teacherId">
    						<c:forEach items="${requestScope.teacherList}" var="teacher">
    							<option class="teacher${teacher.teacherId}" value="${teacher.teacherId}">${teacher.teacherNickname}</option>
    						</c:forEach>
    					</select>
    				</div>
    			</div>
    			<div class="form-item">
    				<div class="form-label">
    					<label>班主任</label>
    				</div>
    				<div class="input-inline">
    					<select name="manager.teacherId">
    						<c:forEach items="${requestScope.managerList}" var="manager">
    							<option class="manager${manager.teacherId}" value="${manager.teacherId}">${manager.teacherNickname}</option>
    						</c:forEach>
    					</select>
    				</div>
    			</div>
    			<div class="form-item">
    				<div class="form-label">
    					<label>班级教室</label>
    				</div>
    				<div class="input-inline">
    					<select name="classroom.clsroomId">
    						<c:forEach items="${requestScope.classroomList}" var="classroom">
    							<option class="classroom${classroom.clsroomId}" value="${classroom.clsroomId}">${classroom.clsroomName}</option>
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

