<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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

<title>My JSP 'updateUserInfo.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>

<body>
	<h2>用户信息修改</h2>
	<form action="userInfo/update.do" method="post" id="upd">
		<table >
			<tr>
				<td>用户账号：</td>
				<td><input type="text" readonly="readonly" name="userAccount"
					onblur="findUserAccount();" id="Account"
					value="${userinfo.userAccount}"></td>
			</tr>
			<tr>
				<td>邮箱：</td>
				<td><input type="text" name="email" id="email"
					value="${userinfo.email}" onblur="checkedEmail()"/><input type="hidden"
					name="userid" value="${userinfo.userid}"/></td>
			</tr>
			<tr>
				<td>原密码：</td>
				<td><input type="password" id="jpassword"
					value="${userinfo.password}" readonly="readonly"></td>
			</tr>
			<tr>
				<td>新密码：</td>
				<td><input type="password" name="password" id="password"
					onblur="checkedPwd();"></td>
			</tr>
			<tr>
				<td>所属部门：</td>
				<td><select name="deptId">
						<c:forEach items="${listD}" var="dept">
							<option value="${dept.deptid}"
								<c:if test="${userinfo.deptId == dept.deptid}">selected="selected"</c:if>>${dept.deptname}</option>
						</c:forEach>
				</select></td>
			</tr>
		</table>
		<input type="submit" value="保存" /> <input type="button" value="返回"
			onclick="javascript:history.back(-1)">
	</form>
	<script type="text/javascript" src="jquery-2.1.1.min.js"></script>
	<script type="text/javascript">
		function checkedPwd() {
			var jpassword = $("#jpassword").val();
			var password = $("#password").val();
			var rpassword = new RegExp("^[a-zA-Z0-9]{6,20}$");
			if (password == '') {
				alert("新密码不能为空!");
				return false;
			} else if (rpassword.test(password) == false) {
				alert("新密码格式错误！（至少为6位英文或数字）！");
				return false;
			} else if (password == jpassword) {
				alert("新密码不能跟原密码一样!");
				return false;
			}
			return true;
		}
		 function checkedEmail() {
			var email = $("#email").val();
			var remail = new RegExp("^[a-zA-Z0-9_]+@[a-zA-Z0-9]+\.com$");
			if (email == '') {
				alert("邮箱不能为空！");
				return false;
			} else if (remail.test(email) == false) {
				alert("邮箱格式不正确，请重新输入！");
				return false;
			}  
			$("#Pemail").html("");
			return true;
		}
		$("#upd").submit(function() {
			if (checkedEmail() == true && checkedPwd() == true) {
				return true;
			}
			return false;
		});
	</script>
</body>
</html>