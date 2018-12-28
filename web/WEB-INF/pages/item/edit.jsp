<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
    <title>收支项目管理</title>
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css">
    <script language="JavaScript" type="text/JavaScript" src="${pageContext.request.contextPath}/js/common.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.0.0.min.js"></script>
</head>
<script src='${pageContext.request.contextPath}/common/date/date.js'></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.0.0.min.js"></script>

<body leftmargin="0" topmargin="0"
      onLoad="MM_preloadImages('${pageContext.request.contextPath}/images/login_10.gif','${pageContext.request.contextPath}/images/login_12.gif','${pageContext.request.contextPath}/images/login_09.gif','${pageContext.request.contextPath}/images/login_11.gif')">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
        <td height="32" align="left" valign="top" class="text006">
            <table width="98%" border="0" cellspacing="0" cellpadding="0">
                <tr valign="top">
                    <td>【 收支项目管理 】</td>
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
                        <span class="text001">&nbsp;&nbsp;修改收支项目</span></td>
                </tr>
            </table>
            <form:form action="saveOrUpdate" method="post" modelAttribute="item" name="frmAction">
                <form:hidden path="id" />
                <table width="98%" border="0" cellpadding="0" cellspacing="0" class="text008">
                    <tr align="center">
                        <td width="12%" height="35" align="right">收支类型</td>
                        <td width="88%" align="left">
                            <span class="text010">
                                <form:select path="type"  class="inp005">
                                    <form:option value="1">收入</form:option>
                                    <form:option value="2">支出</form:option>
                                </form:select>
                            </span>
                        </td>
                    </tr>
                    <tr align="center" class="bg04">
                        <td height="35" align="right">父项目</td>
                        <td align="left">
                            <form:select path="p_Item.id"  class="inp005">
                                <form:option value="0">无</form:option>
                                <c:forEach var="item" items="${pItems}">
                                    <form:option value="${item.id}">${item.name}</form:option>
                                </c:forEach>
                            </form:select>
                        </td>
                    </tr>
                    <tr align="center">
                        <td height="35" align="right">项目名称</td>
                        <td align="left">
                            <form:input path="name"  class="inp001"  />
                        </td>
                    </tr>
                </table>
            </form:form>
            <table width="98%" border="0" cellpadding="0" cellspacing="0" class="bor001">
                <tr>

                    <td width="11%" height="40" align="center">
                        <c:if test='${op != "r"}' >
                            <a href="#"
                           onMouseOver="MM_swapImage('Image1','',
                                   '${pageContext.request.contextPath}/images/index_12_1.gif',1)"
                           onMouseOut="MM_swapImgRestore()"
                           onMouseDown="MM_swapImage('Image1','',
                                   '${pageContext.request.contextPath}/images/index_12_2.gif',1)"
                           onMouseUp="MM_swapImage('Image1','',
                                   '${pageContext.request.contextPath}/images/index_12_1.gif',1)">
                            <img onclick="add()"
                                 src="${pageContext.request.contextPath}/images/index_12_0.gif"
                                 name="Image1" width="75" height="24" border="0" id="Image1"></a>
                        </c:if>
                    </td>
                    <td width="11%" height="40" align="center">
                        <a href="${pageContext.request.contextPath}/item/list"
                           onMouseOver="MM_swapImage('Image2','',
                                   '${pageContext.request.contextPath}/images/login_09.gif',1)"
                           onMouseOut="MM_swapImgRestore()"
                           onMouseDown="MM_swapImage('Image2','',
                                   '${pageContext.request.contextPath}/images/login_11.gif',1)"
                           onMouseUp="MM_swapImage('Image2','',
                                   '${pageContext.request.contextPath}/images/login_09.gif',1)">
                            <img src="${pageContext.request.contextPath}/images/login_07.gif"
                                 name="Image2" width="75" height="24" border="0" id="Image2"></a></td>
                    <td width="78%" align="right">&nbsp;</td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<script>
    function add() {
        document.getElementsByName("frmAction")[0].submit();
    }
    <c:if test='${op == "r"}' >  $("input,select").attr("readonly","true")  </c:if>
</script>
</body>
</html>
