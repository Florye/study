<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>后台管理登录页面</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.js"></script>
</head>

<body>
	<table align="center" width="645px" border="0">
    	<tr>
        	<td height="60px"></td>
        </tr>
    	<tr>
        	<td background="${pageContext.request.contextPath}/img/loginbackground.png" width="345px" height="346px">
            	<table border="0" width="100%" height="100%">
                	<tr>
                    	<td width="300px"></td>
                        <td width="345px">
                        	<form action="${pageContext.request.contextPath}/user/login" method="post" id="f1">
                            	<table width="70%" height="30%" border="0">
                                	<tr><td colspan="2" height="30px" style="font-family:'楷体_GB2312';font-size:20px; font-weight:bold;">欢迎进入后台管理系统</td>
                                    </tr>
                                    <tr>
                                    	<td style="font-size:12px">用户名:</td>
                                        <td>
                                        	<input type="text" name="teacherName" value=""/>
                                        </td>
                                    </tr>
                                    <tr>
                                    	<td style="font-size:12px">密码:</td>
                                        <td>
                                        	<input type="password" name="teacherPwd" value=""/>
                                        </td>
                                    </tr>
                                    <tr>
                                    	<td colspan="2" align="center">
                                        	<input type="image" src="${pageContext.request.contextPath}/img/b_login.gif" name="login"/>
	                                        	
                                        	<img src="${pageContext.request.contextPath}/img/b_clean.gif" name="clean"/>
	                                        	<script type="text/javascript">
		                                        		$().ready(function () {
		                                        			$("input[name='login']").on("click",function () {
		                                        				$("#f1").submit();
		                                        			});
		                                        			$("input[name='clean']").on("click",function () {
		                                        				$("input[name='teacherName']").val("");
		                                        				$("input[name='teacherPwd']").val("");
		                                        			});
		                                        		});
	                                        	</script>
                                        </td>
                                    </tr>
                                    <tr>
                                    	<td colspan="2" id="info">
                                        	<font color="red" size="2">
                                        		 ${requestScope.msg}
                                        	</font>
                                        </td>
                                    </tr>
                                </table>
                            </form>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>
</html>

