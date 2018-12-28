<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>家庭财务管理系统</title>
		<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css">
        <script src="${pageContext.request.contextPath}/js/jquery-3.0.0.min.js"></script>
		<script type="text/javascript">
			function toLogin(){
				location.href='${pageContext.request.contextPath}/tologin';
			}
		</script>
	</head>


	<body topmargin="0" leftmargin="0">
		<table width="1004" height="595" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td height="81"><img src="${pageContext.request.contextPath}/images/index_01.gif" width="1004" height="81"></td>
			</tr>
			<tr>
				<td height="512" valign="top" bgcolor="#D0CCCC">
					<table width="100%" height="513" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td width="20%" height="272" align="center" valign="top">
								<table width="108" border="0" cellpadding="0" cellspacing="0" class="mar004">
									<tr>
										<td height="41" align="left" valign="bottom" background="images/index_02.gif">
											<div class="mar006"><span class="text003">用户名：</span><span class="text004"> ${loginUser.realname} </span></div>
										</td>
									</tr>
									<tr>
										<td height="433" align="center" valign="top" background="${pageContext.request.contextPath}/images/index_03.gif" class="bg02">
											<table width="152" border="0" cellpadding="0" cellspacing="0" class="mar005">
												<tr>
													<td height="41" align="left" background="${pageContext.request.contextPath}/images/index_09.gif" id="td1">
														<a href="${pageContext.request.contextPath}/account/list" target="mainframe"  id="a1"
                                                           onClick="clickToChangeMenuStyle(this)"
                                                           class="tex001"
                                                        >
															<div class="mar007">账簿管理</div>
														</a>
													</td>
												</tr>
												<tr>
													<td height="20">&nbsp;</td>
												</tr>
												<tr>
													<td height="41" align="left" background="${pageContext.request.contextPath}/images/index_06.gif" id="td2">
														<a href="${pageContext.request.contextPath}/user/list" target="mainframe" id="a2"
                                                           onClick="clickToChangeMenuStyle(this)"
                                                           class="tex002"
                                                        >
															<div class="mar008">家庭成员管理</div>
														</a>
													</td>
												</tr>
												<tr>
													<td height="20">&nbsp;</td>
												</tr>
												<tr>
													<td height="41" background="${pageContext.request.contextPath}/images/index_06.gif" align="left" id="td3">
														<a href="${pageContext.request.contextPath}/item/list" target="mainframe"  id="a3"
                                                           class="tex002"
                                                           onClick="clickToChangeMenuStyle(this)"
                                                        >
															<div class="mar008">收支项目管理</div>
														</a>
													</td>
												</tr>
												<tr>
													<td height="20">&nbsp;</td>
												</tr>
												<tr>
													<td height="41" background="${pageContext.request.contextPath}/images/index_06.gif" align="left" id="td4">
														<a href="${pageContext.request.contextPath}/report/bbtj" target="mainframe" id="a4"
                                                           class="tex002"
                                                           onClick="clickToChangeMenuStyle(this)"
                                                        >
															<div class="mar007">报表统计</div>
														</a>
													</td>
												</tr>
												<tr>
													<td height="20">&nbsp;</td>
												</tr>
												<tr>
													<td height="41" background="${pageContext.request.contextPath}/images/index_06.gif" align="left">
														<a href="#" class="tex002">
															<div class="mar007" onclick="toLogin()">退出系统</div>
														</a>
													</td>
												</tr>
											</table>
											<script>
                                                function clickToChangeMenuStyle(obj){
                                                    $('a[class="tex001"]').parent().attr("background","${pageContext.request.contextPath}/images/index_06.gif")
                                                    $(obj).parent().attr("background","${pageContext.request.contextPath}/images/index_09.gif")
                                                    $('a[class="tex001"]').removeClass("tex001").addClass("tex002")
                                                    $(obj).removeClass("tex002").addClass("tex001")
                                                }

												function init1() {
													for(var i = 1; i <= 4; i++) {
														eval("document.all.td" + i).background = "${pageContext.request.contextPath}/images/index_06.gif";
													}
												}

												function change1(obj) {
													init1();
													if(typeof(obj) != "undefined") {
														obj.background = "${pageContext.request.contextPath}/images/index_09.gif";

													}
												}

												function init2() {
													for(var i = 1; i <= 4; i++) {
														eval("document.all.a" + i).className = "tex002";

													}
												}

												function change2(obj) {
													init2();
													if(typeof(obj) != "undefined") {
														obj.className = "tex001";
													}
												}
											</script>

										</td>
									</tr>
									<tr>
										<td valign="top"><img src="images/index_08.gif" width="180" height="41"></td>
									</tr>
								</table>
							</td>
							<td width="80%" valign="top">
								<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="mar004">
									<tr>
										<td><img src="images/index_04.gif" width="21" height="19"></td>
									</tr>
									<tr>
										<td height="501" valign="top" align="right"><iframe name="mainframe" src="${pageContext.request.contextPath}/account/list" width="98%" height="500px" frameborder="0" scrolling="no"></iframe></td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>

	</body>

</html>