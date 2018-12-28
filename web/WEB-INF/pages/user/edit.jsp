<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
    <title>家庭成员管理</title>
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.0.0.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.i18n.min.js"></script>
    <script language="JavaScript" type="text/JavaScript" src="${pageContext.request.contextPath}/js/common.js"></script>
</head>

<body leftmargin="0" topmargin="0"
      onLoad="MM_preloadImages('../images/login_10.gif','../images/login_12.gif','../images/login_09.gif','../images/login_11.gif')">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
        <td height="32" align="left" valign="top" class="text006">
            <table width="98%" border="0" cellspacing="0" cellpadding="0">
                <tr valign="top">
                    <td>【 家庭成员管理 】</td>
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
                        <span class="text001">&nbsp;&nbsp;修改家庭成员信息</span></td>
                </tr>
            </table>
            <form id="subform" action="update" method="post">
                <table width="98%" border="0" cellpadding="0" cellspacing="0" class="text008">
                    <tr align="center">
                        <td width="12%" height="35" align="right">用户名</td>
                        <td width="88%" align="left">
                            <input id="name" name="name" type="text" class="inp001" value="${user.name}"
                            <c:if test="${user.name != null && user.name != loginUser.name}"> readonly="readonly"</c:if>
                                   onfocusout="ajaxName()"
                            ><span id="checkName"></span>
                        </td>
                    </tr>
                    <tr align="center" class="bg04">
                        <td height="35" align="right">真实姓名</td>
                        <td align="left">
                            <input name="realname" type="text" class="inp001" value="${user.realname}"
                            <c:if test="${user.name != null && user.name != loginUser.name}"> readonly="readonly"</c:if>
                            >
                        </td>
                    </tr>
                    <c:if test="${user.name == null ||  user.name == loginUser.name}">
                        <input name="id" type="hidden" value="${user.id}"></td>
                        <tr align="center">
                            <td height="35" align="right">输入密码</td>
                            <td align="left"><input id="pwd" name="pwd" type="password" class="inp001"
                                                    value="${user.pwd}"></td>
                        </tr>
                        <tr align="center" class="bg04">
                            <td height="35" align="right">确认密码</td>
                            <td align="left"><input id="pwd2" name="pwd2" type="password" class="inp001"
                                                    value="${user.pwd}"></td>
                        </tr>
                    </c:if>
                </table>
            </form>
            <table width="98%" border="0" cellpadding="0" cellspacing="0" class="bor001">
                <tr>
                    <td width="12%" height="40" align="center">
                        <c:if test="${user.name == null || user.name == loginUser.name}">
                            <a href="#" target="mainframe"
                               onMouseOver="MM_swapImage('Image1','','../images/index_12_1.gif',1)"
                               onMouseOut="MM_swapImgRestore()"
                               onMouseDown="MM_swapImage('Image1','','../images/index_12_2.gif',1)"
                               onMouseUp="MM_swapImage('Image1','','../images/index_12_1.gif',1)">
                                <img src="../images/index_12_0.gif" name="Image1" width="75" height="24" border="0"
                                     id="Image1" onclick="doSub()">
                            </a>
                        </c:if>
                    </td>
                    <td width="12%" height="40" align="center">
                        <a href="list" target="mainframe"
                           onMouseOver="MM_swapImage('Image2','','../images/login_09.gif',1)"
                           onMouseOut="MM_swapImgRestore()"
                           onMouseDown="MM_swapImage('Image2','','../images/login_11.gif',1)"
                           onMouseUp="MM_swapImage('Image2','','../images/login_09.gif',1)">
                            <img src="../images/login_07.gif" name="Image2" width="75" height="24" border="0"
                                 id="Image2">
                        </a>
                    </td>
                    <td width="76%" align="right">&nbsp;</td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<script>
    function doSub() {
        var pwd1 = document.getElementById("pwd")
        var pwd2 = document.getElementById("pwd2")
        $.ajax({
            type: "post",
            url: "modifyName",
            data: "name=" + $('#name').val() + "&oldName=${user.name}",
            async: false,
            success: function (msg) {
                if (!msg) {
                    $("#checkName").html("用户名已被使用，请重新输入")
                    document.getElementById("name").focus()
                }else{
                    if (pwd1.value != pwd2.value || (pwd1.value == null && pwd2.value == null)) {
                        alert("两次输入密码不一致，请重新输入")
                        pwd1.value = ""
                        pwd2.value = ""
                        pwd1.focus()
                        return;
                    }
                    sub();
                }
            },
            dataType: "json"
        })

    }

    function ajaxName() {
        $.ajax({
            type: "post",
            url: "modifyName",
            data: "name=" + $("#name").val() + "&oldName=${user.name}",
            success: function (msg) {
                if (!msg) {
                    $("#checkName").html("用户名已被使用，请重新输入")
                    document.getElementById("name").focus()
                }
            },
            dataType: "json"
        })
    }
</script>
</body>
</html>
