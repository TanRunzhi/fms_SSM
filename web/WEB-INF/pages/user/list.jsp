<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
    <title>家庭成员管理</title>
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css">
    <script language="JavaScript" type="text/JavaScript" src="${pageContext.request.contextPath}/js/common.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery-3.0.0.min.js"></script>
</head>

<body topmargin="0" leftmargin="0">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
        <td height="32" align="left" valign="top" class="text006">
            <table width="98%" border="0" cellspacing="0" cellpadding="0">
                <tr valign="top">
                    <td>【 家庭成员管理 】</td>
                    <td align="right">
                        <a href="edit" target="mainframe"
                           onMouseOver="MM_swapImage('Image1','','${pageContext.request.contextPath}/images/index_10_1.gif',1)"
                           onMouseOut="MM_swapImgRestore()"
                           onMouseDown="MM_swapImage('Image1','','${pageContext.request.contextPath}/images/index_10_2.gif',1)"
                           onMouseUp="MM_swapImage('Image1','','${pageContext.request.contextPath}/images/index_10_1.gif',1)">
                            <img src="${pageContext.request.contextPath}/images/index_10_0.gif" width="75"
                                 height="24"
                                 border="0" align="top" id="Image1">
                        </a>
                        <%--&nbsp; &nbsp;--%>
                        <%--<a href="#" target="mainframe"
                           onMouseOver="MM_swapImage('Image3','','${pageContext.request.contextPath}/images/index_13_1.gif',1)"
                           onMouseOut="MM_swapImgRestore()"
                           onMouseDown="MM_swapImage('Image3','','${pageContext.request.contextPath}/images/index_13_2.gif',1)"
                           onMouseUp="MM_swapImage('Image3','','${pageContext.request.contextPath}/images/index_13_1.gif',1)">
                            <img src="${pageContext.request.contextPath}/images/index_13_0.gif" id="Image3"
                                 width="75"
                                 height="24" border="0">
                        </a>--%>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td height="215" valign="top">
            <table width="98%" border="0" cellspacing="0" cellpadding="0">
                <tr align="center" class="bg03">
                    <td width="15%" height="29">
                        <%--<input type="checkbox" name="chkAll" value="checkbox">
                        <span class="text007">全选</span>--%>
                        序号
                    </td>
                    <td width="30%" class="text007"> 用户名</td>
                    <td width="35%" class="text007">真实姓名</td>
                    <td width="20%" class="text007">操作</td>
                </tr>
                <c:forEach var="user" items="${users}" varStatus="vs">
                    <tr align="center"  <c:if test="${vs.index%2==1}"> class="bg04"</c:if> >
                        <td height="35">
                            <%--<input type="checkbox" name="id" value="${user.id}">--%>
                            ${vs.index+1}
                        </td>
                        <td><a href="edit.html"> ${user.name} </a></td>
                        <td>${user.realname} </td>
                        <td>
                            <a href="#"><img src="${pageContext.request.contextPath}/images/icon_set.gif" alt="编 辑"
                                             width="14" height="15" border="0" onclick="edit(${user.id})"></a>
                            <img src="${pageContext.request.contextPath}/images/delete.gif" alt="删 除" width="13"
                                 height="16" hspace="10" onclick="del(${user.id})"></td>
                    </tr>
                </c:forEach>


                <!--
                <tr align="center">
                  <td height="35"><input type="checkbox" name="checkbox" value="checkbox"></td>
                  <td><a href="edit.html">e01234</a> </td>
                  <td>xle021</td>
                  <td>
                  <a href="edit.html"><img src="../images/icon_set.gif" alt="编 辑" width="14" height="15" border="0"></a>
                  <img src="../images/delete.gif" alt="删 除" width="13" height="16" hspace="10"></td>
                </tr>
                <tr align="center" class="bg04">
                  <td height="35"><input type="checkbox" name="checkbox" value="checkbox"></td>
                  <td><a href="edit.html">e01234</a> </td>
                  <td>xle021</td>
                  <td>
                  <a href="edit.html"><img src="../images/icon_set.gif" alt="编 辑" width="14" height="15" border="0"></a>
                  <img src="../images/delete.gif" alt="删 除" width="13" height="16" hspace="10"></td>
                </tr>
                <tr align="center">
                  <td height="35"><input type="checkbox" name="checkbox" value="checkbox"></td>
                  <td><a href="edit.html">e01234</a> </td>
                  <td>xle021</td>
                  <td>
                  <a href="edit.html"><img src="../images/icon_set.gif" alt="编 辑" width="14" height="15" border="0"></a>
                  <img src="../images/delete.gif" alt="删 除" width="13" height="16" hspace="10"></td>
                </tr>
                <tr align="center"class="bg04">
                  <td height="35"><input type="checkbox" name="checkbox" value="checkbox"></td>
                  <td><a href="edit.html">e01234</a> </td>
                  <td>xle021</td>
                  <td>
                  <a href="edit.html"><img src="../images/icon_set.gif" alt="编 辑" width="14" height="15" border="0"></a>
                  <img src="../images/delete.gif" alt="删 除" width="13" height="16" hspace="10"></td>
                </tr>
                <tr align="center">
                  <td height="35"><input type="checkbox" name="id" value="checkbox"></td>
                  <td><a href="edit.html">e01234</a> </td>
                  <td>xle021</td>
                  <td>
                  <a href="edit.html"><img src="../images/icon_set.gif" alt="编 辑" width="14" height="15" border="0"></a>
                  <img src="../images/delete.gif" alt="删 除" width="13" height="16" hspace="10"></td>
                </tr>
                 -->
                </td></tr></table>
        </td>
    </tr>
    <tr>
        <td align=left valign=top>
            <hr class="bor005" size="1"/>
        </td>
    </tr>
</table>
</body>
</html>
