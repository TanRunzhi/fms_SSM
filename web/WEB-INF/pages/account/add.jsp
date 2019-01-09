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
		<c:import url="../recourse.jsp" />
		<script type="text/javascript">
			function addProject() {
				document.getElementsByName("frmAction")[0].submit();
			}
			$().ready(function() {
				//在paymentType的下拉框注册onchange事件
				$("#type").change(function() {
					//选中的是第几个类型：收入，支出
					//发送HTTP的请求，获得对应类型的子项目
					//更新到子项目的下拉框中
                    $("select[id=type] option[value='']").remove();
					// if($("select[id=type]").prop('value') == '1') {
					// 	$("select[id=pid] option").remove();
					// 	$("select[id=sid] option").remove();
					// 	$("select[id=pid]").append("<option>" + '日常收支' + "</option>");
					// 	$("select[id=sid]").append("<option>" + '发工资' + "</option>");
					// } else {
						$.ajax({
							type: "POST",
							url: "getFatherAccountByType",
							data: "type=" + $("#type").val(),
							success: function(arr) {
								//更新到子项目下拉框中
								//清空原有的选项
								$("#pid option").remove();
								$("#sid option").remove();
								//增加新的选项
								$.each(arr, function(i, ele) {
									$("#pid").append("<option value='"+ele.id+"'>" + ele.name + "</option>");
								});
                                changeSItems();
							},
							dataType: "json"
						});
					// }
				});
				//
				//在paymentType的下拉框注册onchange事件
				$("select[id=pid]").change(function() {
					//选中的是第几个类型：收入，支出
					//发送HTTP的请求，获得对应类型的子项目
					//更新到子项目的下拉框中
                    changeSItems();
				});
				//
			});

			function changeSItems(){
                $.ajax({
                    type: "POST",
                    url: "getSonAccountByFatherAccount",
                    data: "id=" + $("select[id=pid]").prop('value'),
                    success: function(arr) {
                        //更新到子项目下拉框中
                        //清空原有的选项
                        $("select[id=sid] option").remove();
                        //增加新的选项
                        $.each(arr, function(i, ele) {
                            $("#sid").append("<option value='"+ele.id+"'>" + ele.name + "</option>");
                        });
                    },
                    dataType: "json"
                });
            };
		</script>
	</head>

	<body leftmargin="0" topmargin="0" onLoad="MM_preloadImages('${pageContext.request.contextPath}/images/login_10.gif','${pageContext.request.contextPath}/images/login_12.gif','${pageContext.request.contextPath}/images/login_09.gif','${pageContext.request.contextPath}/images/login_11.gif')">
		<form name="frmAction" method="post" action="save">
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
									<select class="inp001" name="item.type" id="type">
										<c:if test="${account.item.type != 1 && account.item.type != 2}"><option value="">请选择</option></c:if>
										<option value="1"  <c:if test="${account.item.type == 1}">selected="selected"</c:if> >收入</option>
										<option value="2"  <c:if test="${account.item.type == 2}">selected="selected"</c:if> >支出</option>
									</select>
								</td>
							</tr>
							<tr align="center" class="bg04">
								<td width="12%" height="35" align="right">父项目</td>
								<td width="88%" align="left">
									<select class="inp001" name="item.p_Item.id" id="pid">
                                        <option>请选择收支类型</option>
										<c:if test="${account.id != 0}" >
											<c:forEach items="${pItems}" var="item" varStatus="vs">
												<option value="${item.id}" <c:if test="${item.id == account.item.p_Item.id}" >selected="selected"</c:if> > ${item.name}</option>
											</c:forEach>
										</c:if>
									</select>
								</td>
							</tr>
							<tr align="center">
								<td width="12%" height="35" align="right">子项目</td>
								<td width="88%" align="left">
									<select class="inp001" name="item.id" id="sid">
                                        <option>请选择父项目</option>
										<c:if test="${account.id != 0}" >
											<c:forEach items="${cItems}" var="item" varStatus="vs">
												<option value="${item.id}" <c:if test="${item.id == account.item.id}" >selected="selected"</c:if> >${item.name}</option>
											</c:forEach>
										</c:if>
									</select>
								</td>
							</tr>
							<tr align="center" class="bg04">
								<td height="35" align="right">收支日期</td>
								<td align="left">
								<input id="date" name="date" type="text" class="inp001 layui-input" value='${sdf.format(account.date)}' readonly="readonly" ></td>
							</tr>
							<tr align="center">
								<td height="35" align="right">收支家庭成员</td>
								<td align="left">
									<select class="inp001" name="user.id">
										<c:forEach items="${users}" var="user" varStatus="vs">
											<option value="${user.id}" <c:if test="${user.id == account.user.id}" >selected="selected"</c:if> >${user.realname}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr align="center" class="bg04">
								<td height="35" align="right">收支金额</td>
								<td align="left"><input name="amount" type="text" class="inp001" value="${account.amount}" ></td>
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
								<c:if test="${op != 'v'}">
								<td width="11%" height="40" align="center">
									<a onclick="addProject()" target="mainframe" onMouseOver="MM_swapImage('Image1','','${pageContext.request.contextPath}/images/index_12_1.gif',1)" onMouseOut="MM_swapImgRestore()" onMouseDown="MM_swapImage('Image1','','${pageContext.request.contextPath}/images/index_12_2.gif',1)" onMouseUp="MM_swapImage('Image1','','${pageContext.request.contextPath}/images/index_12_1.gif',1)">
									<img src="${pageContext.request.contextPath}/images/index_12_0.gif" name="Image1" width="75" height="24" border="0" id="Image1">
									</a>
                                </td>
								</c:if>
                                <td width="11%" height="40" align="center">
									<a href="${pageContext.request.contextPath}/account/list" target="mainframe" onMouseOver="MM_swapImage('Image2','','${pageContext.request.contextPath}/images/login_09.gif',1)" onMouseOut="MM_swapImgRestore()" onMouseDown="MM_swapImage('Image2','','${pageContext.request.contextPath}/images/login_11.gif',1)" onMouseUp="MM_swapImage('Image2','','${pageContext.request.contextPath}/images/login_09.gif',1)">
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
            layui.use('laydate', function(){
                var laydate = layui.laydate;

                //执行一个laydate实例
                laydate.render({
                    elem: '#date' //指定元素
                });
            });
            <c:if test="${op == 'v'}"> $('input,select,textarea').attr('disabled','disabled') </c:if>
        </script>
	</body>

</html>