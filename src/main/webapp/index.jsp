<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'index.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

</head>

<body>
	<h2>用户列表</h2>
	<form action="userInfo/select.do" method="post">
		<p>
			用户账号<input type="text" name="userAccount" id="account"
				value="${tbUserinfo.userAccount}"> 部门：<select name="deptId"
				id="deptId">
				<option value="0" id="qxz">请选择</option>
				<c:forEach items="${listD}" var="dept">
					<option value="${dept.deptid}"
						<c:if test="${tbUserinfo.deptId == dept.deptid}">selected</c:if>>${dept.deptname}</option>
				</c:forEach>
			</select> <input type="submit" value="查询" /> <input type="button" value="清空"
				onclick="qk()" />
		</p>
		<table border="1" >
			<tr>
				<td>序号</td>
				<td>用户账号</td>
				<td>邮箱</td>
				<td>所属部门</td>
				<td>创建时间</td>
				<td>操作</td>
			</tr>
			<c:forEach items="${page.list}" var="userInfo" varStatus="status">
				<tr
					<c:if test="${status.index%2!=0}">style="background:blue"</c:if>>
					<td>${status.count}</td>
					<td>${userInfo.userAccount}</td>
					<td>${userInfo.email}</td>
					<td>${userInfo.tbDepartment.deptname}</td>
					<td>${userInfo.createDate}</td>
					<td><a
						href="userInfo/updateSelect.do?userId=${userInfo.userid}">修改</a><a
						onclick="del(${userInfo.userid})">删除</a></td>
				</tr>
			</c:forEach>
		</table>
		<p>
			共${page.pages}页 <a
				href="userInfo/select.do?userAccount=${tbUserinfo.userAccount}&deptId=${tbUserinfo.deptId}&num=1">首页</a>
			<c:if test="${page.hasPreviousPage }">
				<a
					href="userInfo/select.do?userAccount=${tbUserinfo.userAccount}&deptId=${tbUserinfo.deptId}&num=${page.pageNum-1}">上一页</a>
			</c:if>
			<c:if test="${page.hasNextPage }">
				<a
					href="userInfo/select.do?userAccount=${tbUserinfo.userAccount}&deptId=${tbUserinfo.deptId}&num=${page.pageNum+1}">下一页</a>
			</c:if>
			<a
				href="userInfo/select.do?userAccount=${tbUserinfo.userAccount}&deptId=${tbUserinfo.deptId}&num=${page.pages}">末页</a>
			第${page.pageNum}页
		</p>
	</form>
	<script type="text/javascript" src="jquery-2.1.1.min.js"></script>
	<script type="text/javascript">
		function qk() {
			$("#account").val("");
			$("#qxz").attr("selected", "selected");
		}
		function del(id) {
			if (confirm("确认删除吗？") == true) {
				$.post("userInfo/delete.do?userId=" + id, null, function(num) {
					if (num > 0) {
						alert("删除成功!");
						location = "userInfo/select.do";
					}
				});
			}
		}
	</script>
</body>
</html>