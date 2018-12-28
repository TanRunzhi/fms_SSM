<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<title>Untitled Document</title>
		<link href="css/style.css" rel="stylesheet" type="text/css">
	</head>
	<body>
		<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  			<tr align="center">
  				<td height="40" colspan="3" class="text012">
  					2018家庭成员支出表</td>
  			</tr>
  			<tr>
			    <td width="20%" align="left"></td>
			    <td width="57%">&nbsp;</td>
			    <td width="23%" align="right">制表日期：2008-05-31</td>
  			</tr>
		</table>
		<table width="100%"  border="0" cellspacing="0" cellpadding="0">
		 <tr align="center">
		    <td height="35" class="bor004"><strong >项目名称</strong></td>
		    <c:forEach var='realname' items='${realnames}' >
				 <td class="bor004"><strong> ${realname} </strong></td>
			</c:forEach>
		    <td class="bor004"><strong>共计</strong></td>
		  </tr>
			
		<c:forEach var="fproject" items="${fprojectList}" varStatus="fvs">
  		<!-- 父项目行 -->
  	<tr>
	  	<td >
	  		<input type="text" name="fproject"  value="${fproject}" size="8" readonly="readonly" style="height: 20px;border: 0px;" />
	  	</td>
	  	<!--人数列 -->
	  	 <c:forEach var='realname' items='${realnames}' >
			<td align="center">
				<c:set var="startDate"  value="${year}-1-1"></c:set>
				<c:set var="endDate"  value="${year}-12-31"></c:set>
				${as.getSumMoneyByFprojectAndRealName(fproject, realname, startDate, endDate)}
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
		  		<input type="text" name="fproject"  value="${sproject}" size="8" readonly="readonly" style="height: 20px;border: 0px;" />
		  	</td>
			<!--人数列 -->
		  	 <c:forEach var='realname' items='${realnames}' >
				<td align="center">
					<c:set var="startDate"  value="${year}-1-1"></c:set>
					<c:set var="endDate"  value="${year}-12-31"></c:set>
					${as.getSumMoneyBySprojectAndRealName(sproject, realname, startDate, endDate)}
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
  
		
		
			<!--1r
		  <tr align="center">
		    <td height="35" class="bor004"><strong >项目名称</strong></td>
		    <td class="bor004"><strong>谭润芝</strong></td>
		    <td class="bor004"><strong>陶秉旨</strong></td>
		    <td class="bor004"><strong>王朝轩</strong></td>
		    <td class="bor004"><strong>李胜</strong></td>
		    <td class="bor004"><strong>吴则强</strong></td>
		    <td class="bor004"><strong>共计</strong></td>
		  </tr>
		  
		  <tr>
		  <tr>
		    <td height="25" align="center">&nbsp;&nbsp;&nbsp;外卖</td>
		    <td align="center">2-1</td>
		    <td align="center">0.00</td>
		    <td align="center">0.00</td>
		    <td align="center">0.00</td>
		    <td align="center">0.00</td>
		    <td align="center">0.00</td>
		    
		  </tr>
		  
		  <tr>
		    <td height="25" align="center">&nbsp;&nbsp;&nbsp;交通卡充值</td>
		    <td align="center">0.00</td>
		    <td align="center">0.00</td>
		    <td align="center">0.00</td>
		    <td align="center">0.00</td>
		    <td align="center">0.00</td>
		    <td align="center">0.00</td>
		  
		  </tr>
		  <tr>
		    <td height="25" align="center"><strong>日常支出小计：</strong></td>
		    <td align="center">0.00</td>
		    <td align="center">0.00</td>
		    <td align="center">0.00</td>
		    <td align="center">0.00</td>
		    <td align="center">0.00</td>
		    <td align="center">0.00</td>

		  </tr>
	
		  <tr>
		    <td height="25" align="center">&nbsp;&nbsp;&nbsp;修车费</td>
		    <td align="center">0.00</td>
		    <td align="center">0.00</td>
		    <td align="center">0.00</td>
		    <td align="center">0.00</td>
		    <td align="center">0.00</td>
		    <td align="center">0.00</td>
	
	
		  </tr>
		  <tr>
		    <td height="25" align="center">&nbsp;&nbsp;&nbsp;车辆保险</td>
		    <td align="center">0.00</td>
		    <td align="center">0.00</td>
		    <td align="center">0.00</td>
		    <td align="center">0.00</td>
		    <td align="center">0.00</td>
		    <td align="center">0.00</td>
	
		  </tr>
		  <tr>
		    <td height="25" align="center"><strong>车辆费用小计：</strong></td>
		    <td align="center">0.00</td>
		    <td align="center">0.00</td>
		    <td align="center">0.00</td>
		    <td align="center">0.00</td>
		    <td align="center">0.00</td>
		    <td align="center">0.00</td>

		  </tr>
		   <tr>
		    <td height="25" align="center">&nbsp;&nbsp;&nbsp;交房租</td>
		    <td align="center">0.00</td>
		    <td align="center">0.00</td>
		    <td align="center">0.00</td>
		    <td align="center">0.00</td>
		    <td align="center">0.00</td>
		    <td align="center">0.00</td>
	
		  </tr>
		  <tr>
		    <td height="25" align="center">&nbsp;&nbsp;&nbsp;水电费</td>
		    <td align="center">0.00</td>
		    <td align="center">0.00</td>
		    <td align="center">0.00</td>
		    <td align="center">0.00</td>
		    <td align="center">0.00</td>
		    <td align="center">0.00</td>
	
		  </tr>
		  <tr>
		    <td height="25" align="center">&nbsp;&nbsp;&nbsp;燃气费</td>
		    <td align="center">0.00</td>
		    <td align="center">0.00</td>
		    <td align="center">0.00</td>
		    <td align="center">0.00</td>
		    <td align="center">0.00</td>
		    <td align="center">0.00</td>
	
		  </tr>
		  <tr>
		    <td height="25" align="center"><strong>房屋费用小计：</strong></td>
		    <td align="center">0.00</td>
		    <td align="center">0.00</td>
		    <td align="center">0.00</td>
		    <td align="center">0.00</td>
		    <td align="center">0.00</td>
		    <td align="center">0.00</td>
	
		  </tr>
		  <tr>
		    <td height="25" class="bor004" align="center"><strong>合计：</strong></td>
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
