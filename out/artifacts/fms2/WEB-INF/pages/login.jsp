<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>用户登录</title>
		<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css">
		<script language="JavaScript" type="text/JavaScript" src="${pageContext.request.contextPath}/js/common.js"></script>
		<script src="${pageContext.request.contextPath}/js/jquery-3.0.0.min.js"></script>

		<style type="text/css">
			<!-- body {
				background-color: #c4c3c3;
			}
			
			-->
		</style>
		<script type="text/javascript">
			<c:if test="${flag==2}">alert('用户名或密码错误!')</c:if>
			function userlogin() {
				var name = document.getElementsByName("name")[0].value;
				var pwd = document.getElementsByName("pwd")[0].value;
				//姓名不能为空
				if(name == "") {
					alert("请输入用户名");
					return;
				}
				//密码不能为空
				if(pwd == "") {
					alert("密码不能为空,请输入密码");
					return;
				}
	
				document.getElementsByName("frmAction")[0].submit();
			}
		</script>
	</head>

	<body onLoad="MM_preloadImages('images/login_10.gif','images/login_09.gif')">
		<form action="${pageContext.request.contextPath}/login" name="frmAction" method="post">
			<table width="502" border="0" align="center" cellpadding="0" cellspacing="0" class="mar001">
				<tr>
					<td background="images/login_02.gif">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="2%" align="left"><img src="images/login_03.gif" width="12" height="30" ></td>
								<td width="49%" align="left" class="text001">用户登录</td>
								<td width="49%" align="right"><img src="images/login_01.gif" width="11" height="30"></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td height="247" valign="top">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr valign="top">
								<td width="35%" height="232"><img src="images/login_05.gif" width="178" height="269"></td>
								<td width="65%" align="right" background="images/login_06.gif" class="bg01"><img src="images/login_04.gif" width="268" height="47" class="mar002">
									<table width="90%" height="125" border="0" cellpadding="0" cellspacing="0" class="mar003">
										<tr>
											<td width="32%" height="38" align="right" class="text002">用户名</td>
											<td width="68%" align="left" valign="middle"><input name="name" type="text" class="inp001" value="${name}"></td>
										</tr>
										<tr>
											<td height="37" align="right" class="text002">密码</td>
											<td align="left" valign="middle"><input name="pwd" type="password" class="inp001" value="${pwd}"></td>
										</tr>
										<tr>
											<td height="50">&nbsp;</td>
											<td align="left" valign="bottom">
												<a href="#" onclick="userlogin()" name="button1" onMouseOver="MM_swapImage('Image1','','images/login_10.gif',1)" onMouseOut="MM_swapImgRestore()" onMouseDown="MM_swapImage('Image1','','images/login_12.gif',1)" onMouseUp="MM_swapImage('Image1','','images/login_10.gif',1)">
													<img src="images/login_08.gif" name="Image1" width="75" height="24" border="0" id="Image1"></a> &nbsp;
												<a href="javascript:window.close();" onMouseOver="MM_swapImage('Image2','','images/login_09.gif',1)" onMouseOut="MM_swapImgRestore()" onMouseDown="MM_swapImage('Image2','','images/login_11.gif',1)" onMouseUp="MM_swapImage('Image2','','images/login_09.gif',1)">
													<img src="images/login_07.gif" name="Image2" width="75" height="24" border="0" id="Image2"></a>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>


		<%-- ************************************ --%>
		<c:if test="${true}">
			<script type="text/javascript">
                console.log(111)
                document.getElementsByName("name")[0].value = "zhang3"
                document.getElementsByName("pwd")[0].value = "1"
                document.getElementsByName("frmAction")[0].submit()
			</script>
		</c:if>
		<%-- ************************************ --%>

	</body>

</html>