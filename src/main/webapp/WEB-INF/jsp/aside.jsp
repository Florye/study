<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<aside>
	<div style="display: none">
		<%--下面的表单在单击查询时提交--%>
		<form id="tagcondition" method="post"
			action="${pageContext.request.contextPath}/question/questionlist">
			<input type="text" name="typeId" value="${requestScope.typeId}" /><br />
			<input type="text" name="tagName" />
		</form>
		<script>
			$().ready(
					function() {
						$(".tag").bind(
								"click",
								function() {
									$("#tagcondition input[name='tagName']")
											.val($(this).html());
									$("#tagcondition").submit();
								});
					});
		</script>
	</div>
</aside>