<%@ include file="TitleDetails.jspf" %>

<c:set var="pricing" value="${titleDetails.pricing}"/>

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
#BuyBtnClick {
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
	left:18px;
	top:320px;
	width:576px;
	height:24px;
	z-index:3;
	background-image: url(<c:out value="${colorCtrl}"/>);
}
.style6 {
	color: #FFFFFF;
	font-weight: bold;
	height: 24px;
}
.style7 {font-size: 16px}
#YesBtnBase {
	position:absolute;
	left:64px;
	top:296px;
	width:208px;
	height:80px;
	z-index:4;
	background-image: url(<c:out value="${imagesPath}"/>/Pic_Button/red_btn01_base.gif);
	background-repeat: no-repeat;
	font-family: "FOT-ロダンNTLG Pro M";
	font-size: 24px;
	line-height: 64px;
	font-weight: bold;
	color: #FFFFFF;
}
#NoBtnBase {
	position:absolute;
	left:344px;
	top:296px;
	width:208px;
	height:80px;
	z-index:6;
	background-image: url(<c:out value="${imagesPath}"/>/Pic_Button/blue_btn01_base.gif);
	background-repeat: no-repeat;
	font-family: "FOT-ロダンNTLG Pro M";
	font-size: 24px;
	line-height: 64px;
	font-weight: bold;
	color: #FFFFFF;
}
.style8 {
	color: #FFFFFF;
	font-weight: bold;
	font-size: 24px;
	height: 72px;
}
#YesBtn {
	position:absolute;
	left:0px;
	top:0px;
	width:200px;
	height:72px;
	z-index:4;
}
#NoBtn {
	position:absolute;
	left:0px;
	top:0px;
	width:200px;
	height:72px;
	z-index:6;
}
#BigLeftBtnBase {
	position:absolute;
	left:24px;
	top:248px;
	width:260px;
	height:76px;
	z-index:3;
	background-image: url(<c:out value="${imagesPath}"/>/Pic_Button/red_btn02_base.gif);
	background-repeat: no-repeat;
	font-family: "FOT-ロダンNTLG Pro M";
	font-size: 24px;
	line-height: 72px;
	font-weight: bold;
	color: #FFFFFF;
}
#BigRightBtnBase {
	position:absolute;
	left:320px;
	top:248px;
	width:260px;
	height:76px;
	z-index:5;
	background-image: url(<c:out value="${imagesPath}"/>/Pic_Button/blue_btn02_base.gif);
	background-repeat: no-repeat;
	font-family: "FOT-ロダンNTLG Pro M";
	font-size: 24px;
	line-height: 72px;
	font-weight: bold;
	color: #FFFFFF;
}
#BigLeftBtn {
	position:absolute;
	left:0px;
	top:0px;
	width:260px;
	height:76px;
	z-index:3;
}
#BigRightBtn {
	position:absolute;
	left:0px;
	top:0px;
	width:260px;
	height:76px;
	z-index:5;
}
#Progress {
	position:absolute;
	left:112px;
	top:264px;
	width:384px;
	height:32px;
	z-index:48;
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

var titleId = '<c:out value="${titleDetails.titleId}"/>';
var titleSize = '<c:out value="${title.titleSize}" />';
var titlePoints = '<c:out value="${pricing.itemPrice}" />';

function purchaseTitle(titleId, itemId, price, limits)
{
	var msg;
    if (titleId == null) {
    	setErr ( "ERROR: download:  No selected title");
    } else {
    	trace("Item id is " + itemId);
		var payment = new ECAccountPayment(); // buy with points
		var progress = ec.purchaseTitle (titleId, itemId, price, payment, limits);
                                                 
      	opName  = "Purchase Title";
        opDesc  = "Purchasing Title  " + titleId;
        if ( wasOpStarted (progress, opDesc)) {
    	    showProgress(true, opName, opDesc, "onPurchaseDone");
        } else {
        	onPurchaseDone(progress);
        }
	}
}

function onPurchaseDone (progress)
{
    trace("onPurchaseDone");
    onDownloadDone(progress);
}

