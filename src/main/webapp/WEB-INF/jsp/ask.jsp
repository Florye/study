<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title></title>
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/layer.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/ckeditor/ckeditor.js"></script>
		<script src="${pageContext.request.contextPath }/highlight/highlight.pack.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath }/highlight/styles/default.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath }/css/daydayup.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath }/css/ask.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath }/css/loginregister.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath }/css/common.css" />

		<body>
			<%@include file="questionhead.jsp" %>

			<section id="main">
				<div id="content">
					<div class="toptitle">
						<nav class="questionnav">
							<a href="${pageContext.request.contextPath }/question/questionlist/1">首页</a>
							&gt;
							<a href="${pageContext.request.contextPath }/question/putquestion?typeId=${requestScope.typeId}">提问</a>
						</nav>
						<div class="return_button">
							<a href="/question/questionlist?typeId=1"><img src="${pageContext.request.contextPath }/img/return.jpg"></a>
						</div>
					</div>
					<form id="savequestion" method="post" action="${pageContext.request.contextPath }/question/savequestion">
						<!-- 表单中单个文本框按回车会提交表单,添加1个解决此问题 -->
						<input style="display:none">
						<input type="hidden" name="token" value="25da31e7-0a7c-43e8-a104-1cc03eddabf2">
						<div class="form-item">
							<div class="form-label">
								<label>标题:</label>
							</div>
							<div class="form-input-inline">
								<input type="text" class="ask" name="questionTitle" value="" placeholder="你有什么技术问题，请在此输入">
							</div>
						</div>
						<div class="form-item">
							<div class="form-label">
								<label>分类:</label>
							</div>
							<div class="form-input-inline">
								<span class="choice">
								<input type="radio" id="rdo1" name="questionType.questiontypeId" value="1" checked="checked">
								<label for="rdo1">技术问答</label>
								</span>
								<span class="choice">
								<input type="radio" id="rdo2" name="questionType.questiontypeId" value="2">
								<label for="rdo2">面试题</label>
								</span>
								<span class="choice">
								<input type="radio" id="rdo3" name="questionType.questiontypeId" value="3">
								<label for="rdo3">作业问答</label>
								</span>
							</div>
						</div>
						<div style="margin-top: 50px;">
							<textarea name="questionContent" id="content" style="visibility: hidden; display: none;">
						
					</textarea>
							<script type="text/javascript">
								CKEDITOR.replace("questionContent");
							</script>
						</div>
						<div class="answersub">
							<input id="answersubbtn" type="submit" value="提交回答">
						</div>
					</form>
				</div>

				<%@include file="aside.jsp" %>
			</section>

			<%@include file="loginregister.jsp" %>

		</body>

</html>