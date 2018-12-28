<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>Untitled Document</title>
<link href="css/style.css" rel="stylesheet" type="text/css">
</head>
<body >
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr align="center">
  <td height="40" colspan="3" class="text012">
  2018年度收支统计表</td>
  </tr>
  <tr>
    <td width="20%" align="left"></td>
    <td width="57%">&nbsp;</td>
    <td width="23%" align="right">制表日期：2018-6-4</td>
  </tr>
</table>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr align="center">
    <td height="35" class="bor004"><strong >项目名称</strong></td>
    <td class="bor004"><strong>第1月</strong></td>
    <td class="bor004"><strong>第2月</strong></td>
    <td class="bor004"><strong>第3月</strong></td>
    <td class="bor004"><strong>第4月</strong></td>
    <td class="bor004"><strong>第5月</strong></td>
    <td class="bor004"><strong>第6月</strong></td>
    <td class="bor004"><strong>第7月</strong></td>
    <td class="bor004"><strong>第8月</strong></td>
    <td class="bor004"><strong>第9月</strong></td>
    <td class="bor004"><strong>第10月</strong></td>
    <td class="bor004"><strong>第11月</strong></td>
    <td class="bor004"><strong>第12月</strong></td>
    <td class="bor004"><strong>全年</strong></td>
  </tr>
  <c:forEach var="fproject" items="${fprojectList}" varStatus="fvs">
  		<!-- 父项目行 -->
  	<tr>
	  	<td >
	  		<input type="text" name="fproject"  value="${fproject}" size="8" readonly="readonly" style="height: 20px;border: 0px;" />
	  	</td>
	  	<!-- 1-12月列 -->
	  	<c:forEach var="month" begin="1" end="12" >
			<td align="center">
				<c:if test="${month==2}"><c:set var="day"  value="28"></c:set></c:if>
				<c:if test="${month==1||month==3||month==5||month==7||month==8||month==10||month==12}"><c:set var="day"  value="31"></c:set></c:if>
				<c:if test="${month==4||month==6||month==9||month==11}"><c:set var="day"  value="30"></c:set></c:if>
				<c:set var="startDate"  value="${year}-${month}-1"></c:set>
				<c:set var="endDate"  value="${year}-${month}-${day}"></c:set>
				${as.getSumMoneyByFproject(fproject,startDate,endDate)}
		  	</td>
	  	</c:forEach>
	  	<!-- 总计列 -->
	  	<td align="center">
			<c:set var="startDate"  value="${year}-1-1"></c:set>
			<c:set var="endDate"  value="${year}-12-31"></c:set>
			${as.getSumMoneyByFproject(fproject,startDate,endDate)}
	  	</td>
  	</tr>
  		<!-- 子项目行 -->
	<c:forEach var="sproject" items="${ps.getSprojectByFproject(fproject)}" varStatus="svs">
  		<tr>
		  	<td align="center">
		  		<input type="text" name="sproject"  value="${sproject}" size="8" readonly="readonly" style="height: 20px;border: 0px;" />
		  	</td>
			<!-- 1-12月列 -->
		  	<c:forEach var="month" begin="1" end="12" >
				<td align="center">
					<c:if test="${month==2}"><c:set var="day"  value="28"></c:set></c:if>
					<c:if test="${month==1||month==3||month==5||month==7||month==8||month==10||month==12}"><c:set var="day"  value="31"></c:set></c:if>
					<c:if test="${month==4||month==6||month==9||month==11}"><c:set var="day"  value="30"></c:set></c:if>
					<c:set var="startDate"  value="${year}-${month}-1"></c:set>
					<c:set var="endDate"  value="${year}-${month}-${day}"></c:set>
					${as.getOutMoneyBySproject(sproject,startDate,endDate)}
			  	</td>
		  	</c:forEach>
		  	<!-- 总计列 -->
		  	<td align="center">
				<c:set var="startDate"  value="${year}-1-1"></c:set>
				<c:set var="endDate"  value="${year}-12-31"></c:set>
				${as.getOutMoneyBySproject(sproject,startDate,endDate)}
		  	</td>
  		</tr>
	</c:forEach>
  </c:forEach>
  
  
  <!-- 
  <tr>
    <td height="25" align="left">薪水</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
  </tr>
  <tr>
    <td height="25" align="left">&nbsp;&nbsp;&nbsp;工资</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
  </tr>
  <tr>
    <td height="25" align="left">&nbsp;&nbsp;&nbsp;奖金</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
  </tr>
  <tr>
    <td height="25" align="left">其它</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
  </tr>
  <tr>
    <td height="25" align="left">&nbsp;&nbsp;&nbsp;礼品</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
  </tr>
  <tr>
    <td height="25" align="left">&nbsp;&nbsp;&nbsp;抽奖</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
  </tr>
  <tr>
    <td height="25"><strong>收入小计：</strong></td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
  </tr>
  
  <tr>
    <td height="25" align="left">交通</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
  </tr>
   <tr>
    <td height="25" align="left">&nbsp;&nbsp;&nbsp;通讯费</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
  </tr>
  <tr>
    <td height="25" align="left"><strong>支出小计：</strong></td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
    <td align="center">0.00</td>
  </tr>
  <tr>
    <td height="25" class="bor004"><strong>合计：</strong></td>
    <td align="center" class="bor004">0.00</td>
    <td align="center" class="bor004">0.00</td>
    <td align="center" class="bor004">0.00</td>
    <td align="center" class="bor004">0.00</td>
    <td align="center" class="bor004">0.00</td>
    <td align="center" class="bor004">0.00</td>
    <td align="center" class="bor004">0.00</td>
    <td align="center" class="bor004">0.00</td>
    <td align="center" class="bor004">0.00</td>
    <td align="center" class="bor004">0.00</td>
    <td align="center" class="bor004">0.00</td>
    <td align="center" class="bor004">0.00</td>
    <td align="center" class="bor004">0.00</td>
  </tr>
   -->
</table>
</body>
</html>
