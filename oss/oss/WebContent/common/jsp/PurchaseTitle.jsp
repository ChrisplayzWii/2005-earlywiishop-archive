<%@ include file="TitleDetails.jspf" %>

<c:set var="buyPricing" value="${titleDetails.permanentLicensePricing}"/>
<c:set var="rentPricing" value="${titleDetails.rentalLicensePricing}"/>

<c:if test="${not empty rentPricing}">
	<c:forEach var="limit" items="${rentPricing.limits}">
		<c:choose>
			<c:when test="${limit.code eq 'TR'}">
				<fmt:message var="rentLimit" key="purchaseTitle.limit.TR">
					<fmt:param value="${limit.value/60}"/>
				</fmt:message>
			</c:when>
		</c:choose>
	</c:forEach>
</c:if>	

<c:url var="addPointsUrl" value="AddPoints.jsp"/>
<c:url var="titleDetailsUrl" value="TitleDetails.jsp">
	<c:param name="titleId" value="${title.titleId}" />
</c:url>
<c:url var="downloadTitleUrl" value="DownloadTitle.jsp">
	<c:param name="titleId" value="${title.titleId}" />
</c:url>
<c:url var="rentTitleUrl" value="${downloadTitleUrl}">
	<c:param name="itemId" value="${rentPricing.itemId}" />
</c:url>
<c:url var="buyTitleUrl" value="${downloadTitleUrl}">
	<c:param name="itemId" value="${buyPricing.itemId}" />
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
.style1 {color: #FFFFFF}
.style3 {color: #FFFFFF; font-size: 16px; }
.style4 {
	color: #CCFF00;
	font-weight: bold;
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
	left:32px;
	top:248px;
	width:208px;
	height:104px;
	z-index:5;
<c:if test="${empty buyPricing}">
	visibility: hidden;	
</c:if>
}
#RentBtnBase {
	position:absolute;
	left:264px;
	top:248px;
	width:320px;
	height:104px;
	z-index:8;
<c:if test="${empty rentPricing}">
	visibility: hidden;	
</c:if>		
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
.style6 {font-size: 24px; color: #FFFFFF; }
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
.style8 {font-size: 24px; color: #FFFFFF; font-weight: bold; }
#BuyBtn {
	position:absolute;
	left:32px;
	top:248px;
	width:200px;
	height:96px;
	z-index:6;
<c:if test="${empty buyPricing}">
	visibility: hidden;	
</c:if>
}
#RentBtn {
	position:absolute;
	left:264px;
	top:248px;
	width:312px;
	height:96px;
	z-index:10;
<c:if test="${empty rentPricing}">
	visibility: hidden;	
</c:if>
}
#ScreenShot {
	position:absolute;
	left:24px;
	top:36px;
	width:168px;
	height:128px;
	z-index:11;
}
-->
</style>
<script type="text/JavaScript">
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
	MM_preloadImages('<c:out value="${imagesPath}"/>/Pic_Button/under_btn_on.png','<c:out value="${imagesPath}"/>/Pic_Button/buy_btn_on.png','<c:out value="${imagesPath}"/>/Pic_Button/rent_btn_on.png');
	document.getElementById("CurrentBalance").innerHTML = vcGetBalance();
	
	var titleLicense = vcGetTitleLicense('<c:out value="${title.titleId}"/>');
	if (titleLicense == "Unlimited") {
		// Already own this title - don't need to show purchase button, only need to show re-download button
		//document.getElementById("BuyBtnBase").style.display = 'none';
		//document.getElementById("BuyBtn").style.display = 'none';
		document.getElementById("BuyMess").innerHTML = 'Re-Download';
		document.getElementById("BuyPrice").innerHTML = '';
		document.getElementById("BuyAnchor").href = "<c:out value="${downloadTitleUrl}"/>";

		document.getElementById("RentBtnBase").style.display = 'none';
		document.getElementById("RentBtn").style.display = 'none';
	} else 	if (titleLicense == "Limited") {
		// Have limited license, don't show rent button, show re-download button
		//document.getElementById("RentBtnBase").style.display = 'none';
		//document.getElementById("RentBtn").style.display = 'none';
		document.getElementById("RentMess").innerHTML = 'Re-Download';
		document.getElementById("RentPrice").innerHTML = '';
		document.getElementById("RentAnchor").href = "<c:out value="${downloadTitleUrl}"/>";
 	}	
}
//-->
</script>
</head>

