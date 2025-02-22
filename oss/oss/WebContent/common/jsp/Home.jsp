<%@ include file="Common.jspf" %>
<html>
<head>
  <%@ include file="Header.jspf" %>
  <title><fmt:message key="vc.title"/></title>
<style type="text/css">
<!--
body {
	background-image: url(<c:out value="${imagesPath}"/>/BG_SAMPLE.gif);
	background-repeat: no-repeat;
}
#Layer1 {
	position:absolute;
	left:0px;
	top:93px;
	width:224px;
	height:58px;
	z-index:1;
}
#Layer2 {
	position:absolute;
	left:0px;
	top:156px;
	width:224px;
	height:58px;
	z-index:2;
}
#Layer3 {
	position:absolute;
	left:0px;
	top:219px;
	width:224px;
	height:58px;
	z-index:3;
}
#Layer4 {
	position:absolute;
	left:0px;
	top:282px;
	width:224px;
	height:58px;
	z-index:4;
}
#Layer5 {
	position:absolute;
	left:0px;
	top:345px;
	width:224px;
	height:58px;
	z-index:5;
}
#Layer6 {
	position:absolute;
	left:225px;
	top:98px;
	width:383px;
	height:286px;
	z-index:6;
}
#Layer7 {
	position:absolute;
	left:316px;
	top:385px;
	width:147px;
	height:49px;
	z-index:7;
}
#Layer8 {
	position:absolute;
	left:252px;
	top:141px;
	width:322px;
	height:215px;
	z-index:8;
}
.style4 {font-size: 12px}
#Layer9 {
	position:absolute;
	left:262px;
	top:151px;
	width:303px;
	height:197px;
	z-index:9;
}
#Layer10 {
	position:absolute;
	left:262px;
	top:181px;
	width:22px;
	height:22px;
	z-index:10;
}
#Layer11 {
	position:absolute;
	left:262px;
	top:211px;
	width:22px;
	height:22px;
	z-index:11;
}
#Layer12 {
	position:absolute;
	left:262px;
	top:241px;
	width:22px;
	height:22px;
	z-index:12;
}
-->
</style>
<script type="text/JavaScript">
<!--
function initPage()
{
	vcInitPage();
	ec.refreshCachedBalance();
}
//-->
</script>
</head>

<body onload="initPage()">
<div id="Layer1"><a href="TitleCatalog.jsp" target="_parent"><img src="<c:out value="${imagesPath}"/>/DOWN.gif" alt="Download" width="224" height="58" border="0" /></a></div>
<div id="Layer2"><a href="AddPoints.jsp" target="_parent"><img src="<c:out value="${imagesPath}"/>/ADD_POINTS.gif" alt="Add Points" width="224" height="58" border="0" /></a></div>
<div id="Layer3"><a href="ListTransactions.jsp" target="_parent"><img src="<c:out value="${imagesPath}"/>/HISTORY.gif" alt="Purchase History" width="224" height="58" border="0" /></a></div>
<div id="Layer4"><a href="UseSettings.jsp" target="_parent"><img src="<c:out value="${imagesPath}"/>/SET.gif" alt="Settings" width="224" height="58" border="0" /></a></div>
<div id="Layer5"><img onclick="showHelp('Home')" src="<c:out value="${imagesPath}"/>/HELP.gif" alt="Help" width="224" height="58" border="0" /></a></div>
<div id="Layer6"><img src="<c:out value="${imagesPath}"/>/INFO.gif" width="383" height="286" /></div>
<div id="Layer7"><img onclick="exit()" src="<c:out value="${imagesPath}"/>/EXIT.gif" width="147" height="49" border="0" /></a></div>
<div id="Layer9">
  <p><a href="Message.jsp"><img src="<c:out value="${imagesPath}"/>/INFO_ICON.gif" width="22" height="22" border="0" /> Information No.001</a></p>
  <p><a href="Message.jsp"><img src="<c:out value="${imagesPath}"/>/INFO_ICON.gif" width="22" height="22" border="0" /> Information No.002 </a></p>
</div>

</body>
</html>