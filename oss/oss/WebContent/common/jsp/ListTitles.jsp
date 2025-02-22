<%@ include file="Common.jspf" %>

<jsp:useBean id="listTitles" class="com.broadon.cas.GameTitleListDetailsBean" scope="request">
</jsp:useBean>

<c:set var="titleCount" value="${listTitles.pageCount}" />
<c:set var="titleFirst" value="${listTitles.firstEntryIndex}" />
<c:set var="titleLast" value="${listTitles.lastEntryIndex}" />

<c:url var="listUrl" value="ListTitles.jsp">
	<c:forEach var="parameter" items="${paramValues}">
		<c:if test="${parameter.key ne 'p'}">
			<c:forEach var="val" items="${parameter.value}">
				<c:param name="${parameter.key}" value="${val}" />
		   </c:forEach>
	   </c:if>
   </c:forEach>
</c:url>

<c:url var="sortUrl" value="SortTitles.jsp">
	<c:forEach var="parameter" items="${paramValues}">
		<c:if test="${parameter.key ne 'p'}">
			<c:forEach var="val" items="${parameter.value}">
				<c:param name="${parameter.key}" value="${val}" />
		   </c:forEach>
	   </c:if>
   </c:forEach>
</c:url>

<c:url var="prevUrl" value="${listUrl}">
	<c:param name="p" value="${listTitles.page-1}" />
</c:url>

<c:url var="nextUrl" value="${listUrl}">
	<c:param name="p" value="${listTitles.page+1}" />
</c:url>

<html>
<head>
  <%@ include file="Header.jspf" %>
<title><fmt:message key="vc.title"/></title>
<style type="text/css">
<!--
body,td,th {
	font-family: FOT-ロダンNTLG Pro M;
	font-size: 18px;
	color: #333333;
}
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-image: url(<c:out value="${imagesPath}"/>/Pic_BG/BG_Multi.gif);
	background-repeat: no-repeat;
}
.style5 {font-size: 24px}
#UnderBtnL {
	position:absolute;
	left:8px;
	top:392px;
	width:192px;
	height:56px;
	z-index:1;
}
#UnderBtnC {
	position:absolute;
	left:208px;
	top:392px;
	width:192px;
	height:56px;
	z-index:2;
}
#UnderBtnR {
	position:absolute;
	left:408px;
	top:392px;
	width:192px;
	height:56px;
	z-index:3;
}
#BuyBtnBase {
	position:absolute;
	left:202px;
	top:248px;
	width:208px;
	height:104px;
	z-index:5;
}
#RentBtnBase {
	position:absolute;
	left:264px;
	top:248px;
	width:320px;
	height:104px;
	z-index:8;
}
#BuyMess {
	position:absolute;
	left:24px;
	top:12px;
	width:152px;
	height:24px;
	z-index:7;
}
#RentMess {
	position:absolute;
	left:24px;
	top:12px;
	width:264px;
	height:24px;
	z-index:10;
}
#BuyPrice {
	position:absolute;
	left:24px;
	top:56px;
	width:152px;
	height:24px;
	z-index:6;
}
#RentPrice {
	position:absolute;
	left:24px;
	top:56px;
	width:264px;
	height:24px;
	z-index:9;
}
#BuyBtn {
	position:absolute;
	left:202px;
	top:248px;
	width:200px;
	height:96px;
	z-index:6;
}
#RentBtnClick {
	position:absolute;
	left:264px;
	top:248px;
	width:312px;
	height:96px;
	z-index:10;
}
#ScreenShot {
	position:absolute;
	left:24px;
	top:36px;
	width:168px;
	height:128px;
	z-index:11;
}
#Layer1 {
	position:absolute;
	left:408px;
	top:242px;
	width:184px;
	height:120px;
	z-index:12;
}
#Layer2 {
	position:absolute;
	left:24px;
	top:56px;
	width:96px;
	height:72px;
	z-index:4;
}
#ScreenShot01 {
	position:absolute;
	left:24px;
	top:36px;
	width:96px;
	height:72px;
	z-index:14;
}
.style6 {color: #FFFFFF}
#ScreenShot02 {
	position:absolute;
	left:24px;
	top:116px;
	width:96px;
	height:72px;
	z-index:11;
}
#ScreenShot03 {
	position:absolute;
	left:24px;
	top:196px;
	width:96px;
	height:72px;
	z-index:8;
}
#ScreenShot04 {
	position:absolute;
	left:24px;
	top:276px;
	width:96px;
	height:72px;
	z-index:5;
}
#List01 {
	position:absolute;
	left:16px;
	top:32px;
	width:576px;
	height:80px;
	z-index:16;
}
#List02 {
	position:absolute;
	left:16px;
	top:112px;
	width:576px;
	height:80px;
	z-index:12;
}
#List03 {
	position:absolute;
	left:16px;
	top:192px;
	width:576px;
	height:80px;
	z-index:10;
}
#List04 {
	position:absolute;
	left:16px;
	top:272px;
	width:576px;
	height:80px;
	z-index:7;
}
#New01 {
	position:absolute;
	left:440px;
	top:32px;
	width:24px;
	height:24px;
	z-index:13;
}
#New02 {
	position:absolute;
	left:440px;
	top:112px;
	width:24px;
	height:24px;
	z-index:9;
}
#New03 {
	position:absolute;
	left:440px;
	top:192px;
	width:24px;
	height:24px;
	z-index:6;
}
#New04 {
	position:absolute;
	left:440px;
	top:272px;
	width:24px;
	height:24px;
	z-index:4;
}
-->
</style>
<script type="text/javascript">
<!--
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}

