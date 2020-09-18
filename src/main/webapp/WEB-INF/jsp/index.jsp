<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title></title>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jqueryjson.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/layer.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/common.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/daydayup.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/loginregister.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css" />
		<script>
			$(function() {
				$("#menu a").each(function(index, ele) {
					$(ele).bind("mouseover", function() {
						$("#menu a[class='menu-item']").removeClass(); //已经有menu-item的移除
						$(ele).toggleClass("menu-item");
					});
				});
				
			});
		</script>
	</head>
	<body>
		<%@include file="questionhead.jsp" %>
		<div style="display:none">
			<form id="returnconditions" method="post">
				<input type="hidden" name="typeId" value="1"><br>
				<input type="hidden" name="questionStartIndex" value="0"><br>
				<input type="hidden" name="orderType" value=""><br>
				<input type="hidden" name="queryQuestionTitle" value="">
				<input type="hidden" name="tagName" value="">
			</form>
		</div>
		<section id="main">
			<section id="content">
				<div id="headlist">
					<div id="menu">
						<a href="javascript:void(0)" class="menu-item">技术问答</a>
						<a href="javascript:void(0)">面试题</a>
						<a href="javascript:void(0)">作业问答</a>
					</div>
					<script type="text/javascript">
					$().ready(function () {
						$("#menu a").eq(0).on("click",function() {
							console.log(this);
							location.replace("${pageContext.request.contextPath }/question/questionlist/1");
						});
						$("#menu a").eq(1).on("click",function() {
							console.log(this);
							location.replace("${pageContext.request.contextPath }/question/questionlist/2");
						});
						$("#menu a").eq(2).on("click",function() {
							console.log(this);
							location.replace("${pageContext.request.contextPath }/question/questionlist/3");
						});
					});
				</script>
					<div style="display:none">

						<form id="orderconditions" method="post">
							<input type="text" name="typeId" value="1"><br>
							<input type="text" name="questionStartIndex" value="0"><br>
							<input type="text" name="orderType"><br>
						</form>
					</div>
					<div id="order">
						<span>排列:</span>
						<a href="javascript:void(0)" id="byDate"><b>最新提问</b></a>
						<a href="javascript:void(0)" id="byAnswerCount">尚未回答</a>
						<a href="javascript:void(0)" id="byViewCount">热门</a>
					</div>
				</div>
				<script>
					$(function() {
						$("#byDate").on("click",function () {
							location.replace("${pageContext.request.contextPath }/question/questionlist/${requestScope.typeId}");
						});
						$("#byAnswerCount").on("click",function () {
							location.replace("${pageContext.request.contextPath }/question/questionanswernumlist?typeId=${requestScope.typeId}");
						});
						$("#byViewCount").on("click",function () {
							location.replace("${pageContext.request.contextPath }/question/questionviewnumlist?typeId=${requestScope.typeId}");
						});
					});
				</script>
				<div>
					${requestScope.msg}
				</div>
				<c:forEach items="${questionList }" var="question">
				 <section class="box">
					<div class="box-f1">
						<ul>
							<li>
								${question.questionVotenum }
								<span>投票</span>
							</li>
							<li style="border:1px solid #4eaa4c; color: #4eaa4c;">
								${question.questionAnswernum }
								<span>回答</span>
							</li>
							<li>
								${question.questionViewnum }
								<span>浏览</span>
							</li>
						</ul>
					</div>
					<div class="box-f2">
						<div class="question_title">
							<a href="javascript:void(0)" id="${question.questionId }">${question.questionTitle }</a>
						</div>
						<div class="question_time">
							<span>
								发布人:${question.userInfo.userName }@<fmt:formatDate  value="${question.questionCreatetime}" type="both" pattern="yyyy-MM-dd HH:mm:ss" />
							</span>

							<span class="tag">others</span>

						</div>
					</div>
					<div class="box-f3">
						<img src="${pageContext.request.contextPath}/img/header3.jpeg">

					</div>

				</section>
				</c:forEach>
				<!-- 进入问题详情页面开始-->
				<script type="text/javascript">
					$().ready(function () {
						$(".question_title a").on("click",function() {
							console.log(this);
							var id=$(this).attr("id");
							console.log(id);
							location.replace("${pageContext.request.contextPath }/question/answermain?id="+id);
						});
					});
				</script>
				<!-- 进入问题详情页面结束-->
				<!-- 删除某个问题脚本开始 -->

				<!-- 删除某个问题脚本结束 -->
				<section style="text-align:right">
					<form action="/question/questionlist" method="post" id="pageform">
						<input type="hidden" name="typeId" value="1">
						<input type="hidden" name="orderType" value="">
						<input type="hidden" name="queryQuestionTitle" value="">
						<input type="hidden" name="tagName" value="">

						<style>
							.page {
								display: inline-block;
								vertical-align: middle;
								margin: 10px 0;
								background-color: #fff;
								font-size: 12px;
							}
							
							.page a {
								text-decoration: none
							}
							
							.page a,
							.page span {
								display: inline-block;
								vertical-align: middle;
								padding: 0 15px;
								border: 1px solid #e2e2e2;
								height: 28px;
								line-height: 28px;
								margin: 0 -1px -1px 0;
								color: #333;
								font-size: 12px;
							}
							
							.page span {
								color: #999;
								font-weight: 700
							}
							
							.page .page-curr {
								position: relative;
							}
							
							.page .page-curr em {
								position: relative;
								color: #fff;
								font-weight: 400
							}
							
							.page em {
								font-style: normal
							}
							
							.page .page-curr .page-em {
								position: absolute;
								left: -1px;
								top: -1px;
								padding: 1px;
								width: 100%;
								height: 100%;
								background-color: #009688
							}
							
							.page-em {
								border-radius: 2px
							}
						</style>

						<!-- 进入页面时,此隐藏域保存的是当前页的起始位置,提交页面时, 此隐藏域保存的是下一页数据的起始位置-->
						<input type="hidden" id="beginIndex" name="startIndex" value="0">
						<div class="page">
							<!-- 判断本页的起始位置如果为0,，即为第1页,直接显示上一页 -->

							<a href="javascript:void(0)">上一页</a>

							<!-- 判断本页的起始位置如果大于0,，即不为第1页,显示可以单击上一页 -->

							<!-- 计算本次显示页码的起始位置,例如：1-5;6-9 -->

							<!-- 是否在结尾输出... -->

							<!-- 判断是否超出最大页码 -->

							<!-- beginPage:1 -->
							<!-- beginIndex:1 -->
							<!-- endIndex:4 -->
							<!-- 输出前面的... -->

							<span class="page-curr">
						<em class="page-em" style="background-color:#1E9FFF;"></em>
						<em>1</em>
					</span>

							<a href="javascript:void(0)" onclick="javascript:changeQuery(8);">
								2
							</a>

							<a href="javascript:void(0)" onclick="javascript:changeQuery(16);">
								3
							</a>

							<a href="javascript:void(0)" onclick="javascript:changeQuery(24);">
								4
							</a>

							<!-- 输出后面的... -->

							<!-- 判断本页的起始位置如果为最后一页,直接显示下一页 -->

							<!-- 判断本页的起始位置如果不为最后一页,显示可以单击下一页 -->

							<a href="javascript:void(0)" onclick="javascript:changeQuery(8);">下一页</a>

						</div>

					</form>
				</section>
			</section>

<%-- 			<%@include file="aside.jsp" %> --%>
		</section>
		
		<%@include file="loginregister.jsp" %>

	</body>

</html>