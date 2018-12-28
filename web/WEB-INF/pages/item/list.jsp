<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
    <title>收支项目管理</title>
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.0.0.min.js"></script>
</head>
<body topmargin="0" leftmargin="0">
<form name="frmAction" method="post" action="${pageContext.request.contextPath}/ItemListProjectServlet">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td height="32" align="left" valign="top" class="text006">
                <table width="98%" border="0" cellspacing="0" cellpadding="0">
                    <tr valign="top">
                        <td>【 收支项目管理 】 (父项目名称)</td>
                        <td align="right">
                            <a href="${pageContext.request.contextPath}/item/addOrEdit"
                               onMouseOver="MM_swapImage('Image2','','${pageContext.request.contextPath}/images/index_14_1.gif',1)"
                               onMouseOut="MM_swapImgRestore()"
                               onMouseDown="MM_swapImage('Image2','','${pageContext.request.contextPath}/images/index_14_2.gif',1)"
                               onMouseUp="MM_swapImage('Image2','','${pageContext.request.contextPath}/images/index_15_1.gif',1)">
                                <img src="${pageContext.request.contextPath}/images/index_14_0.gif" width="85"
                                     height="24" border="0" align="top" id="Image2"></a>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td height="215" valign="top">
                <table width="98%" border="0" cellspacing="0" cellpadding="0">
                    <tr align="center" class="bg03">
                        <td width="13%" height="29">
                            <span class="text007">序号</span></td>
                        <td width="22%" class="text007"> 收入/支出</td>
                        <td width="20%" class="text007">项目名称</td>
                        <td width="30%" class="text007">操作</td>
                    </tr>
                    <c:forEach var="item" items="${items}" varStatus="vs">
                            <tr align="center"   <c:if test="${vs.index%2==1}"> class="bg04"</c:if>  >
                                <td height="35">${vs.count}</td>
                                <td>
                                    <c:if test="${item.type==1 }">收入</c:if>
                                    <c:if test="${item.type==2 }">支出</c:if>
                                </td>
                                <td align="left">
                                    <c:if test="${item.p_Item != null}"> <a href="#"                 >${item.name }</a> </c:if>
                                    <c:if test="${item.p_Item == null}"> <a href="list?id=${item.id}">${item.name }</a> </c:if>
                                </td>
                                <td>
                                    <a href="view?id=${item.id}">
                                        <img src="${pageContext.request.contextPath}/images/icon_resault.gif" alt="查 看"
                                             width="12" height="15" hspace="10" border="0"></a>
                                    <a href="addOrEdit?id=${item.id}">
                                        <img src="${pageContext.request.contextPath}/images/icon_set.gif" alt="编 辑"
                                             width="14" height="15" border="0"></a>
                                    <a href="del?id=${item.id}">
                                        <img src="${pageContext.request.contextPath}/images/delete.gif" alt="删 除" width="13"
                                             height="16" hspace="10">
                                    </a>
                                </td>
                            </tr>
                    </c:forEach>
                </table>
            </td>
        </tr>
    </table>
</form>
</body>

</html>