<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>报表统计</title>
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" type="text/JavaScript" src="${pageContext.request.contextPath}/js/common.js"></script>
<script src='${pageContext.request.contextPath}/common/date/date.js'></script>
<script>
function selectBb() {
	//alert(document.all("select1").value);
	document.all("exlframe").src = document.all("select1").value;
}
</script>

</head>

<body leftmargin="0" topmargin="0" onLoad="MM_preloadImages('${pageContext.request.contextPath}/images/index_12_1.gif','${pageContext.request.contextPath}/images/index_12_2.gif')">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="32" align="left" valign="top" class="text006"><table width="98%"  border="0" cellspacing="0" cellpadding="0">
        <tr valign="top">
          <td>【 报表统计 】</td>
          <td align="right"><img src="${pageContext.request.contextPath}/images/icon01.gif" width="35" height="21" align="absmiddle"><span class="text010">报表类型
            <select name="select1" class="inp004" onChange="selectBb()">
              <option selected  value="${pageContext.request.contextPath}/ReportBbtj01Servlet?startDate=${startDate}&endDate=${endDate}">收支汇总报表</option>
              <option value="${pageContext.request.contextPath}/ReportBbtj02Servlet?startDate=${startDate}&endDate=${endDate}">年度收支统计表</option>
              <option value="${pageContext.request.contextPath}/report/bbtj_03.jsp?startDate=${startDate}&endDate=${endDate}">家庭支出占比图</option>
              <option value="${pageContext.request.contextPath}/report/bbtj_041.jsp?startDate=${startDate}&endDate=${endDate}">支出构成图表</option>
              <option value="${pageContext.request.contextPath}/ReportBbtj05Servlet?startDate=${startDate}&endDate=${endDate}">家庭成员收支表</option>
            </select>
          </span>		  </td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td height="215" valign="top"><table width="98%"  border="0" cellspacing="0" cellpadding="0">
      <tr align="left" class="bg03">
        <td width="100%" height="29"><span class="text001">&nbsp;&nbsp;收支汇总报表</span></td>
      </tr>
    </table>
      <table width="98%"  border="0" cellpadding="0" cellspacing="0" class="bor002">
        <tr>
          <td width="10%" height="35" align="right" class="text011">统计年份</td>
          <form action="${pageContext.request.contextPath}/ReportBbtjTimeServlet" method="post" name='timeform'>
          	<td width="12%" align="left">
	          <span class="text010">
	            <select name="select" class="inp003" onchange=javascript:document.getElementsByName('timeform')[0].submit()>
	              <option selected value='2018'>2018年</option>
	              <option value='2017'>2017年</option>
	              <option value='2016'>2016年</option>
	            </select>
	          </span></td>
	          <td width="9%" height="35" align="right" class="text011">开始日期</td>
	          <td width="14%" align="left"><span class="text010">
	           &nbsp;&nbsp;
	           <c:if test="${startDate==null}"> <input type="text" name="startDate" value="2016-01-01" readonly onclick=javascript:document.all['startDate'].value=selectDate()> </c:if>
	           <c:if test="${startDate!=null}"> <input type="text" name="startDate" value="${startDate}" readonly onclick=javascript:document.all['startDate'].value=selectDate()> </c:if>
	           
				<!-- <INPUT type='button' value='选择日期' onclick=javascript:document.all['startTime'].value=selectDate() > -->
	          </span></td>
	          <td width="10%" align="right" class="text011">结束日期</td>
	          <td width="19%" align="left">
	          <span class="text010"> 
	            &nbsp;&nbsp;
	            
	           <c:if test="${endDate==null}"> <input type="text" name="endDate" value="2018-12-31" readonly onclick=javascript:document.all['endDate'].value=selectDate()></c:if>
	           <c:if test="${endDate!=null}"> <input type="text" name="endDate" value="${endDate}" readonly onclick=javascript:document.all['endDate'].value=selectDate()></c:if>
	            
				<!-- <INPUT type='button' value='选择日期' onclick=javascript:document.all['startTime'].value=selectDate() > -->
	          </span></td>
	          <td width="29%">
	          <a href="#" target="mainframe" onMouseOver="MM_swapImage('Image1','','${pageContext.request.contextPath}/images/index_12_1.gif',1)" onMouseOut="MM_swapImgRestore()" onMouseDown="MM_swapImage('Image1','','${pageContext.request.contextPath}/images/index_12_2.gif',1)" onMouseUp="MM_swapImage('Image1','','${pageContext.request.contextPath}/images/index_12_1.gif',1)">
	          <img src="${pageContext.request.contextPath}/images/index_12_0.gif" name="Image1" width="75" height="24" border="0" id="Image1" onclick=javascript:document.getElementsByName('timeform')[0].submit()>
	          </a>
	          </td>
          </form>
          <script type="text/javascript">
            //日期测试
          	var sd = document.getElementsByName("startDate")[0];
          	var ed = document.getElementsByName("endDate")[0];
          	//alert( ${startDate}  ); 
            //	if( ${startDate} != "" ){sd.value=${startDate}}
          	//if( ${endDate} != "" ){ed.value=${startDate}}
          	//alert(${startDate}) 
          	//alert(sd.value+ed.value) 
		</script>
        </tr>
      </table>
      <table width="98%" border="0" cellpadding="0" cellspacing="0" class="bor003">
        <tr>
          <td height="40" align="left" valign="top" ><iframe name="exlframe" src="${pageContext.request.contextPath}/ReportBbtj01Servlet?startDate=${startDate}&endDate=${endDate}" width="100%" height="400px" frameborder="0" align="top"></iframe>         </td>
        </tr>
      </table></td>
  </tr>
</table>
</body>
</html>
