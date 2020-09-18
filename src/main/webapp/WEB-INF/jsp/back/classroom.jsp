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
					  <a href="javascript:void(0);">教室管理</a>
					</span>
					<c:if test="${fn:contains(sessionScope.rightsList.toString(),'教室新增') }">
					<span class="operatebar">
						<input type="button" class="btn normal" value="新增" id="new"/>
					</span>
					</c:if>
				</div>
				<div id="tabledata">
					<table class="table">
						<tr>
							<th>序号</th>
							<th>名称</th>
							<th>状态</th>
							<c:if test="${fn:contains(sessionScope.rightsList.toString(),'教室修改') }">
							<th>操作</th>
							</c:if>
							<c:if test="${fn:contains(sessionScope.rightsList.toString(),'教室恢复删除') }">
							<th>操作</th>
							</c:if>
						</tr>
						<c:forEach items="${requestScope.classroomList }" var="classroom" varStatus="status">
							<tr id="${classroom.clsroomId }"> <!-- 可以使用el表达式结合foreach动态生成id -->
								<td>${status.count+pageInfo.startIndex }</td>
								<td id="className${classroom.clsroomId }">${classroom.clsroomName }</td>
								<td>
									<c:if test="${classroom.clsroomStatus eq 1}">有效</c:if>
									<c:if test="${classroom.clsroomStatus eq 0}">无效</c:if>
								</td>
								<c:if test="${fn:contains(sessionScope.rightsList.toString(),'教室修改') }">
								<td ><a class="modify" href="javascript:void(0);">修改</a></td>
								</c:if>
								<c:if test="${fn:contains(sessionScope.rightsList.toString(),'教室恢复删除') }">
								<td >
									<c:if test="${classroom.clsroomStatus eq 1}">
										<a class="del" href="javascript:void(0);">删除</a>
									</c:if>
									<c:if test="${classroom.clsroomStatus eq 0}">
										<a class="del" href="javascript:void(0);">恢复</a>
									</c:if>
								</td>
								</c:if>
							</tr>
						</c:forEach>
					</table>
				</div>
				<div class="rightmsg">
					${requestScope.msg}
				</div>
				<div style="float:right">
					<form action="${pageContext.request.contextPath }/basic/classroommain" method="post" id="pageform">
						<%@include file="/WEB-INF/jsp/page/pagingToolBarDoPost.jsp" %>
					</form>
				</div>
			</div>
		</div>
	</div>
	<c:if test="${fn:contains(sessionScope.rightsList.toString(),'教室新增') }">
	<!-- 新增弹出开始 -->
	<script type="text/javascript">
		$().ready(function () {
			$("#new").on("click", function() {
				layer.open({
					type:1,
					title:"教室新增",
					content:$("#sublayer"),
					closeBtn:1,
				});
			});
		});
	</script>
	<!-- 新增弹出结束 -->
	</c:if>
	<c:if test="${fn:contains(sessionScope.rightsList.toString(),'教室修改') }">
	<!-- 修改开始 -->
	<script>
		$().ready(function(){
			$(".table").on("click",".modify",function () {
				var tr=$(this).parent().parent();
				var id=$(tr).attr("id");
				$.ajax({
					url:"${pageContext.request.contextPath}/basic/editclassroom",
					type:"get",
					data:"id="+id,
					dataType:"json",
					success:function (data) {
						layer.open({
							type:1,
							title:"教室修改",
							content:$("#sublayer"),
							closeBtn:1,
							success: function(layero,index) {
								// 用返回的json数据渲染弹出层
								$(layero).find("input[name='clsroomName']").val(data.clsroomName);
								$(layero).find("input[name='clsroomId']").val(data.clsroomId);
							}
						});
					}
				});
			});
		});
	</script>
	<!-- 修改结束 -->
	</c:if>
	<c:if test="${fn:contains(sessionScope.rightsList.toString(),'教室恢复删除') }">
	<!-- 删除开始 -->
	<script type="text/javascript">
	$().ready(function(){
		$(".table").on("click",".del",function (){ //删除
			console.log("ok");
			console.log(this);
			var tr=$(this).parent().parent(); //取出行
			var id=$(tr).attr("id");// 取出所在行的id属性
			var status=$(this).html()=="删除"?0:1;
			var jsonData={"clsroomId":id,"clsroomStatus":status};
			$.ajax({
				url:"${pageContext.request.contextPath}/basic/deleteclassroom",
				type:"post",
				data:JSON.stringify(jsonData),
				dataType:"json",
				contentType:"application/json;charset=utf-8",//设置格式,发送信息至服务器时内容编码类型
				async:true,
				success:function (data) {
					if (data) {// 操作成功
						if (status === 1) {
							$(tr).find("td").eq(2).html("有效");
							$(tr).find("td").eq(4).find("a").html("删除");
						} else {
							$(tr).find("td").eq(2).html("无效");
							$(tr).find("td").eq(4).find("a").html("恢复");
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
	</c:if>
    <!-- 弹出层开始 -->
    <div id="sublayer">
    	<div class="operatewin">
    		<form class="editform" action="" id="layerForm">
    			<input type="hidden" name="clsroomId"/>
    			<div class="form-item">
    				<div class="form-label">
    					<label>教室名称</label>
    				</div>
    				<div class="input-inline">
    					<input type="text" name="clsroomName" class="txt">
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
     <!-- 弹出层保存开始 -->
    <script>
    	$().ready(function () {
    		$("#saveBtn").on("click",function () {
    			$.ajax({
    				url:"${pageContext.request.contextPath}/basic/saveclassroom",
    				type:"post",
    				data:$("#layerForm").serialize(),
    				dataType:"json",
    				success:function(data) {
    					var lasttr=$("table[class='table']").find("tr").last();// 取最后一行
    					var lastId=lasttr.attr("id");
    					console.log(lastId);
    					console.log(data.clsroomId);
    					if (data.clsroomId>lastId) { //新增
    						var newTr=document.createElement("tr");
    						$(newTr).attr("id",data.clsroomId+"");
    						$("table[class='table']").append($(newTr));
    						
    						var newTd1=document.createElement("td");
    						var count=parseInt($(lasttr).find("td").eq(0).html())+1;
    						$(newTd1).html(count);
    						$(newTr).append($(newTd1));
    						var newTd2=document.createElement("td");
    						$(newTd2).attr("id","className"+data.clsroomId);
    						$(newTd2).html(data.clsroomName+"");
    						$(newTr).append(newTd2);
    						var newTd3=document.createElement("td");
    						var clsroomStatus=data.clsroomStatus==1?"有效":"无效";
    						$(newTd3).html(clsroomStatus);
    						$(newTr).append(newTd3);
    						
    						if ($(lasttr).find("td").eq(3).html()=="修改") {
	    						var newTd4=document.createElement("td");
	    						// 转义
	    						$(newTd4).append($("<a class=\"modify\" href=\"javascript:void(0);\">修改</a>"));
	    						$(newTr).append(newTd4);
    						}
    						var operat=data.clsroomStatus==0?"恢复":"删除";
    						if ($(lasttr).find("td").eq(4).html()==operat ||$(lasttr).find("td").eq(4).html()==operat) {
	    						var newTd5=document.createElement("td");
	    						$(newTd5).append($("<a class=\"del\" href=\"javascript:void(0);\">"+operat+"</a>"));
	    						$(newTr).append(newTd5);
	    						
    						}
    					} else { //修改
    						//$("#className"+data.clsroomId).html(data.clsroomName);
    						$("#"+data.clsroomId).find("td").eq(1).html(data.clsroomName);
    					}
    					layer.closeAll();
    				},
    				error:function(data) {
    					layer.msg("操作失败");
    				}
    			});
    		});
    	});
    </script>
    <!-- 弹出层保存结束 -->
  </body>
</html>

