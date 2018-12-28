<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% request.setAttribute("sdf",new SimpleDateFormat("yyyy-MM-dd"));%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
    <title>帐薄管理</title>
    <script src="${pageContext.request.contextPath}/js/jquery-3.0.0.min.js" type="text/javascript"
            charset="utf-8"></script>
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css">
    <script language="JavaScript" type="text/JavaScript" src="${pageContext.request.contextPath}/js/common.js"></script>
    <script type="text/javascript">
        $().ready(function () {
            $(":checkbox[name=all]").click(function () {
                $(":checkbox[name=checkbox]").prop("checked", $(this).prop("checked"));
            });

        });

        <%--function del() {--%>
            <%--document.getElementsByName('pagesizeform')[0].action = '${pageContext.request.contextPath}/AccountDeleteServlet';--%>
            <%--document.getElementsByName('pagesizeform')[0].submit();--%>
        <%--}--%>

    </script>
</head>

<body topmargin="0" leftmargin="0">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
        <td height="32" align="left" valign="top" class="text006">
            <table width="98%" border="0" cellspacing="0" cellpadding="0">
                <tr valign="top">
                    <td>【 账簿管理 】</td>
                    <td align="right">
                        <form action="list" method="post" id="searchForm">
                            <input type="hidden" name="page" id="page" value="1">
                            <input type="hidden" name="delId" id="delId" value="">
                            <input type="text" name="search" id="search" value="${search}" placeholder="项目名称或者家庭成员"/>
                        </form>
                    </td>
                    <td align="right" width="319px">
                        <!-- 查找 -->
                        <a href="#" onclick="searchFormSub()"
                           onMouseOver="MM_swapImage('Image2','','${pageContext.request.contextPath}/images/index_11_1.gif',1)"
                           onMouseOut="MM_swapImgRestore()"
                           onMouseDown="MM_swapImage('Image2','','${pageContext.request.contextPath}/images/index_11_2.gif',1)"
                           onMouseUp="MM_swapImage('Image2','','${pageContext.request.contextPath}/images/index_11_1.gif',1)">
                            <img src="${pageContext.request.contextPath}/images/index_11_0.gif" width="75" height="24"
                                 border="0" align="top" id="Image2"></a>
                        &nbsp;
                        <!-- 增加 -->
                        <a href="${pageContext.request.contextPath}/account/toAddOrEdit" target="mainframe"
                           onMouseOver="MM_swapImage('Image1','','${pageContext.request.contextPath}/images/index_10_1.gif',1)"
                           onMouseOut="MM_swapImgRestore()"
                           onMouseDown="MM_swapImage('Image1','','${pageContext.request.contextPath}/images/index_10_2.gif',1)"
                           onMouseUp="MM_swapImage('Image1','','${pageContext.request.contextPath}/images/index_10_1.gif',1)">
                            <img src="${pageContext.request.contextPath}/images/index_10_0.gif" width="75" height="24"
                                 border="0" align="top" id="Image1">
                        </a> &nbsp;
                        <!-- 删除 -->
                        <a target="mainframe"
                           onMouseOver="MM_swapImage('Image3','','${pageContext.request.contextPath}/images/index_13_1.gif',1)"
                           onMouseOut="MM_swapImgRestore()"
                           onMouseDown="MM_swapImage('Image3','','${pageContext.request.contextPath}/images/index_13_2.gif',1)"
                           onMouseUp="MM_swapImage('Image3','','${pageContext.request.contextPath}/images/index_13_1.gif',1)">
                            <img onclick='dels2()' src="${pageContext.request.contextPath}/images/index_13_0.gif"
                                 id="Image3" width="75" height="24" border="0"></a>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td height="215" valign="top">
            <form action="${pageContext.request.contextPath}/account/list" id="myform">
                <table width="98%" border="0" cellspacing="0" cellpadding="0">
                    <tr align="center" class="bg03">
                        <td height="29">
                            <input type="checkbox" name="all" value="checkbox">
                            <span class="text007">全选</span>
                        </td>
                        <td class="text007">收入/支出</td>
                        <td class="text007">项目名称</td>
                        <td class="text007">日期</td>
                        <td class="text007">家庭成员</td>
                        <td class="text007">金额</td>
                        <td class="text007">备注</td>
                        <td class="text007">操作</td>

                        <c:forEach var='a' items="${accounts}" varStatus="vs">
                            <input type="hidden" name="page" value="${page}">
                            <c:if test="${vs.index%2==0}">
                                <tr align="center">
                            </c:if>
                            <c:if test="${vs.index%2==1}">
                                <tr align="center" class="bg04">
                            </c:if>
                            </tr>
                                <td height="35" align="center"><input name="delIds" type="checkbox" name="checkbox" value="${a.id}"></td>
                                <td align="center">
                                    <c:if test="${a.item.type==1}">收入</c:if>
                                    <c:if test="${a.item.type==2}">支出</c:if>
                                </td>
                                <td align="center">
                                    <a href="edit.jsp">【 ${a.item.p_Item.name}】- ${a.item.name} </a>
                                </td>
                                <td align="center"> ${sdf.format(a.getDate())}</td>
                                <td align="center"> ${a.user.realname} </td>
                                <td align="center">${a.amount}</td>
                                <td align="center">${a.remark}</td>
                                <td align="center">
                                    <a href="detail?id=${a.id}"><img src="${pageContext.request.contextPath}/images/icon_resault.gif"
                                                              alt="查 看" width="12" height="15" hspace="10" border="0"></a>
                                    <a href="toAddOrEdit?id=${a.id}"><img src="${pageContext.request.contextPath}/images/icon_set.gif" alt="编 辑"
                                                            width="14" height="15" border="0"></a>
                                    <a href="#" onclick="del2(${a.id})"><img src="${pageContext.request.contextPath}/images/delete.gif" alt="删 除"
                                                               width="13" height="16" hspace="10"></a>
                                </td>
                            </tr>
                        </c:forEach>


                </table>
                <table width="98%" border="0" cellpadding="0" cellspacing="0" class="bor001">
                    <tr align="right">
                        <td height="40" align="left">&nbsp;</td>
                        <td align="right">
                            &nbsp;&nbsp;${page}/${totalPage}页&nbsp;&nbsp;
                            <a href="#" onclick="changePage(${1 - page})" class="tex04">首页</a>
                            |
                            <c:if test="${page>1}"> <a
                                    href="#" onclick="changePage(-1)"
                                    class="tex04">上一页</a> </c:if>
                            <c:if test="${page==1}"> <a href="#" class="tex04">上一页</a> </c:if>
                            |
                            <c:if test="${page<totalPage}"> <a
                                    href="#" onclick="changePage(1)"
                                    class="tex04">下一页</a> </c:if>
                            <c:if test="${page==totalPage}"> <a href="#" class="tex04">下一页</a> </c:if>
                            |
                            <a href="#" onclick="changePage(${totalPage - page})"
                               class="tex04">末页</a>
                            <input class="InputText" type="text" name="pagego" id="pagego" style="width:30px;"/>
                            <input class="input_button" name="go" type="button" id="go" value="GO" onclick="pageGo()"/>
                        </td>
                        <%--<td>--%>
                        <%--每页显示--%>
                        <%--<select name="pagesize"--%>
                        <%--onchange=javascript:document.getElementsByName('pagesizeform')[0].submit()>--%>
                        <%--<option selected value="5">5</option>--%>
                        <%--<option value="8">8</option>--%>
                        <%--<option value="10">10</option>--%>
                        <%--<option value="15">15</option>--%>
                        <%--<option value="20">20</option>--%>
                        <%--</select>条--%>
                        <%--</td>--%>
                    </tr>
                </table>
            </form>
        </td>
    </tr>
</table>
<script>
    function del2(id){
        document.getElementById("delId").value = id ;
        document.getElementById("page").value = ${page} ;
        searchFormSub();
    }
    function dels2(){
        document.getElementById("myform").submit();
    }
    function pageGo(){
        var goDom = document.getElementById("pagego");
        if(goDom.value > ${totalPage}){
            goDom.value = ${totalPage};
        }
        if(goDom.value < 1){
            goDom.value = 1;
        }
        document.getElementById("page").value = goDom.value ;
        searchFormSub();
    }
    function changePage(i){
        document.getElementById("page").value = ${page} + i ;
        searchFormSub();
    }
    function searchFormSub(){
        document.getElementById("searchForm").submit();
    }
</script>
</body>

</html>