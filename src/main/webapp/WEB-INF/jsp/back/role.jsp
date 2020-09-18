<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
  <head>
	<meta charset="utf-8">
    <title>My JSP 'test.jsp' starting page</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/goodstudy.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/layer.js"></script>
	<script>
		$().ready(function(){
			$("tr:gt(0)").on({
				"mouseover":function() {
					$(this).css("backgroud-color","#E9ECEF");
					$(this).css("cursor","pointer");
				},
				"mouseout":function() {
					$(this).css("backgroud-color","#FFFFFF");
					$(this).css("cursor","default");
				},
				"dblclick":function() {
					var id=$(this).attr("id");
					location.replace("${pageContext.request.contextPath}/user/rolerightmodify/"+id);
				}
			});
		});
	</script>
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
					  <a href="javascript:void(0);">角色管理</a>
					</span>
					<span class="operatebar">
						<input type="button" class="btn normal" value="新增" id="new"/>
					</span>
				</div>
				<div id="tabledata">
					<table class="table">
						<tr>
							<th>序号</th>
							<th>角色名称</th>
							<th>操作</th>
							<th>操作</th>
						</tr>
						<c:forEach items="${requestScope.roleList }" var="role" varStatus="status"> 
							<tr id="${role.roleId}">
								<td>${status.count }</td>
								<td>${role.roleName }</td>
								<td><a class="modify" href="javascript:void(0);">修改</a></td>
								<td><a class="del" href="javascript:void(0);">删除</a></td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<div class="rightmsg">
					双击记录可进入角色权限修改界面
					${requestScope.msg}	
				</div>
			</div>
		</div>
	</div>
  </body>
	<!-- 修改开始  -->
	<script type="text/javascript">
	$().ready(function () {
		$(".table").on("click",".modify",function () {
			var id=$(this).parent().parent().attr("id");
			$.ajax({
				url:"${pageContext.request.contextPath}/user/editrole",
				type:"get",
				data:"id="+id,
				dataType:"json",
				success:function(data){
					layer.open({
						type:1,
						title:"角色修改",
						content:$("#sublayer"),
						closeBtn:1,
						success:function (layero,index) {
							$("input[name='roleId']").val(data.roleId);
							$("input[name='roleName']").val(data.roleName);
						}
					});
				},
				error:function() {
					layer.msg("操作失败");
					layer.closeAll();
				}
			});
		});
	});
    </script>
	<!--  修改结束 -->
	<!-- 删除开始  -->
	<script type="text/javascript">
	$().ready(function () {
		$(".table").on("click",".del",function () {
			var tr=$(this).parent().parent();
			var id=$(tr).attr("id");
			$.ajax({
				url:"${pageContext.request.contextPath}/user/deleterole",
				type:"get",
				data:"id="+id,
				dataType:"json",
				success:function(data){
					$(tr).remove();
				},
				error:function() {
					layer.msg("操作失败");
				}
			});
		});
	});
    </script>
	<!--  删除结束 -->
	<!-- 新增开始  -->
	<script type="text/javascript">
	$().ready(function () {
		$("#new").on("click",function(){
			layer.open({
				type:1,
				title:"角色新增",
				content:$("#sublayer"),
				closeBtn:1,
			});
		});
	});
    </script>
	<!--  新增结束 -->
	<!-- 弹出层保存开始 -->
	<script type="text/javascript">
	$().ready(function () {
		$("#saveBtn").on("click",function () {
			$.ajax({
				url:"${pageContext.request.contextPath}/user/saverole",
				type:"post",
				data:$("#layerForm").serialize(),
				dataType:"json",
				success:function(data){
					var lasttr=$("table[class='table']").find("tr").last();// 取最后一行
					var lastId=$(lasttr).attr("id");
					var newCount=parseInt($(lasttr).find("td").eq(0).html())+1;
					if(data.roleId>lastId) {//新增
						var str="<tr id="+data.roleId+"><td>"+newCount+"</td><td>"+data.roleName+
							"</td><td><a class='modify' href='javascript:void(0);'>修改</a></td>"+
							"<td><a class='del' href='javascript:void(0);'>删除</a></td></tr>";
						$(str).appendTo($(".table"));
					} else {
						$("tr[id="+data.roleId+"]").find("td").eq(1).html(data.roleName);
					}
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
	<!-- 弹出层保存结束 -->
	 <!-- 弹出层开始 -->
    <div id="sublayer">
    	<div class="operatewin">
    		<form class="editform" action="" id="layerForm">
    			<input type="hidden" name="roleId" value="">
    			<div class="form-item">
    				<div class="form-label">
    					<label>名称</label>
    				</div>
    				<div class="input-inline">
    					<input type="text" name="roleName" class="txt">
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
</html>

