<%@ include file="Common.jspf" %>

<html>
<head>
  <%@ include file="Header.jspf" %>
  <title>Title Details</title>
</head>

<jsp:useBean id="titleDetails" class="com.broadon.cas.TitleDetailBean" scope="request">
</jsp:useBean>

<SCRIPT language="JavaScript">
function confirmPurchase()
{
	document.getElementById("TitlePurchaseDetails").style.display='none';
	document.getElementById("ConfirmDetails").style.display='';
	document.getElementById("Purchase").style.display='none';
}

function confirmPurchaseYes()
{
	document.getElementById("TitlePurchaseDetails").style.display='';
	document.getElementById("ConfirmDetails").style.display='none';
	purchase('<c:out value="${titleDetails.titleId}"/>');
}

function confirmPurchaseNo()
{
	document.getElementById("TitlePurchaseDetails").style.display='';
	document.getElementById("ConfirmDetails").style.display='none';
	document.getElementById("Purchase").style.display='';
}

function initPage()
{
	var r = ec.getDeviceInfo();
	var titleSize = '<c:out value="${titleDetails.title.titleSize}" />';
	var titlePoints = '<c:out value="${titleDetails.title.itemPrice}" />';
	
	document.getElementById("totalSpace").innerHTML = r.totalBlocks;
	document.getElementById("remainingSpace").innerHTML = r.totalBlocks - r.usedBlocks;
	document.getElementById("currentBalance").innerHTML = EC_getPoints();

	document.getElementById("space1").innerHTML = r.totalBlocks - r.usedBlocks;
	document.getElementById("space2").innerHTML = r.totalBlocks - r.usedBlocks - titleSize;
	document.getElementById("balance1").innerHTML = EC_getPoints();
	document.getElementById("balance2").innerHTML = EC_getPoints() - titlePoints;

	showPurchaseButtons('<c:out value="${titleDetails.titleId}"/>', '<c:out value="${titleDetails.title.itemPrice}"/>');
	document.getElementById("TitlePurchaseDetails").style.display='';
	document.getElementById("ConfirmDetails").style.display='none';
}
</SCRIPT>

<body onload="initPage()">
<CENTER>
<TABLE WIDTH=100%>
<TR>
	<TD ALIGN="left">
		<button class="tdButton" onclick="showHome()"><fmt:message key="all.home"/></button>
	</TD>
	<TD ALIGN="right">
		<button class="tdButton" onclick="showHelp('TitleDetails')"><fmt:message key="all.help"/></button>
	</TD>		
</TR>
</TABLE>
</CENTER>

<H1><CENTER><c:out value="${titleDetails.title.name}" /></CENTER></H1>
<P></P>

<CENTER>

<div id="TitlePurchaseDetails">
<TABLE cellpadding="5" width=90%>
<TR>
<TD>
Total Capacity: <span id="totalSpace"></span>
<br>
Remaining Capacity: <span id="remainingSpace"></span>
</TD> 
<TD>
Current balance: <span id="currentBalance"></span>
</TD>
</TR>
</TABLE>
</div>

<TABLE cellpadding="5" width=90%>
<TR>
<TD align="left" width=25%><c:out value="${titleDetails.title.platform}" /></TD>
<TD valign="top" rowspan="5" width=55%>
	<c:out value="${titleDetails.title.description}" />
</TD>
<TD rowspan="5">
	<img src="<c:out value="${titlesPath}"/>/<c:out value="${titleDetails.title.titleId}" />/a.jpg">
	<BR><BR>
	<c:set var="ratings" value="${titleDetails.title.ratings}" />
	<c:forEach var="rating" items="${ratings}">
		<img src="<c:out value="${imagesPath}"/>/<c:out value="${rating.system}_${rating.value}" />.gif"
			alt="<c:out value="${rating.system} ${rating.value}" />">
		</img>	
		<BR>	
		Age: <c:out value="${rating.age}" />
	</c:forEach>	
</TD>
</TR>
<TR>
<TD>Seller: <c:out value="${titleDetails.title.seller}" /></TD>
</TR>
<TR valign="middle">
<TD>Data size: <c:out value="${titleDetails.title.titleSize}" /></TD>
</TR>
<TR>
<TD>On sale: <fmt:formatDate value="${titleDetails.title.saleDate}" type="date" dateStyle=
  "short" /> </TD>
</TR>
<TR>
<TD>Type: <c:out value="${titleDetails.title.licenseType}"/> </TD>
</TR>
<TR>
<TD>Required points: <c:out value="${titleDetails.title.itemPrice}"/> </TD>
</TR>
</TABLE>

<BR><BR>

<div id="ConfirmDetails">
<TABLE cellpadding="5" width=90%>
<TR>
<TD>Before download:</TD>
<TD>Points: <span id="balance1"></span></TD>
<TD>Available storage: <span id="space1"></span></TD>
</TR>
<TR>
<TD>After download:</TD>
<TD>Points: <span id="balance2"></span></TD>
<TD>Available storage: <span id="space2"></span></TD>
<TD>
</TR>
</TABLE>
<BR><BR>
Are you sure you want to purchase?<BR>
<button class="tdButton" onclick="confirmPurchaseYes()">Yes</button>
<button class="tdButton" onclick="confirmPurchaseNo()">No</button>
</div>

<span id="Download"><button class="tdButton" onclick="download(<c:out value="${titleDetails.titleId}"/>)">Re-Download</button></span>
<span id="Purchase"><button class="tdButton" onclick="confirmPurchase()">Purchase</button></span>
<span id="AddPoints"><button class="tdButton" onclick="window.location='AddPoints.jsp'">Add Points</button></span>
<%@ include file="Progress.jspf" %>
<br>
<button class="tdbutton" onclick="showBack()"><fmt:message key="all.back"/></button>

</CENTER>

</body>
</html>