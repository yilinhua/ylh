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
		<h2>注册</h2>
		<form action="userInfo/zhuce.do" id="add" method="post"
			enctype="multipart/form-data">
			<div>
				<img alt="" src="" id="imgFile"> <input type="file"
					name="file" id="image"><span id="Pimage"></span>
			</div>
			<table>
				<tr>
					<td>* 新账户</td>
					<td><input type="text" name="userAccount"
						onblur="findUserAccount();" id="account" /> <span id="Pname"></span>
					</td>
				</tr>
				<tr>
					<td>* 新密码</td>
					<td><input type="password" name="password" id="password"
						onblur="checkedPwd();" /> <span id="Ppassword"></span></td>
				</tr>
				<tr>
					<td>* 确认密码</td>
					<td><input type="password" name="xpassword" id="xpassword"
						onblur="checkedXPwd();" /> <span id="Pxpassword"></span></td>
				</tr>
				<tr>
					<td>* 邮箱</td>
					<td><input type="text" name="email" id="email"
						onblur="checkedEmail();" /> <span id="Pemail"></span></td>
				</tr>
				<tr>
					<td>* 部门</td>
					<td><select name="deptId" id="deptId">
							<c:forEach items="${listD}" var="dept">
								<option value="${dept.deptid}">${dept.deptname}</option>
							</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td><input type="submit" value="确认" /></td>
					<td><input type="button" value="取消"
						onclick="javascript:history.back(-1)" /></td>
				</tr>
			</table>
		</form>
	</div>
	<script type="text/javascript" src="jquery-2.1.1.min.js"></script>
	<script type="text/javascript">
		$('#image').on('change', function() {
			$('#imgFile').attr('style', "width:100px;height=100px;");
			$('#imgFile').attr('src', window.URL.createObjectURL(this.files[0]));
		});
	
		function findImg() {
			var img = $("#image").val();
			if (img == "") {
				$("#Pimage").html("请选择图片!");
				return false;
			} else {
				$("#Pimage").html("");
				return true;
			}
		}
		var falg = false;
		function findUserAccount() {
			var userAccount = $("#account").val();
			if (userAccount == '') {
				$("#Pname").html("账户不能为空！");
				falg = false;
			} else {
				$.post(
					"userInfo/findUserAccount.do?userAccount="
					+ userAccount, null, function(data) {
						if (data != -1) {
							$("#Pname").html("账户已存在");
							falg = false;
						} else {
							$("#Pname").html("");
							falg = true;
						}
					});
			}
			return falg;
		}
	
		function checkedPwd() {
			var password = $("#password").val();
			var rpassword = new RegExp("^[a-zA-Z0-9]{6,20}$");
			if (password == '') {
				$("#Ppassword").html("密码不能为空！");
				return false;
			} else if (rpassword.test(password) == false) {
				$("#Ppassword").html("格式错误！（至少为6位英文或数字）！");
				return false;
			}
			$("#Ppassword").html("");
			return true;
		}
	
		function checkedXPwd() {
			var password = $("#password").val();
			var xpassword = $("#xpassword").val();
			if (xpassword == '') {
				$("#Pxpassword").html("请确认密码！");
				return false;
			} else if (password != xpassword) {
				$("#Pxpassword").html("你两次输入的密码不一致，请重新输入！");
				return false;
			}
			$("#Pxpassword").html("");
			return true;
		}
	
		function checkedEmail() {
			var email = $("#email").val();
			var remail = new RegExp("^[a-zA-Z0-9_]+@[a-zA-Z0-9]+(\.com)$");
			if (email == '') {
				$("#Pemail").html("邮箱不能为空！");
				return false;
			} else if (remail.test(email) == false) {
				$("#Pemail").html("邮箱格式不正确，请重新输入！");
				return false;
			}
			$("#Pemail").html("");
			return true;
		}
	
		$("#add").submit(
			function() {
				if (findImg() == true && findUserAccount() == true && checkedPwd() == true
					&& checkedXPwd() == true && checkedEmail() == true
				) {
					return true;
				}
				return false;
			});
	</script>
</body>
</html>
