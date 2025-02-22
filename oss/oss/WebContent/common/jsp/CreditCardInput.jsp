<%@ include file="Common.jspf" %>

<html>
<head>
  <%@ include file="Header.jspf" %>
  <title>Credit Card Input</title>
</head>

<%
	java.util.Calendar curCalDt = java.util.Calendar.getInstance();
	pageContext.setAttribute("year", new Integer(curCalDt.get(java.util.Calendar.YEAR)));
%>

<SCRIPT language="JavaScript">
	function showCreditCardTypes()
	{
		var selectCreditCardTypeList = '<select name="cc_type" size="1">';
		for (x in EC_CreditCardKinds) {
			selectCreditCardTypeList += '<option value="' + x + '">' + EC_CreditCardKinds[x] + '</option>';
		}
		selectCreditCardTypeList += '</select>';
		document.getElementById("creditCardTypeList").innerHTML = selectCreditCardTypeList;
	}

	function validate()
	{
		var ok = true;
		return ok;
	}
	
	function initPage()
	{
		vcInitPage();
<c:if test="${!onWii}">	
		showCreditCardTypes();
</c:if>		
		document.getElementById("cardNumber").value = '1111222233334444';
	}
</SCRIPT>

<body onload="initPage()">

<CENTER>

<TABLE WIDTH=100%>
<TR>
	<TD ALIGN="left">
	</TD>
	<TD ALIGN="right">
		<button class="tdButton" onclick="showHelp('CreditCard')"><fmt:message key="button.help"/></button>
	</TD>		
</TR>
</TABLE>

Enter your credit card information
<BR>
<FORM action="<c:out value="${param.next}" />" onsubmit="return validate()" method="post">
<input type="hidden" name="pay" value="CCARD" />
<input type="hidden" name="itemId" value="<c:out value="${param.itemId}"/>" />
<input type="hidden" name="points" value="<c:out value="${param.points}"/>" />
<input type="hidden" name="price" value="<c:out value="${param.price}"/>" />
<input type="hidden" name="currency" value="<c:out value="${param.currency}"/>" />

<TABLE>
<TR>
<TD>Credit card type</TD>
<TD><div id="creditCardTypeList"></div>
</TD>
</TR>
<TR>
<TD>Credit card number</TD>
<TD><input type="text" name="cc_number" id="cardNumber"/></TD>
</TR>
<TR>
<TD>Name</TD>
<TD><input type="text" name="cc_owner"/></TD>
</TR>
<TR>
<TD>Address</TD>
<TD>
  City: <input type="text" name="cc_city"/><BR>
  State: <input type="text" name="cc_state"/><BR>
  Zip: <input type="text" name="cc_postal"/>
</TD>
</TR>
<TR>
<TD>Expiration Date</TD>
<TD>Month 
    <select name="cc_expmm" size=1>
		<c:forEach var="i" begin='1' end='12'>
			<option value="<c:out value="${i}"/>"><fmt:formatNumber pattern="00" value="${i}"/></option>
		</c:forEach>
	</select>
    Year 
    <select name="cc_expyy" size=1>
		<c:forEach var="j" begin='0' end='10'>
			<option value="<c:out value="${year+j}"/>"><c:out value="${year+j}"/></option>
		</c:forEach>
	</select>
</TD>
</TR>
<TR>
<TD>Card Security Code</TD>
<TD><input type="text" name="cc_vfyval"/></TD>
</TR>
</TABLE>
<BR><BR>
<button type="button" class="tdbutton" onclick="showHome()" id="ReturnButton"><fmt:message key="button.back"/></button>
<input type="submit" name="OK" value="OK" />
</FORM>
</CENTER>

</body>
</html>