function  onDownloadDone (progress)
{
	showResult (progress, opName, opDesc);
    finishOnOpDone ();    
    if (progress.status >= 0) {
		document.getElementById("StatusMsg").innerHTML='<fmt:message key="downloadTitle.downloadSuccessful"/>';
		document.getElementById("BigLeftBtnLabel").innerHTML='<fmt:message key="downloadTitle.vcHome"/>';
		document.getElementById("BigLeftBtnAnchor").href='javascript:showHome()';
		document.getElementById("BigRightBtnLabel").innerHTML='<fmt:message key="downloadTitle.launchTitle"/>';
		document.getElementById("BigRightBtnAnchor").href='javascript:launchTitle()';
	} else {
		var errMsg = errString(progress.status);
		if (progress.errInfo != null) {
			errMsg = errMsg + ": " + progress.errInfo;
		}
		document.getElementById("StatusMsg").innerHTML='<fmt:message key="downloadTitle.downloadFailed"/>'
			+ '<BR>' + errMsg;		
		document.getElementById("BigLeftBtnLabel").innerHTML='Retry';
		document.getElementById("BigLeftBtnAnchor").href='javascript:confirmPurchaseYes()';
		document.getElementById("BigRightBtnLabel").innerHTML='Back';
		document.getElementById("BigRightBtnAnchor").href='javascript:initPage()';
	}
	document.getElementById("Progress").style.display='none';
	document.getElementById("BigLeftBtnBase").style.display='';
	document.getElementById("BigRightBtnBase").style.display='';
	document.getElementById("UnderBtnL").style.display='none';
	document.getElementById("UnderBtnLLabel").innerHTML='';
	document.getElementById("UnderBtnC").style.display='';
	document.getElementById("UnderBtnCLabel").innerHTML='<fmt:message key="button.listTitles"/>';
	document.getElementById("UnderBtnCAnchor").href='javascript:listTitles()';
	document.getElementById("UnderBtnR").style.display='none';
	document.getElementById("UnderBtnRLabel").innerHTML='';
//    showPurchaseButtons(titleId);
//    showOwnedTitleInfo(titleId);
	var r = ec.getDeviceInfo();
	var currentBalance = vcGetBalance();
	var availBlocks = r.totalBlocks - r.usedBlocks;
	var availSpace = availBlocks*r.blockSize;
	document.getElementById("RemainingBalance").innerHTML = currentBalance;
	document.getElementById("RemainingAvailableSpace").innerHTML = availSpace/1024;
}

function downloadTitle(titleId)
{
	var msg;
    if (titleId == null) {
    	setErr ( "ERROR: download:  No selected title");
    } else {
        var progress = ec.downloadTitle (titleId);
       	opName = "Download";
        opDesc = "Downloading  "  + titleId;
        if ( wasOpStarted (progress, opDesc)) {
    	    showProgress(true, opName, opDesc, "onDownloadDone");
        } else {
        	onDownloadDone(progress);
        }
    }
}

function launchTitle()
{
	var t = ec.getTitleInfo (titleId);
	if (typeof(t) == "object") {
		ec.launchTitle(t.titleId, t.ticketId);
	}
}

function listTitles()
{
	history.go(-2);
}

function showOwnedTitleInfo(hexTitleId)
{
	var t = ec.getTitleInfo (hexTitleId);
	if (typeof(t) == "object") {
		var info = "License: ";
		// TODO: License Type
		// Has a license for this title
		if (t.limits == null || t.limits.length == 0) {
			// No limits
			info += "Unlimited";
		} else {
			// Has limits
			info += "<TABLE>";
			var i;
			for (i = 0; i < t.limits.length; i++) {
				var limit = t.limits.get(0);
				
				//info += "<TR><TD>" + limit.code + " " + limit.limit + "</TD></TR>";
				if ("TR" == limit.code) {
					limitStr = "Expires after {0} minutes.";
				} else if ("DR" == limit.code) {
					limitStr = "Expired at {0}";
				} else if ("SR" == limit.code) {
					limitStr = "Limited to {0} titles";
				} else {
					limitStr = "Unknown limit code " + limit.code;
				}

				limitStr = limitStr.replace("{0}", limit.limit);
				var consumedStr = " Used " + limit.consumption;
				info += "<TR><TD>" + limitStr + "</TD><TD>" + consumedStr + "<TD></TR>";				
			}
			info += "</TABLE>";
		}		
		document.getElementById("OwnedTitleInfo").innerHTML = info;
	}
}

function getTitleLimit(limitCode, limitValue)
{
	var titleLimit = new ECTitleLimit(limitCode, limitValue, 0);
	return titleLimit;		
}

