<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% request.setAttribute("sdf",new SimpleDateFormat("yyyy-MM-dd")); %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<title>帐薄管理--添加</title>
		<script src="${pageContext.request.contextPath}/js/jquery-3.0.0.min.js"></script>
		<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css">
		<script src='${pageContext.request.contextPath}/common/date/date.js'></script>
		<script language="JavaScript" type="text/JavaScript" src="${pageContext.request.contextPath}/js/common.js"></script>
		<script type="text/javascript">
			function addProject() {
				document.getElementsByName("frmAction")[0].submit();
			}
			$().ready(function() {
				//在paymentType的下拉框注册onchange事件
				$("select[name=paymentType]").change(function() {
					//选中的是第几个类型：收入，支出
					//发送HTTP的请求，获得对应类型的子项目
					//更新到子项目的下拉框中
					if($("select[name=paymentType]").prop('value') == '1') {
						$("select[name=father] option").remove();
						$("select[name=son] option").remove();
						$("select[name=father]").append("<option>" + '日常收支' + "</option>");
						$("select[name=son]").append("<option>" + '发工资' + "</option>");
					} else {
						$.ajax({
							type: "POST",
							url: "${pageContext.request.contextPath}/TypeServlet",
							data: "type=" + this.selectedIndex,
							success: function(arr) {
								//更新到子项目下拉框中
								//清空原有的选项
								$("select[name=father] option").remove();
								$("select[name=son] option").remove();
								//增加新的选项
								$.each(arr, function(i, ele) {
									$("select[name=father]").append("<option>" + ele + "</option>");
								});
							},
							dataType: "json"

						});
					}
				});
				//
				//在paymentType的下拉框注册onchange事件
				$("select[name=father]").change(function() {
					//选中的是第几个类型：收入，支出
					//发送HTTP的请求，获得对应类型的子项目
					//更新到子项目的下拉框中
						$.ajax({
							type: "POST",
							url: "${pageContext.request.contextPath}/DetailServlet",
							data: "id=" + $("select[name=father]").prop('value'),
							success: function(arr) {
								//更新到子项目下拉框中
								//清空原有的选项
								$("select[name=son] option").remove();
								//增加新的选项
								$.each(arr, function(i, ele) {
									$("select[name=son]").append("<option>" + ele + "</option>");
								});
							},
							dataType: "json"
						});
				});
				//
			});

			
		</script>
	</head>

	<body leftmargin="0" topmargin="0" onLoad="MM_preloadImages('${pageContext.request.contextPath}/images/login_10.gif','${pageContext.request.contextPath}/images/login_12.gif','${pageContext.request.contextPath}/images/login_09.gif','${pageContext.request.contextPath}/images/login_11.gif')">
		<form name="frmAction" method="post" action="${pageContext.request.contextPath}/AccountAddServlet">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="32" align="left" valign="top" class="text006">
						<table width="98%" border="0" cellspacing="0" cellpadding="0">
							<tr valign="top">
								<td>【 账簿管理 】</td>
								<td align="right">&nbsp;</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td height="215" valign="top">
						<table width="98%" border="0" cellspacing="0" cellpadding="0">
							<tr align="left" class="bg03">
								<td width="100%" height="29">
                                    <c:if test="${account.id == 0}"> <span class="text001">&nbsp;&nbsp;新增收支记录</span></c:if>
                                    <c:if test="${account.id != 0 && op == 'v'}"> <span class="text001">&nbsp;&nbsp;查询收支记录</span></c:if>
                                    <c:if test="${account.id != 0 && op != 'v'}"> <span class="text001">&nbsp;&nbsp;修改收支记录</span></c:if>
                                </td>
                            </tr>

						</table>
						<table width="98%" border="0" cellpadding="0" cellspacing="0" class="text008">
							<tr align="center">
								<td width="12%" height="35" align="right">收支类型</td>
								<td width="88%" align="left">
									<select class="inp001" name="item.type">
										<option value="1"  <c:if test="${account.item.type == 1}">selected="selected"</c:if> >收入</option>
										<option value="2"  <c:if test="${account.item.type == 1}">selected="selected"</c:if> >支出</option>
									</select>
								</td>
							</tr>
							<tr align="center" class="bg04">
								<td width="12%" height="35" align="right">父项目</td>
								<td width="88%" align="left">
									<select class="inp001" name="item.p_Item.id">
                                        <option>请选择收支类型</option>

									</select>
								</td>
							</tr>
							<tr align="center">
								<td width="12%" height="35" align="right">子项目</td>
								<td width="88%" align="left">
									<select class="inp001" name="item.id">
                                        <option>请选择父项目</option>

									</select>
								</td>
							</tr>
							<tr align="center" class="bg04">
								<td height="35" align="right">收支日期</td>
								<td align="left">
								<input id="date" name="date" type="text" class="inp001" value='${sdf.format(account.date)}' readonly="readonly"  onclick='changeDate()' ></td>
							</tr>
							<tr align="center">
								<td height="35" align="right">收支家庭成员</td>
								<td align="left">
									<select class="inp001" name="familyMember">

									</select>
								</td>
							</tr>
							<tr align="center" class="bg04">
								<td height="35" align="right">收支金额</td>
								<td align="left"><input name="paymentAmount" type="text" class="inp001" value="${account.amount}"></td>
							</tr>
							<tr align="center">
								<td height="168" align="right" valign="top">
									<div class="mar009">备注</div>
								</td>
								<td align="left" valign="top"><textarea name="remark" class="inp002" value="${account.remark}"></textarea>
								</td>
							</tr>
						</table>
						<table width="98%" border="0" cellpadding="0" cellspacing="0" class="bor001">
							<tr>
								<td width="11%" height="40" align="center">
									<a onclick="addProject()" target="mainframe" onMouseOver="MM_swapImage('Image1','','${pageContext.request.contextPath}/images/index_12_1.gif',1)" onMouseOut="MM_swapImgRestore()" onMouseDown="MM_swapImage('Image1','','${pageContext.request.contextPath}/images/index_12_2.gif',1)" onMouseUp="MM_swapImage('Image1','','${pageContext.request.contextPath}/images/index_12_1.gif',1)">
									<img src="${pageContext.request.contextPath}/images/index_12_0.gif" name="Image1" width="75" height="24" border="0" id="Image1">
									</a>
                                </td>
                                <td width="11%" height="40" align="center">
									<a href="${pageContext.request.contextPath}/AccountListServlet" target="mainframe" onMouseOver="MM_swapImage('Image2','','${pageContext.request.contextPath}/images/login_09.gif',1)" onMouseOut="MM_swapImgRestore()" onMouseDown="MM_swapImage('Image2','','${pageContext.request.contextPath}/images/login_11.gif',1)" onMouseUp="MM_swapImage('Image2','','${pageContext.request.contextPath}/images/login_09.gif',1)">
									<img src="${pageContext.request.contextPath}/images/login_07.gif" name="Image2" width="75" height="24" border="0" id="Image2">
									</a>
								</td>
								<td width="78%" align="right">&nbsp; </td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
        <script>
            function changeDate(){
                document.getElementById("date").value=selectDate()
            }
        </script>
	</body>

</html>