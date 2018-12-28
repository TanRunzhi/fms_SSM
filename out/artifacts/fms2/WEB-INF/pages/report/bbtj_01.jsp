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

<table width="100%"  border="1" cellspacing="0" cellpadding="0">
   <tr align="center">
  <td height="40" colspan="4" class="text012">
  <h2>2018年01月01日至2018年01月20日收支汇总报表</h2></td>
  </tr>
  <tr>
    <td align="right" colspan="4">制表日期：2018-6-1&nbsp;&nbsp;</td>
  </tr>
  <tr >
    <td align="center" class="bor003"><strong>类别</strong></td>
    <td align="center" class="bor003" colspan="2"><strong>项目名称</strong></td>
    <td align="center" class="bor003"><strong>金额</strong></td>
  </tr>
    <c:set var="startDate"  value="${year}-1-1"></c:set>
  	<c:set var="endDate"  value="${year}-12-31"></c:set>
  <tr>
  	<td align="left" rowspan="1"><strong>收入</strong></td>
  	<td rowspan="1">工资&nbsp;</td>
    <td align="left">发工资</td>
    <c:set var="salary"  value="发工资"></c:set>
    <td >${as.getOutMoneyBySproject(salary, startDate, endDate)}</td>
   </tr>
   
  	<c:forEach var="p" items="${ps.getAll()}" varStatus="fvs">
	   <tr>
	    	<!-- fvs=1 rowspan=size   -->
	  	<!--rowspan="${ps.getAll().size()}"   -->
	   	<c:if test="${fvs.index==0}"> <td rowspan="${ps.getAll().size()}" ><strong>支出</strong></td>  </c:if>
	  	<!-- rowspan="${ps.getSprojectByFproject(fproject).size()}" -->
  		
  		<td > ${p.fproject} </td>
  		
  		<td > ${p.sproject} </td>
  	
  		<td > ${as.getOutMoneyBySproject(p.sproject, startDate, endDate)} </td>
  	
	   </tr>
  	</c:forEach>

	
  <!-- 
  <tr>
  	<td align="left" rowspan="6"><strong>收入</strong></td>
    <td rowspan="3">工资&nbsp;</td>
    <td align="left">正常工资</td>
    <td align="right">3,200.00</td>
  </tr>
  <tr>
    <td align="left">奖金</td>
    <td align="right">100.00</td>
  </tr>
  <tr>
    <td align="left">小计</td>
    <td align="right">3,300.00</td>
  </tr>
  <tr>
  	<td rowspan="2">其他收入&nbsp;</td>
    <td align="left">礼品收入</td>
    <td align="right">800.00</td>
  </tr>
  <tr>
    <td align="left"><strong>小计</strong></td>
    <td align="right">800.00</td>
  </tr>
  <tr>
    <td align="left" colspan="2"><strong>收入合计</strong></td>
    <td align="right">4,100.00</td>
  </tr>
  <tr>
    <td align="left" rowspan="4" class="bor003"><strong>支出</strong></td>
    <td align="left" rowspan="3" class="bor003">交通</td>
    <td align="left">公共交通</td>
    <td align="right" class="bor003">700.00</td>
  </tr>
   <tr>
    <td align="left">汽油费</td>
    <td align="right">300.00</td>
  </tr>
   <tr>
    <td align="left">小计</td>
    <td align="right">1000.00</td>
  </tr>
  <tr>
    <td align="left" colspan="2"><strong>支出合计</strong></td>
    <td align="right">1000.00</td>
  </tr>
  <tr> 
    <td align="center" colspan="3"><strong>收入支出结余合计</strong></td>
    <td align="right">3100.00</td>
  </tr>
   -->
</table>
</body>
</html>