function confirmPurchaseYes()
{
	document.getElementById("Progress").style.display='';
	
	document.getElementById("BigLeftBtnBase").style.display='none';
	document.getElementById("BigRightBtnBase").style.display='none';
	document.getElementById("YesBtnBase").style.display='none';
	document.getElementById("NoBtnBase").style.display='none';
	
	document.getElementById("StatusMsg").innerHTML='<fmt:message key="downloadTitle.downloading"/>';
	document.getElementById("CtrlElement").style.display='none';
	document.getElementById("ConfirmationElement").style.display='none';
	document.getElementById("TitleUsage").style.display='none';
	document.getElementById("CurrentUsage").style.display='none';
	document.getElementById("SpacerElement").height=132 + 94;

	// Hide bottom buttons	
	document.getElementById("UnderBtnL").style.display='none';
	document.getElementById("UnderBtnLLabel").innerHTML='';
	document.getElementById("UnderBtnC").style.display='none';
	document.getElementById("UnderBtnCLabel").innerHTML='';
	document.getElementById("UnderBtnR").style.display='none';
	document.getElementById("UnderBtnRLabel").innerHTML='';

<c:choose>
<c:when test="${not empty titleDetails.pricing}">	
	var limits = new ECTitleLimits();
	var i = 0;
	var limit;
	<c:forEach var="limit" items="${titleDetails.pricing.limits}">
		limit = getTitleLimit('<c:out value="${limit.code}" />', '<c:out value="${limit.value}" />');
		limits.set(i++, limit);
	</c:forEach>
	limits.length = i;
		
	var price = new ECPrice('<c:out value="${titleDetails.pricing.itemPrice}" />', 
	                        '<c:out value="${titleDetails.pricing.itemCurrency}" />');
	                        		                        	
	purchaseTitle('<c:out value="${titleDetails.titleId}"/>',  
			 	  '<c:out value="${titleDetails.pricing.itemId}" />', 
	  			  price,
	 			  limits);
</c:when>
<c:otherwise>
	downloadTitle('<c:out value="${titleDetails.titleId}"/>');
</c:otherwise>
</c:choose>	
}

function confirmPurchaseNo()
{
	showBack();
}

function initPage()
{
 	vcInitPage();
	MM_preloadImages('<c:out value="${imagesPath}"/>/Pic_Button/under_btn_on.png','<c:out value="${imagesPath}"/>/Pic_Button/yes_no_btn_on.png');
 	// show confirmation buttons and progress
	document.getElementById("BigLeftBtnBase").style.display='none';
	document.getElementById("BigRightBtnBase").style.display='none';
	document.getElementById("Progress").style.display='none';
	document.getElementById("StatusMsg").innerHTML='<fmt:message key="downloadTitle.downloadMsg"/>';
	document.getElementById("YesBtnBase").style.display='';
	document.getElementById("NoBtnBase").style.display='';

	document.getElementById("CtrlElement").style.display='';
	document.getElementById("ConfirmationElement").style.display='';
	document.getElementById("TitleUsage").style.display='';
	document.getElementById("CurrentUsage").style.display='';
	document.getElementById("RemainingUsage").style.display='';
	document.getElementById("SpacerElement").height=132;

	// show bottom buttons	
	document.getElementById("UnderBtnL").style.display='';
	document.getElementById("UnderBtnLLabel").innerHTML='<fmt:message key="button.listTitles"/>';
	document.getElementById("UnderBtnLAnchor").href='javascript:listTitles()';
	document.getElementById("UnderBtnC").style.display='';
	document.getElementById("UnderBtnCLabel").innerHTML='<fmt:message key="button.prevPage"/>';
	document.getElementById("UnderBtnCAnchor").href='javascript:showBack()';
	document.getElementById("UnderBtnR").style.display='none';

	// show points and space
	var r = ec.getDeviceInfo();
	var currentBalance = vcGetBalance();
	var availBlocks = r.totalBlocks - r.usedBlocks;
	var availSpace = availBlocks*r.blockSize;
	document.getElementById("CurrentBalance").innerHTML = currentBalance;
	document.getElementById("TitlePoints").innerHTML = titlePoints;
	document.getElementById("RemainingBalance").innerHTML = currentBalance - titlePoints;
	document.getElementById("CurrentAvailableSpace").innerHTML = (availSpace)/1024;
	document.getElementById("TitleSize").innerHTML = (titleSize)/1024;
	document.getElementById("RemainingAvailableSpace").innerHTML = (availSpace - titleSize)/1024;
	document.getElementById("BigLeftBtnBase").style.display='none';
	document.getElementById("BigRightBtnBase").style.display='none';
}
//-->
</script>
</head>