function initPage()
{
	vcInitPage();
	MM_preloadImages('<c:out value="${imagesPath}"/>/<c:out value="${imagesPath}"/>/Pic_Button/under_btn_on.png','<c:out value="${imagesPath}"/>/Pic_Button/buy_btn_on.png','<c:out value="${imagesPath}"/>/Pic_Button/List_on.png');
	document.getElementById("CurrentBalance").innerHTML = vcGetBalance();
}
//-->
</script>
</head>

<body onload="initPage()">
<div id="UnderBtnL"><a href="<c:out value="${sortUrl}"/>" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3','','<c:out value="${imagesPath}"/>/Pic_Button/under_btn_on.png',1)"><img src="<c:out value="${imagesPath}"/>/Pic_Button/Search_btn_off_s.png" name="Image3" width="192" height="56" border="0" id="Image3" /></a><a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image13','','<c:out value="${imagesPath}"/>/Pic_Button/under_btn_on.png',1)"></a><a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image6','','<c:out value="${imagesPath}"/>/Pic_Button/under_btn_on.png',1)"></a></div>
<c:if test="${listTitles.page > 1}">
<div id="UnderBtnC"><a href="<c:out value="${prevUrl}"/>" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image7','','<c:out value="${imagesPath}"/>/Pic_Button/under_btn_on.png',1)"><img src="<c:out value="${imagesPath}"/>/Pic_Button/under_btn_off.png" name="Image7" width="192" height="56" border="0" id="Image7" /></a></div>
</c:if>
<c:if test="${listTitles.page < listTitles.pageCount}">
<div id="UnderBtnR"><a href="<c:out value="${nextUrl}"/>" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image8','','<c:out value="${imagesPath}"/>/Pic_Button/under_btn_on.png',1)"><img src="<c:out value="${imagesPath}"/>/Pic_Button/under_btn_off.png" name="Image8" width="192" height="56" border="0" id="Image8" /></a></div>
</c:if>

<table width="608" border="0" cellpadding="0" cellspacing="0">
  <!--DWLayoutTable-->
  <tr>
    <td width="16" height="33">&nbsp;</td>
    <td width="8">&nbsp;</td>
    <td width="104">&nbsp;</td>
    <td width="48">&nbsp;</td>
    <td width="8">&nbsp;</td>
    <td width="40">&nbsp;</td>
    <td width="16">&nbsp;</td>
    <td width="73">&nbsp;</td>
    <td width="71">&nbsp;</td>
    <td width="40">&nbsp;</td>
    <td width="16">&nbsp;</td>
    <td width="24">&nbsp;</td>
    <td width="120">&nbsp;</td>
    <td width="8">&nbsp;</td>
    <td width="16">&nbsp;</td>
  </tr>
