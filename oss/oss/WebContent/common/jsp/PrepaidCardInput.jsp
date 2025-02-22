<%@ include file="Common.jspf" %>

<html>
<head>
  <%@ include file="Header.jspf" %>
  <title>Prepaid Card Code Input</title>
</head>

<SCRIPT language="JavaScript">
	function updateECard()
	{
		var cardField = document.getElementById("cardNumber");
		var str = "";
		if (cardField != null) {
			var list;
			var val;
			<c:forEach var="i" begin="1" end="16">
				list = document.getElementById("ecard<c:out value="${i}"/>");
				val = list.options[list.selectedIndex].value;
				str = str + val;
			</c:forEach>
			cardField.value = str;
		}
		
	}

	function validate()
	{
		// Check prepaid cardnumber is 16-digit
		var ok = true;
		var cardField = document.getElementById("cardNumber");
		if (cardField != null) {
			var cardNum = cardField.value;
			if (isNaN(cardNum) || cardNum.length != 16) {
				alert("Prepaid number need to be a 16 digit number");
				ok = false;			
			}
		}
		return ok;
	}
	
	function initPage()
	{
		vcInitPage();
		var cardField = document.getElementById("cardNumber");
		if (cardField != null) {
			cardField.value = '1000103347057880';
		}
	}
</SCRIPT>

<body onload="initPage()">
<CENTER>

<TABLE WIDTH=100%>
<TR>
	<TD ALIGN="left">
		<button class="tdButton" onclick="showHome()"><fmt:message key="button.home"/></button>
	</TD>
	<TD ALIGN="right">
		<button class="tdButton" onclick="showHelp('PrepaidCard')"><fmt:message key="button.help"/></button>
	</TD>		
</TR>
</TABLE>

Enter the 16-digit number written on your prepaid card
<BR>
Prepaid Card Number
<BR>
<FORM action="<c:out value="${param.next}" />" onsubmit="return validate()" method="post">
<input type="hidden" name="pay" value="<c:out value="ECARD"/>" >
<input type="text" name="cnumber" id="cardNumber"/>

<c:if test="${onWii}">
<BR><BR>
<c:forEach var="i" begin="1" end="8">
<select size="1" id="ecard<c:out value="${i}"/>" onchange="updateECard()">
	<c:forEach var="j" begin="0" end="9">
		<option><c:out value="${j}"/></option>
	</c:forEach>
</select>
</c:forEach>
<BR>
<c:forEach var="i" begin="9" end="16">
<select size="1" id="ecard<c:out value="${i}"/>" onchange="updateECard()">
	<c:forEach var="j" begin="0" end="9">
		<option><c:out value="${j}"/></option>
	</c:forEach>
</select>
</c:forEach>
</c:if>

<BR><BR>
<button type="button" onclick="showHome()" id="ReturnButton"><fmt:message key="button.back"/></button>
<input type="submit" name="OK" value="OK" />
</FORM>
</CENTER>
</body>
</html>