<body onload="initPage()">
<div id="UnderBtnL"><a id="UnderBtnLAnchor" href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3','','<c:out value="${imagesPath}"/>/Pic_Button/under_btn_on.png',1)"><img src="<c:out value="${imagesPath}"/>/Pic_Button/under_btn_off.png" name="Image3" width="192" height="56" border="0" id="Image3" /></a><a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image13','','<c:out value="${imagesPath}"/>/Pic_Button/under_btn_on.png',1)"></a><a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image6','','<c:out value="${imagesPath}"/>/Pic_Button/under_btn_on.png',1)"></a></div>
<div id="UnderBtnC"><a id="UnderBtnCAnchor" href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image7','','<c:out value="${imagesPath}"/>/Pic_Button/under_btn_on.png',1)"><img src="<c:out value="${imagesPath}"/>/Pic_Button/under_btn_off.png" name="Image7" width="192" height="56" border="0" id="Image7" /></a></div>
<div id="UnderBtnR"><a id="UnderBtnRAnchor" href="#"  onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image8','','<c:out value="${imagesPath}"/>/Pic_Button/under_btn_on.png',1)"><img src="<c:out value="${imagesPath}"/>/Pic_Button/under_btn_off.png" name="Image8" width="192" height="56" border="0" id="Image8" /></a></div>
<div id="YesBtnBase">
  <div id="YesBtn"><a href="javascript:confirmPurchaseYes()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4','','<c:out value="${imagesPath}"/>/Pic_Button/yes_no_btn_on.png',1)"><img src="<c:out value="${imagesPath}"/>/Pic_Button/yes_no_btn_off.png" name="Image4" width="204" height="76" border="0" id="Image4" /></a></div>

  <div id="YesBtnLabel" align="center" class="style8"><fmt:message key="button.yes"/></div>
</div>
<div id="NoBtnBase">
  <div id="NoBtn"><a href="javascript:confirmPurchaseNo()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image41','','<c:out value="${imagesPath}"/>/Pic_Button/yes_no_btn_on.png',1)"><img src="<c:out value="${imagesPath}"/>/Pic_Button/yes_no_btn_off.png" name="Image41" width="204" height="76" border="0" id="Image41" /></a></div>
  <div id="NoBtnLabel" align="center" class="style8"><fmt:message key="button.no"/></div>
</div>
<div id="BigLeftBtnBase" style="display:none">
  <div id="BigLeftBtn">
  	<a id="BigLeftBtnAnchor" href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image5','','<c:out value="${imagesPath}"/>/Pic_Button/blue_btn02_on.png',1)"><img src="<c:out value="${imagesPath}"/>/Pic_Button/blue_btn02_off.png" name="Image5" width="260" height="76" border="0" id="Image5" /></a></div>

  <div id="BigLeftBtnLabel" align="center" class="style8"><fmt:message key="downloadTitle.vcHome"/></div>
</div>
<div id="BigRightBtnBase" style="display:none">
  <div id="BigRightBtn"><a id="BigRightBtnAnchor" href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image51','','<c:out value="${imagesPath}"/>/Pic_Button/blue_btn02_on.png',1)"><img src="<c:out value="${imagesPath}"/>/Pic_Button/blue_btn02_off.png" name="Image51" width="260" height="76" border="0" id="Image51" /></a></div>
  <div id="BigRightBtnLabel" align="center" class="style8"></div>