<body onload="initPage()">
<div id="RentBtnBase">
  <div id="RentPrice">
    <div align="center"><strong><c:out value="${rentLimit}"/>/<fmt:message key="all.npoints"><fmt:param value="${rentPricing.itemPrice}"/></fmt:message>
	</strong></div>

  </div>
  <div id="RentMess" align="center" class="style8">
  	<fmt:message key="purchaseTitle.rental"/>
  </div>
<img src="<c:out value="${imagesPath}"/>/Pic_Button/rent_btn_base.gif" width="316" height="100" /></div>
<div id="UnderBtnL"><a href="<c:out value="${addPointsUrl}"/>" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image13','','<c:out value="${imagesPath}"/>/Pic_Button/under_btn_on.png',1)"><img src="<c:out value="${imagesPath}"/>/Pic_Button/plus_points_btn_off.png" name="Image13" width="192" height="56" border="0" id="Image13" /></a><a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image6','','<c:out value="${imagesPath}"/>/Pic_Button/under_btn_on.png',1)"></a></div>
<div id="UnderBtnC"><a onClick="showBack()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image7','','<c:out value="${imagesPath}"/>/Pic_Button/under_btn_on.png',1)"><img src="<c:out value="${imagesPath}"/>/Pic_Button/under_btn_off.png" name="Image7" width="192" height="56" border="0" id="Image7" /></a></div>
<div id="UnderBtnR"><a href="<c:out value="${titleDetailsUrl}"/>" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image8','','<c:out value="${imagesPath}"/>/Pic_Button/under_btn_on.png',1)"><img src="<c:out value="${imagesPath}"/>/Pic_Button/under_btn_off.png" name="Image8" width="192" height="56" border="0" id="Image8" /></a></div>
<div id="BuyBtnBase">
  <div id="BuyPrice">
    <div align="center"><strong>
    	<fmt:message key="all.npoints"><fmt:param value="${buyPricing.itemPrice}"/></fmt:message>
    </strong></div>

  </div>
  <div id="BuyMess" align="center"  class="style6">
  	<fmt:message key="purchaseTitle.purchase"/>
  </div>
