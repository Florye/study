<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

		<title>问题详情页面</title>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/common.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jqueryjson.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/layer.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
		<script src="${pageContext.request.contextPath}/highlight/highlight.pack.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/highlight/styles/default.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/daydayup.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/loginregister.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/questiondetail.css" />
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

		<body>

			<%@include file="questionhead.jsp" %>

			<div style="display:none">
				<form id="returnconditions" method="post">
					<input type="hidden" name="typeId" value="1"><br>
					<input type="hidden" name="startIndex" value="0"><br>
					<input type="hidden" name="orderType" value=""><br>
					<input type="hidden" name="queryQuestionTitle" value="">
					<input type="hidden" name="tagName" value="">
				</form>
			</div>
			<section id="main">
				<div id="content">
					<div class="toptitle">
						<nav class="questionnav">
							<a href="javascript:void(0)">${requestScope.questionAndAnswerList.questionType.questiontypeName }</a>

							<div class="return_button">
								<a href="javascript:void(0)">
									<img src="${pageContext.request.contextPath}/img/return.jpg">
								</a>
							</div>
						</nav>
						<div class="total_answer">
							${requestScope.questionAndAnswerList.questionAnswernum }
							<br>
							<span>回答</span>
						</div>
						<span class="question_title_link">问题内容</span>
					</div>
					<section class="content-container">
						<section class="questioncontainer">
							<div>
								<div class="vote_collect_wrapper">
									<div class="vote_collect">
										<a class="vote_up" id="questionvoteup" title="顶">
										</a>
										<span id="questionVoteCount31" class="vote_count">${requestScope.questionAndAnswerList.questionVotenum }</span>
										<a class="vote_down" id="questionvotedown" title="踩">
										</a>
									</div>
								</div>
								<script type="text/javascript">
									$().ready(function() {
										$("#questionvoteup").on("click",function () {
											var historyUserid=${requestScope.questionAndAnswerList.userInfo.userId };
											var historyQuestionid=${requestScope.questionAndAnswerList.questionId };
											console.log(historyUserid);
											location.replace("${pageContext.request.contextPath }/question/questionvote/"+historyUserid+"/"+historyQuestionid+"/顶");
										});
										$("#questionvotedown").on("click",function () {
											var historyUserid=${requestScope.questionAndAnswerList.userInfo.userId };
											var historyQuestionid=${requestScope.questionAndAnswerList.questionId };
											console.log(historyUserid);
											location.replace("${pageContext.request.contextPath }/question/questionvote/"+historyUserid+"/"+historyQuestionid+"/踩");
										});
									});	
								</script>
								<div class="question-content-detail">
									<section>
										<p>
											${requestScope.questionAndAnswerList.questionTitle }
										</p>
										<div>

											<p>${requestScope.questionAndAnswerList.questionContent }</p>

										</div>
									</section>
								</div>
							</div>
							<div class="userdetail">
								<div class="userinfo">
									<span class="uname">${requestScope.questionAndAnswerList.userInfo.userName }</span>
									<span class="edittime">
									<fmt:formatDate  value="${requestScope.questionAndAnswerList.questionCreatetime }" type="both" pattern="yyyy-MM-dd HH:mm:ss" />
								</span>
								</div>
								<div id="bigheader">
									<img src="${pageContext.request.contextPath}/img/header3.jpeg">
								</div>
							</div>
						</section>
						<div class="answer_content">
							<div class="answer_count">
								<span>总共有${requestScope.questionAndAnswerList.questionAnswernum }条回答</span>
								<span class="answer_order">
								<a class="selected" href="javascript:void(0)" id="byDate">显示最新答案</a>
								<a href="javascript:void(0)" id="byAnswerVote">按票数排序</a>
							</span>
							</div>
							<script>
								$(function() {
									$("#byDate").on("click",function () {
										location.replace("${pageContext.request.contextPath }/question/answerlistorderbydate?id=${requestScope.questionAndAnswerList.questionId }");
									});
									$("#byAnswerVote").on("click",function () {
										location.replace("${pageContext.request.contextPath }/question/answerlistorderbyvote?id=${requestScope.questionAndAnswerList.questionId }");
									});
								});
							</script>
							<div style="display:none">
								<form id="answerquery" method="post" action="/question/questiondetails/31/token">
									<input type="hidden" name="typeId" value="1"><br>
									<input type="hidden" name="questionStartIndex" value="0"><br>
									<input type="hidden" name="orderType" value=""><br>
									<input type="hidden" name="queryQuestionTitle" value="">
									<input type="hidden" name="tagName" value="">
									<input type="hidden" name="answerOrderType" value=""><br>
								</form>
							</div>
							<div>
								<section class="answer_list">
									<c:forEach items="${requestScope.questionAndAnswerList.answerList }" var="answer">
									<article class="answer_detail">
										<div class="vote_collect_wrapper">
											<div class="vote_collect">
												<a class="vote_up" id="${answer.answerId }" title="顶">
												</a>
												<span id="answerVoteCount82" class="vote_count">${answer.answerVote}</span>
												<a class="vote_down" id="${answer.answerId }" title="踩">
												</a>
											</div>
										</div>
										
										<div class="answer-content-detail">
											<section>
												<div>
													<p>${answer.answerContent }</p>
												</div>
											</section>
										</div>
										<div class="userdetail">
											<div class="userinfo">
												<span class="uname">${answer.userInfo.userName }</span>
												<span class="edittime">
												<fmt:formatDate  value="${answer.answerCreatetime }" type="both" pattern="yyyy-MM-dd HH:mm:ss" />
												</span>
											</div>
											<div id="smallheader">
												<img src="${pageContext.request.contextPath}/img/header3.jpeg">
											</div>
										</div>
									</article>
									</c:forEach>
									<script type="text/javascript">
										$().ready(function() {
											$(".answer_detail .vote_up").on("click",function () {
												var historyUserid=${requestScope.questionAndAnswerList.userInfo.userId };
												var answerid=parseInt($(this).attr("id"));
												alert(typeof answerid);
												location.replace("${pageContext.request.contextPath }/question/answervote/"+historyUserid+"/"+answerid+"/顶");
											});
											$("#questionvotedown").on("click",function () {
												var historyUserid=${requestScope.questionAndAnswerList.userInfo.userId };
												var historyQuestionid=${requestScope.questionAndAnswerList.questionId };
												location.replace("${pageContext.request.contextPath }/question/answervote/"+historyUserid+"/"+answerid+"/顶");
											});
										});	
									</script>
									<!-- 每个人最多回答6次问题,超过6次,提交回答按钮不可见 -->

									<form id="saveanswer" action="${pageContext.request.contextPath}/question/saveanswer" method="post">
										<!-- 使用隐藏域记住目前用户浏览的问题类型以及目前页数的起始位置 -->
										<input type="hidden" name="typeId" value="1"><br>
										<input type="hidden" name="questionStartIndex" value="0"><br>
										<input type="hidden" name="orderType" value=""><br>
										<input type="hidden" name="queryQuestionTitle" value="${requestScope.questionAndAnswerList.questionTitle }">
										<input type="hidden" name="tagName" value="">
										<input type="hidden" name="answerOrderType" value=""><br>
										<!-- 使用隐藏域记住令牌 -->
										<input type="hidden" name="token" value="b67d7c08-0634-4961-b86d-229e7999be90">
										<!-- 使用隐藏域记住题目的ID -->
										<input type="hidden" name="answerQuestionid" value="${requestScope.questionAndAnswerList.questionId }">
										<!-- 使用隐藏域记住提问此题目的用户ID -->
										<input type="hidden" name="userInfo.userId" value="${sessionScope.user.userId }">
										<textarea name="answerContent" id="content" style="visibility: hidden; display: none;"></textarea>
										<script type="text/javascript">
											CKEDITOR.replace("answerContent");
										</script>
										<div class="answersub">
											<input id="answersubbtn" type="button" value="提交回答">
										</div>
									</form>
									<script>
										$().ready(function () {
											$("#answersubbtn").on("click",function () {
												$("#saveanswer").submit();
											});
										});
									
									
									</script>

								</section>
							</div>
							<section style="text-align:right">
								<form action="/question/questiondetails/31/token" method="post" id="pageform">
									<input type="hidden" name="typeId" value="1"><br>
									<input type="hidden" name="questionStartIndex" value="0"><br>
									<input type="hidden" name="orderType" value=""><br>
									<input type="hidden" name="queryQuestionTitle" value="">
									<input type="hidden" name="tagName" value="">
									<input type="hidden" name="answerOrderType" value=""><br>

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
										<!-- endIndex:1 -->
										<!-- 输出前面的... -->

										<span class="page-curr">
						<em class="page-em" style="background-color:#1E9FFF;"></em>
						<em>1</em>
					</span>

										<!-- 输出后面的... -->

										<!-- 判断本页的起始位置如果为最后一页,直接显示下一页 -->

										<a href="javascript:void(0)">下一页</a>

										<!-- 判断本页的起始位置如果不为最后一页,显示可以单击下一页 -->

									</div>

								</form>
							</section>
						</div>
					</section>
				</div>

<%-- 				<%@include file="aside.jsp" %> --%>
			</section>

			<%@include file="loginregister.jsp" %>

		</body>

</html>