<c:catch var="error">
  <c:set var="i" value="0"/>
  <c:forEach var="titleDetails" items="${listTitles.titles}">		
    <c:set var="i" value="${i+1}"/>
    <c:set var="title" value="${titleDetails.title}"/>
    <c:set var="pricing" value="${titleDetails.permanentLicensePricing}"/>
	<c:url var="titleDetailsUrl" value="PurchaseTitle.jsp">
		<c:param name="titleId" value="${title.titleId}" />
	</c:url>
	<c:if test="${title.isNew}">
		<div id="<c:out value='New0${i}'/>">
			<img src="<c:out value="${imagesPath}"/>/Pic_Material/New_Release_mark.gif" width="24" height="24" /></div>
	</c:if>	
		<div id="<c:out value='ScreenShot0${i}'/>">
			<img src="<c:out value="${ccsPath}/${title.titleId}/${title.contents['IMG.List']}"/>" width="96" height="72" alt="Title Image"/></div>
  
  <div id="<c:out value='List0${i}'/>">
  	<c:set var="imageName" value="ImageList0${i}" />
  		<a href="<c:out value="${titleDetailsUrl}"/>" onmouseout="MM_swapImgRestore()" 
  			onmouseover="MM_swapImage('<c:out value="${imageName}"/>','','<c:out value="${imagesPath}"/>/Pic_Button/List_on.png',1)">
  		<img src="<c:out value="${imagesPath}"/>/Pic_Button/List_off.png" name="<c:out value="${imageName}"/>" 
  			width="576" height="80" border="0" id="<c:out value="${imageName}"/>" /></a></div>

  <tr>
    <td height="24">&nbsp;</td>
    <td colspan="2" valign="top" background="<c:out value="${imagesPath}"/>/Pic_Material/Color_List_Orange.gif"><!--DWLayoutEmptyCell-->&nbsp;</td>
    <td colspan="8" align="left" valign="middle" background="<c:out value="${imagesPath}"/>/Pic_Material/Color_List_Orange.gif">
    	<fmt:message key="${title.publisher}" /></td>
    <td align="center" valign="middle" background="<c:out value="${imagesPath}"/>/Pic_Material/Color_List_Orange.gif"><!--DWLayoutEmptyCell-->&nbsp;</td>
    
    
  	<c:set var="titleLicenseVar" value="titleLicense0${i}" />
  	<c:set var="priceElement" value="PriceElement0${i}" />
  	<c:set var="priceElementText" value="PriceElementText0${i}" />
    <td id="<c:out value="${priceElement}"/>" align="center" valign="middle" 
    	background="<c:out value="${imagesPath}"/>/Pic_Material/Color_List_Orange.gif">
    	<div id="<c:out value="${priceElementText}"/>" align="center">
    	<c:if test="${not empty pricing}">
    		<fmt:message key="all.npoints"><fmt:param value="${pricing.itemPrice}" /></fmt:message>
    	</c:if></div></td>
    	
<script type="text/JavaScript">
<!--
	var <c:out value="${titleLicenseVar}"/> = vcGetTitleLicense('<c:out value="${title.titleId}"/>');
	if (<c:out value="${titleLicenseVar}"/> == "Unlimited") {
		document.getElementById('<c:out value="${priceElement}"/>').style.background = 'url(<c:out value="${imagesPath}"/>/Pic_Material/Color_List_Red.gif)';
		document.getElementById('<c:out value="${priceElementText}"/>').style.color = '#FFFFFF';
		document.getElementById('<c:out value="${priceElementText}"/>').innerHTML = "<fmt:message key="titleDetails.purchased"/>";
	} else if (<c:out value="${titleLicenseVar}"/> == "Limited") {
		document.getElementById('<c:out value="${priceElement}"/>').style.background = 'url(<c:out value="${imagesPath}"/>/Pic_Material/Color_List_Blue.gif)';
		document.getElementById('<c:out value="${priceElementText}"/>').style.color = '#FFFFFF';
		document.getElementById('<c:out value="${priceElementText}"/>').innerHTML = "<fmt:message key="titleDetails.rented"/>";
	}
