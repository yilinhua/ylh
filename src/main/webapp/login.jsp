<%@ page language="java" import="java.util.*" pageEncoding="Utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>My JSP 'login.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
</head>
<body>
	<div>
		<h2>登录</h2>
		<form action="userInfo/login.do" id="login">
			<div id="userImg"></div>
			<table>
				<tr>
					<td>* 账户</td>
					<td><input type="text" name="userAccount"
						onblur="findUserAccount()" id="account" /> <span id="Pname"></span>
					</td>
				</tr>
				<tr>
					<td>* 密码</td>
					<td><input type="password" name="password" id="password"
						onblur="checkedPwd()" /> <span id="Ppassword"></span></td>
				</tr>
				<tr>
					<td><input type="submit" value="登录" /></td>
					<td><a href="userInfo/selectDept.do"><input type="button"
							value="注册" /> </a></td>
				</tr>
			</table>

		</form>
	</div>
</body>
<script type="text/javascript" src="jquery-2.1.1.min.js"></script>
<script type="text/javascript">
	var falg = false;
	function findUserAccount() {
		var userAccount = $("#account").val();
		if (userAccount == "") {
			$("#Pname").html("账户不能为空！");
			falg = false;
		} else {
			$
				.post(
					"userInfo/findUserAccount.do",
					"userAccount=" + userAccount,
					function(data) {
						if (data != -1) {
							$("#userImg")
								.html(
									"<img src='image/" + data.image + "' id='img' style='width: 150px;height: 150px;'>");
							falg = true;
						} else {
							$("#userImg").html("");
							$("#Pname").html("账户不存在");
							falg = false;
						}
					}, "json");
		}
		$("#Pname").html("");
		return falg;
	}

	 function checkedPwd() {
		var password = $("#password").val();
		if (password == "") {
			$("#Ppassword").html("密码不能为空！");
			return false;
		} 
		$("#Ppassword").html("");
		return true;
	}
	$("#login").submit(function() {
		if (findUserAccount() == true && checkedPwd() == true) {
			return true;
		}
		return false;
	});
</script>
</html>
