<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
  <head>
	<meta charset="utf-8">
    <title>questionmain</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/goodstudy.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/layer.js"></script>
	<script>
		$().ready(function() {
			$("tr:gt(0)").on({
				"mouseover":function(){
					$(this).css("background-color","#E9ECEF")
					$(this).css("cursor","pointer");
				},
				"mouseout":function(){
					$(this).css("background-color","#FFFFFF")
					$(this).css("cursor","default");
				},
				"dblclick":function(){//双击事件
					var id=$(this).attr("id");//取得单击行Id
					console.log(id);
// 					location.replace("${pageContext.request.contextPath}/studyweb/rolerightmodify/"+id);//传送ID
				},
			})
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
					  <a href="javascript:void(0);">问题管理</a>&gt;
					  <a href="javascript:void(0);">提问管理</a>
					</span>				
				<div id="tabledata" style="overflow-y:auto;height:400px;width:1100px;">
					<table class="table" >
						<tr>
							<th>问题序号</th>
							<th>问题标题</th>
							<th>问题类型</th>
							<th>提问者</th>
							<th>提问时间</th>							
							<th>操作</th>
						</tr>
						<c:forEach items="${requestScope.qlist}" var="question" varStatus="status">
							<tr id="${question.questionId}">
								<td>${status.count }</td>
								<td>${question.questionTitle}</td>
								<td>${question.questionType.questiontypeName}</td>
								<td>${question.userInfo.userName}</td>
								<td><fmt:formatDate  value="${question.questionCreatetime}" type="both" pattern="yyyy-MM-dd HH:mm:ss" /></td>												
								<td><a class="del" href="javascript:void(0);">删除</a></td>
							</tr>
						</c:forEach>				
					</table>
				</div>				
				<script type="text/javascript">
					$().ready(function() {//单击删除
						$(".del").on("click",function(){
							var id=$(this).parent().parent().attr("id");//取得tr行Id							
							location.replace("${pageContext.request.contextPath}/question/delquestion/"+id);			
						})
					})				
				</script>				
				
				<div class="rightmsg">
					
				</div>
				<div class="errormsg">
					
				</div>
			</div>
		</div>
	</div>
    
  </body>
</html>