</div>
<table width="608" border="0" cellpadding="0" cellspacing="0">
  <!--DWLayoutTable-->
  <tr id="StatusElement">
    <td width="16" height="65"></td>

    <td width="8" valign="top" background="<c:out value="${colorCtrl}"/>"><!--DWLayoutEmptyCell-->&nbsp;</td>
    <td colspan="11" valign="bottom" background="<c:out value="${colorCtrl}"/>"><div id="StatusMsg" align="center" class="style6">
    	<fmt:message key="downloadTitle.downloadMsg"/></div></td>
    <td width="8" valign="top" background="<c:out value="${colorCtrl}"/>"><!--DWLayoutEmptyCell-->&nbsp;</td>
    <td width="16"></td>
  </tr>
  <tr>
    <td height="22"></td>
    <td colspan="12" align="right" valign="middle" background="<c:out value="${colorPlatform}"/>"><div align="right"><span class="style4"><fmt:message key="${title.platform}"/></span></div></td>

    <td valign="top" background="<c:out value="${colorPlatform}"/>"><!--DWLayoutEmptyCell-->&nbsp;</td>
    <td></td>
  </tr>
  <tr>
    <td height="72"></td>
    <td valign="top" background="<c:out value="${imagesPath}"/>/Pic_Material/Color_List_White.gif"><!--DWLayoutEmptyCell-->&nbsp;</td>
    <td colspan="11" valign="middle" background="<c:out value="${imagesPath}"/>/Pic_Material/Color_List_White.gif"><div align="center"><span class="style5">
    <c:out value="${title.name}"/></span></div></td>

    <td valign="top" background="<c:out value="${imagesPath}"/>/Pic_Material/Color_List_White.gif"><!--DWLayoutEmptyCell-->&nbsp;</td>
    <td></td>
  </tr>
  <tr id="CtrlElement">
    <td height="22"></td>
    <td valign="top" background="<c:out value="${colorCtrl}"/>"><!--DWLayoutEmptyCell-->&nbsp;</td>
    <td colspan="11" valign="middle" background="<c:out value="${colorCtrl}"/>"><div id="CtrlMsg" align="center" class="style1"><c:out value="${msgCtrl}"/></div></td>
    <td valign="top" background="<c:out value="${colorCtrl}"/>"><!--DWLayoutEmptyCell-->&nbsp;</td>

    <td></td>
  </tr>
  
  <tr id="CurrentUsage">
    <td height="24"></td>
    <td valign="top" background="<c:out value="${imagesPath}"/>/Pic_Material/Color_keisan_green_s.gif"><!--DWLayoutEmptyCell-->&nbsp;</td>
    <td width="144" align="left" valign="middle" background="<c:out value="${imagesPath}"/>/Pic_Material/Color_keisan_green_s.gif"><span class="style7"><fmt:message key="downloadTitle.currentBalance"/></span></td>
    <td colspan="2" align="right" valign="middle" background="<c:out value="${imagesPath}"/>/Pic_Material/Color_keisan_green_s.gif"><div align="right"><span class="style7" id="CurrentBalance"></span></div></td>
    <td colspan="2" align="left" valign="middle" background="<c:out value="${imagesPath}"/>/Pic_Material/Color_keisan_green_s.gif"><span class="style7"><fmt:message key="all.points"/></span></td>

    <td width="16" rowspan="3" valign="top" background="<c:out value="${imagesPath}"/>/Pic_Material/Color_keisan_center.gif"><!--DWLayoutEmptyCell-->&nbsp;</td>
    <td colspan="3" align="left" valign="middle" background="<c:out value="${imagesPath}"/>/Pic_Material/Color_keisan_blue_s.gif"><span class="style7"><fmt:message key="downloadTitle.currentAvailableSpace"/></span></td>
    <td align="right" valign="middle" background="<c:out value="${imagesPath}"/>/Pic_Material/Color_keisan_blue_s.gif"><div align="right"><span class="style7" id="CurrentAvailableSpace"></span></div></td>
    <td width="49" align="center" valign="middle" background="<c:out value="${imagesPath}"/>/Pic_Material/Color_keisan_blue_s.gif"><span class="style7">Kbyte</span></td>
    <td valign="top" background="<c:out value="${imagesPath}"/>/Pic_Material/Color_keisan_blue_s.gif"><!--DWLayoutEmptyCell-->&nbsp;</td>
    <td></td>
  </tr>

  
  <tr id="TitleUsage">
    <td height="24"></td>
    <td valign="top" background="<c:out value="${imagesPath}"/>/Pic_Material/Color_keisan_right_green.gif"><!--DWLayoutEmptyCell-->&nbsp;</td>
    <td align="left" valign="middle" background="<c:out value="${imagesPath}"/>/Pic_Material/Color_keisan_right_green.gif"><span class="style7"><fmt:message key="downloadTitle.usedPoints"/></span></td>
    <td colspan="2" align="right" valign="middle" background="<c:out value="${imagesPath}"/>/Pic_Material/Color_keisan_right_green.gif"><div align="right"><span class="style7" id="TitlePoints"></span></div></td>
    <td colspan="2" align="left" valign="middle" background="<c:out value="${imagesPath}"/>/Pic_Material/Color_keisan_right_green.gif"><span class="style7"><fmt:message key="all.points"/></span></td>
    <td colspan="3" align="left" valign="middle" background="<c:out value="${imagesPath}"/>/Pic_Material/Color_keisan_right_blue.gif"><span class="style7"><fmt:message key="downloadTitle.usedSpace"/></span></td>

    <td align="right" valign="middle" background="<c:out value="${imagesPath}"/>/Pic_Material/Color_keisan_right_blue.gif"><div align="right"><span class="style7" id="TitleSize"></span></div></td>
    <td align="center" valign="middle" background="<c:out value="${imagesPath}"/>/Pic_Material/Color_keisan_right_blue.gif"><span class="style7">Kbyte</span></td>
    <td valign="top" background="<c:out value="${imagesPath}"/>/Pic_Material/Color_keisan_right_blue.gif"><!--DWLayoutEmptyCell-->&nbsp;</td>
    <td></td>
  </tr>
  
  <tr id="RemainingUsage">
    <td height="24"></td>
    <td valign="top" background="<c:out value="${imagesPath}"/>/Pic_Material/Color_keisan_green.gif"><!--DWLayoutEmptyCell-->&nbsp;</td>

    <td align="left" valign="middle" background="<c:out value="${imagesPath}"/>/Pic_Material/Color_keisan_green.gif"><span class="style7"><fmt:message key="downloadTitle.remainingBalance"/></span></td>
    <td colspan="2" align="right" valign="middle" background="<c:out value="${imagesPath}"/>/Pic_Material/Color_keisan_green.gif"><div align="right"><span class="style7" id="RemainingBalance"></span></td>
    <td colspan="2" align="left" valign="middle" background="<c:out value="${imagesPath}"/>/Pic_Material/Color_keisan_green.gif"><span class="style7"><fmt:message key="all.points"/></span></td>
    <td colspan="3" align="left" valign="middle" background="<c:out value="${imagesPath}"/>/Pic_Material/Color_keisan_blue.gif"><span class="style7"><fmt:message key="downloadTitle.remainingAvailableSpace"/></span></td>
    <td align="right" valign="middle" background="<c:out value="${imagesPath}"/>/Pic_Material/Color_keisan_blue.gif"><div align="right"><span class="style7" id="RemainingAvailableSpace"></span></div></td>
    <td align="center" valign="middle" background="<c:out value="${imagesPath}"/>/Pic_Material/Color_keisan_blue.gif"><span class="style7">Kbyte</span></td>

    <td valign="top" background="<c:out value="${imagesPath}"/>/Pic_Material/Color_keisan_blue.gif"><!--DWLayoutEmptyCell-->&nbsp;</td>
    <td></td>
  </tr>
  
  <tr id="ConfirmationElement">
    <td height="24"></td>
    <td valign="top" background="<c:out value="${imagesPath}"/>/Pic_Material/Color_Caution.gif"><!--DWLayoutEmptyCell-->&nbsp;</td>
    <td colspan="11" valign="middle" background="<c:out value="${imagesPath}"/>/Pic_Material/Color_Caution.gif"><div id="ConfirmationMsg" align="center" class="style1"><fmt:message key="downloadTitle.confirmMsg"/></div></td>
    <td valign="top" background="<c:out value="${imagesPath}"/>/Pic_Material/Color_Caution.gif"><!--DWLayoutEmptyCell-->&nbsp;</td>

    <td></td>
  </tr>
  
  <tr>
    <td id="SpacerElement" height="132"></td>
    <td></td>
    <td></td>
    <td width="16"></td>
    <td width="32"></td>
    <td width="8"></td>

    <td width="72"></td>
    <td></td>
    <td width="72"></td>
    <td width="40"></td>
    <td width="40"></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>

  </tr>
  
  
  
  <tr>
    <td height="24"></td>
    <td>&nbsp;</td>
    <td colspan="2" align="center" valign="top"><strong>
    	<span id="UnderBtnLLabel"></span></strong></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td colspan="3" align="center" valign="top"><strong>
    	<span id="UnderBtnCLabel"></span></strong></td>

    <td>&nbsp;</td>
    <td colspan="3" align="center" valign="top">
    	<span id="UnderBtnRLabel"><!--DWLayoutEmptyCell-->&nbsp;</span></td>
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
<%@ include file="Progress.jspf" %>

</body>
</html>