//-->
</script>

    <td valign="top" background="<c:out value="${imagesPath}"/>/Pic_Material/Color_List_Orange.gif"><!--DWLayoutEmptyCell-->&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="56"></td>
    <td colspan="2" valign="top" background="<c:out value="${imagesPath}"/>/Pic_Material/Color_List_White_s.gif"><!--DWLayoutEmptyCell-->&nbsp;</td>
    <td colspan="10" align="left" valign="middle" background="<c:out value="${imagesPath}"/>/Pic_Material/Color_List_White_s.gif"><span class="style5"><c:out value="${title.name}" /></span></td>
    <td valign="top" background="<c:out value="${imagesPath}"/>/Pic_Material/Color_List_White_s.gif"><!--DWLayoutEmptyCell-->&nbsp;</td>
    <td></td>
  </tr>
  </c:forEach>
  <c:if test="${i < 4}">
  <tr>
    <td height="<c:out value="${80*(4-i)}"/>"></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td></td>
    <td></td>
    <td></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td></td>
  </tr>
  </c:if>
  
</c:catch>
<c:if test="${not empty error}">
	<c:out value="${error}"/>
</c:if>

  <tr>
    <td height="24"></td>
    <td valign="top" background="<c:out value="${imagesPath}"/>/Pic_Material/Color_Green.gif"><!--DWLayoutEmptyCell-->&nbsp;</td>
    <td colspan="2" align="center" valign="middle" background="<c:out value="${imagesPath}"/>/Pic_Material/Color_Green.gif"><fmt:message key="all.currentBalance"/></td>
    <td colspan="3" align="center" valign="middle" background="<c:out value="${imagesPath}"/>/Pic_Material/Color_White.gif"><span id="CurrentBalance" ></span></td>
    <td align="center" valign="middle" background="<c:out value="${imagesPath}"/>/Pic_Material/Color_White.gif"><fmt:message key="all.points"/></td>
    <td colspan="5" align="right" valign="middle" background="<c:out value="${imagesPath}"/>/Pic_Material/Color_keisan_blue_s.gif">
    	<div align="right">
	    	<c:if test="${listTitles.pageCount > 0}">
		   		<c:out value="${listTitles.page}/${listTitles.pageCount}"/>
	    		<fmt:message key="listTitles.pages"/>
			</c:if>	    		
	    </div></td>
    <td valign="top" background="<c:out value="${imagesPath}"/>/Pic_Material/Color_keisan_blue_s.gif"><!--DWLayoutEmptyCell-->&nbsp;</td>
    <td></td>
  </tr>
  
  <tr>
    <td height="32"></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td></td>
    <td></td>
    <td></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td></td>
  </tr>
  
  <tr>
    <td height="24"></td>
    <td></td>
    <td colspan="3" align="center" valign="top"><strong><fmt:message key="button.sort"/></strong></td>
    <td>&nbsp;</td>
    <td colspan="3" align="center" valign="top">
    	<c:if test="${listTitles.page > 1}">    	
	    	<strong><fmt:message key="button.prevPage"/></strong>
    	</c:if>
	</td>
    <td>&nbsp;</td>
    <td colspan="3" align="center" valign="top">
       	<c:if test="${listTitles.page < listTitles.pageCount}">    	    
	    	<strong><fmt:message key="button.nextPage"/></strong>
    	</c:if>
	</td>
    <td></td>
    <td></td>
  </tr>
  
  <tr>
    <td height="83"></td>
    <td></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
  </tr>
</table>
</body>
</html>
