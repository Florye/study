<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>My JSP 'test.jsp' starting page</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/goodstudy.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/layer.js"></script>
</head>

<body>
	<div>
		<%@include file="common.jsp" %>
		<div id="maincontent">
			<div id="container">
				<input type="hidden" id="msg" value="" />
				<div class="crumb">
					<span class="breadcrumb"> <a href="javascript:void(0);">后台</a>&gt;
						<a href="javascript:void(0);">用户管理</a>&gt; <a
						href="javascript:void(0);">角色修改</a>
					</span>
				</div>
				<div class="operatewin">
					<form class="editform" action="${pageContext.request.contextPath }/user/rolerightsave" method="post" style="width:460px;">
						<!-- 添加隐藏的文本框,避免文本框里输入回车自动提交表单的问题 -->
						<input style="display:none" />
						<div class="form-item">
							<div class="form-label">
								<label>角色编号:</label>
							</div>
							<div class="input-inline">
								<input type="text" class="txt" name="roleId" value="${requestScope.role.roleId }" readOnly/>
							</div>
						</div>
						<div class="form-item">
							<div class="form-label">
								<label>角色名称:</label>
							</div>
							<div class="input-inline">
								<input type="text" class="txt" name="roleName" value="${requestScope.role.roleName }"/>
							</div>
						</div>
						<div class="form-item">
							<div class="form-label">
								<label>当前权限:</label>
							</div>
							
						</div>
						<div >
							<div class="form-label">
								<label>教室管理:</label>
							</div>
							
							
							<input type="checkbox" class="parent" name="rights" value="10" 
							<c:if test="${fn:contains(requestScope.role.rightsList.toString(),'教室查看') }">checked</c:if>
							/>查看权限
							<input type="checkbox" class="child" name="rights" value="11" 
							<c:if test="${fn:contains(requestScope.role.rightsList.toString(),'教室修改') }">checked</c:if>
							/>修改权限
							<input type="checkbox" class="child" name="rights" value="12"  
							<c:if test="${fn:contains(requestScope.role.rightsList.toString(),'教室新增') }">checked</c:if>
							/>新增权限
							<input type="checkbox" class="child" name="rights" value="13"  
							<c:if test="${fn:contains(requestScope.role.rightsList.toString(),'教室恢复删除') }">checked</c:if>
							/>删除权限
						</div>
						<script type="text/javascript">
							$().ready(function () {
								$("[class='parent']").on("click",function(){
									
									$("[class='child'][value^="+$(this).val().substr(0,1)+"]").prop("checked",$(this).prop("checked"));
								});
								$("[class='child']").on("click",function(){
									var count=$("[class='child'][value^="+$(this).val().substr(0,1)+"]:checked").length;
									console.log(count);
									$("[class='parent'][value^="+$(this).val().substr(0,1)+"]").prop("checked",count>=0?true:false);
								});
							});
						
						</script>
						<div class="form-item">
							<div class="form-label">
								<input type="submit" value="保存" class="btn normal" />
								<input type="reset" value="重置" class="btn normal" />
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