<img src="<c:out value="${imagesPath}"/>/Pic_Button/buy_btn_base.gif" width="204" height="100" /></div>
<div id="BuyBtn"><a id="BuyAnchor" href="<c:out value="${buyTitleUrl}"/>" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image11','','<c:out value="${imagesPath}"/>/Pic_Button/buy_btn_on.png',1)"><img src="<c:out value="${imagesPath}"/>/Pic_Button/buy_btn_off.png" name="Image11" width="204" height="100" border="0" id="Image11" /></a></div>
<div id="RentBtn"><a id="RentAnchor" href="<c:out value="${rentTitleUrl}"/>" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image12','','<c:out value="${imagesPath}"/>/Pic_Button/rent_btn_on.png',1)"><img src="<c:out value="${imagesPath}"/>/Pic_Button/rent_btn_off.png" name="Image12" width="316" height="100" border="0" id="Image12" /></a></div>
<div id="ScreenShot"><img src="<c:out value="${ccsPath}/${title.titleId}/${title.contents['IMG.DL01']}"/>" width="168" height="128" alt="Screen Shot 1"/></div>
<table width="608" border="0" cellpadding="0" cellspacing="0">
  <!--DWLayoutTable-->
  <tr>

    <td width="16" height="33">&nbsp;</td>
    <td width="8">&nbsp;</td>
    <td width="152">&nbsp;</td>
    <td width="8">&nbsp;</td>
    <td width="16">&nbsp;</td>
    <td width="24">&nbsp;</td>
    <td width="16">&nbsp;</td>
    <td width="72">&nbsp;</td>
    <td width="56">&nbsp;</td>

    <td width="16">&nbsp;</td>
    <td width="40">&nbsp;</td>
    <td width="104">&nbsp;</td>
    <td width="56">&nbsp;</td>
    <td width="8">&nbsp;</td>
    <td width="16">&nbsp;</td>
  </tr>
  
  <tr>
    <td height="44"></td>

    <td colspan="4" valign="top" background="<c:out value='${colorCtrl}'/>"><!--DWLayoutEmptyCell-->&nbsp;</td>
    <td colspan="8" valign="middle" background="<c:out value='${colorCtrl}'/>"><span class="style1"><c:out value="${msgCtrl}"/></span></td>
    <td valign="top" background="<c:out value='${colorCtrl}'/>"><!--DWLayoutEmptyCell-->&nbsp;</td>
    <td></td>
  </tr>
  <tr>
    <td height="22"></td>

    <td colspan="4" rowspan="4" valign="top" background="<c:out value='${colorPlatform}'/>"><!--DWLayoutEmptyCell-->&nbsp;</td>
  	<td colspan="4" valign="middle" background="<c:out value='${colorPlatform}'/>">
  		<span class="style3"><c:out value="${msgReleaseDate}"/></span></td>
    <td colspan="3" rowspan="3" align="right" valign="middle" background="<c:out value='${colorPlatform}'/>">
    	<c:forEach var="cd" items="${rating.contentDescriptors}">
    		<fmt:formatNumber pattern="00" var="index" value="${cd.code}"/>
    		<img src="<c:out value="${ratingImagePath}/cd${index}.gif"/>" 
    			 alt="<c:out value="${cd.description}"/>" />
		</c:forEach>    	
	</td>
    <td rowspan="3" align="center" valign="middle" background="<c:out value='${colorPlatform}'/>">
    	<img src="<c:out value="${ratingImageFile}"/>" 
    		alt="<c:out value="${rating.system} ${rating.value}"/>" height="48" /></td>
    <td rowspan="3" valign="top" background="<c:out value='${colorPlatform}'/>"><!--DWLayoutEmptyCell-->&nbsp;</td>
    <td></td>
  </tr>

  
  <tr>
    <td height="24"></td>
    <td colspan="4" valign="middle" background="<c:out value='${colorPlatform}'/>"><span class="style3">
    	<fmt:message key="${title.publisher}" /></span></td>
    <td></td>
  </tr>
  <tr>
    <td height="22"></td>
    <td colspan="4" valign="middle" background="<c:out value='${colorPlatform}'/>"><span class="style3"><c:out value="${msgPlayers}"/> 
		<c:if test="${not empty title.genres}">
	   		<c:forEach var="genre" items="${title.genres}">
	        	<fmt:message key="${genre}" />
			</c:forEach>			        	
	    </c:if>
	</span></td>

    <td></td>
  </tr>
  <tr>
    <td height="22"></td>
    <td colspan="8" align="right" valign="middle" background="<c:out value='${colorPlatform}'/>"><div align="right"><span class="style4"><fmt:message key="${title.platform}" /></span></div></td>
    <td valign="top" background="<c:out value='${colorPlatform}'/>"><!--DWLayoutEmptyCell-->&nbsp;</td>
    <td></td>
  </tr>

  
  <tr>
    <td height="72"></td>
    <td valign="top" background="<c:out value="${imagesPath}"/>/Pic_Material/Color_List_White.gif"><!--DWLayoutEmptyCell-->&nbsp;</td>
    <td colspan="11" valign="middle" background="<c:out value="${imagesPath}"/>/Pic_Material/Color_List_White.gif"><div align="center"><span class="style5"><c:out value="${title.name}"/></span></div></td>
    <td valign="top" background="<c:out value="${imagesPath}"/>/Pic_Material/Color_List_White.gif"><!--DWLayoutEmptyCell-->&nbsp;</td>
    <td></td>
  </tr>

  <tr>
    <td height="124"></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>

    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td></td>
  </tr>
  
  
  
  <tr>

    <td height="22"></td>
    <td background="<c:out value="${imagesPath}"/>/Pic_Material/Color_Green.gif">&nbsp;</td>
    <td align="center" valign="middle" background="<c:out value="${imagesPath}"/>/Pic_Material/Color_Green.gif"><fmt:message key="all.currentBalance"/></td>
    <td colspan="4" align="center" valign="middle" background="<c:out value="${imagesPath}"/>/Pic_Material/Color_White.gif"><span id="CurrentBalance" ></span></td>
    <td valign="top" background="<c:out value="${imagesPath}"/>/Pic_Material/Color_White.gif"><fmt:message key="all.points"/></td>
    <td>&nbsp;</td>
    <td></td>

    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
  </tr>
  <tr>
    <td height="22"></td>
    <td>&nbsp;</td>

    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td></td>
    <td></td>

    <td></td>
    <td></td>
    <td></td>
    <td></td>
  </tr>
  <tr>
    <td height="24"></td>
    <td>&nbsp;</td>
    <td colspan="2" align="center" valign="top"><strong><fmt:message key="button.addPoints"/></strong></td>

    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td colspan="4" align="center" valign="top"><strong><fmt:message key="button.listTitles"/></strong></td>
    <td>&nbsp;</td>
    <td colspan="2" align="center" valign="top"><strong><fmt:message key="button.moreInfo"/></strong></td>
    <td></td>
    <td></td>
  </tr>

  
  <tr>
    <td height="83"></td>
    <td></td>
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
    <td></td>
  </tr>
</table>

</body>
</html>
