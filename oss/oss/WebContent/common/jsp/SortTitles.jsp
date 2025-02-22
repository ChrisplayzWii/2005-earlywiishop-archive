<%@ include file="Common.jspf" %>
<!-- Define links -->
<c:url var="listUrl" value="ListTitles.jsp">
	<c:forEach var="parameter" items="${paramValues}">
		<c:if test="${parameter.key ne 'order'}">
			<c:forEach var="val" items="${parameter.value}">
				<c:param name="${parameter.key}" value="${val}" />
		   </c:forEach>
	   </c:if>
   </c:forEach>
</c:url>

<c:url var='listUrlTitle' value='${listUrl}'><c:param name="order" value="title"/></c:url>
<c:url var='listUrlSales' value='${listUrl}'><c:param name="order" value="sales"/></c:url>
<c:url var='listUrlReleaseDate' value='${listUrl}'><c:param name="order" value="release"/></c:url>

<html>
<head>
  <%@ include file="Header.jspf" %>
<title><fmt:message key="vc.title"/></title>
<style type="text/css">
<!--
body,td,th {
	font-family: FOT-ãƒ­ãƒ€ãƒ³NTLG Pro M;
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
#SearchBtn01base {
	position:absolute;
	left:72px;
	top:40px;
	width:224px;
	height:72px;
	z-index:3;
	background-image: url(<c:out value="${imagesPath}"/>/Pic_Button/Search_btn_base.gif);
	vertical-align: text-botom;
	text-align: center;
	font-family: "FOT-ãƒ­ãƒ€ãƒ³NTLG Pro M";
	font-size: 24px;
	font-weight: bold;
	background-repeat: no-repeat;
}
#SearchBtn02base {
	position:absolute;
	left:320px;
	top:40px;
	width:224px;
	height:72px;
	z-index:9;
}
#SearchBtn03base {
	position:absolute;
	left:72px;
	top:128px;
	width:224px;
	height:72px;
	z-index:8;
}
#SearchBtn04base {
	position:absolute;
	left:320px;
	top:128px;
	width:224px;
	height:72px;
	z-index:7;
}
#SearchBtn05base {
	position:absolute;
	left:72px;
	top:216px;
	width:224px;
	height:72px;
	z-index:6;
}
#SearchBtn06base {
	position:absolute;
	left:320px;
	top:216px;
	width:224px;
	height:72px;
	z-index:5;
}
#SearchBtn07base {
	position:absolute;
	left:72px;
	top:304px;
	width:224px;
	height:72px;
	z-index:4;
}
#SearchBtn08base {
	position:absolute;
	left:320px;
	top:304px;
	width:224px;
	height:72px;
	z-index:3;
}
.style8 {
	font-size: 24px;
	font-weight: bold;
	color: #0000FF;
	height: 64px;
	line-height: 64px;
}
a:link {
	text-decoration: none;
}
a:visited {
	text-decoration: none;
}
a:hover {
	text-decoration: none;
}
a:active {
	text-decoration: none;
}
.style9 {
	color: #0000FF;
	font-weight: bold;
	font-size: 24px;
	height: 72px;
	margin-top: 0px;
	font-family: "FOT-ãƒ­ãƒ€ãƒ³NTLG Pro M";
	background-image: url(<c:out value="${imagesPath}"/>/Pic_Button/Search_btn_base.gif);
	background-repeat: no-repeat;
	text-align: center;
	vertical-align: middle;
	line-height: 64px;
}
#SearchBtn01base {
	position:absolute;
	left:72px;
	top:40px;
	width:224px;
	height:72px;
	z-index:10;
}
#SearchBtn01 {
	position:absolute;
	left:0px;
	top:0px;
	width:216px;
	height:64px;
	z-index:4;
}
#SearchBtn02 {
	position:absolute;
	left:0px;
	top:0px;
	width:216px;
	height:64px;
	z-index:6;
}
#SearchBtn03 {
	position:absolute;
	left:0px;
	top:0px;
	width:216px;
	height:64px;
	z-index:8;
}
#SearchBtn04 {
	position:absolute;
	left:0px;
	top:0px;
	width:216px;
	height:64px;
	z-index:10;
}
#SearchBtn05 {
	position:absolute;
	left:0px;
	top:0px;
	width:216px;
	height:64px;
	z-index:12;
}
#SearchBtn06 {
	position:absolute;
	left:0px;
	top:0px;
	width:216px;
	height:64px;
	z-index:14;
}
#SearchBtn07 {
	position:absolute;
	left:0px;
	top:0px;
	width:216px;
	height:64px;
	z-index:16;
}
#SearchBtn08 {
	position:absolute;
	left:0px;
	top:0px;
	width:216px;
	height:64px;
	z-index:18;
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

//-->
</script>
</head>

<body onload="MM_preloadImages('<c:out value="${imagesPath}"/>/Pic_Button/under_btn_on.png','<c:out value="${imagesPath}"/>/Pic_Button/Search_btn_on.png')">
<div id="UnderBtnC"><a onClick="showBack()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image7','','<c:out value="${imagesPath}"/>/Pic_Button/under_btn_on.png',1)"><img src="<c:out value="${imagesPath}"/>/Pic_Button/under_btn_off.png" name="Image7" width="192" height="56" border="0" id="Image7" /></a></div>
<div id="SearchBtn02base">
  <div id="SearchBtn02"><a href="<c:out value='${listUrlTitle}'/>" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image21','','<c:out value="${imagesPath}"/>/Pic_Button/Search_btn_on.png',1)"><img src="<c:out value="${imagesPath}"/>/Pic_Button/Search_btn_off.png" name="Image21" width="220" height="70" border="0" id="Image21" /></a></div>
  <div align="center" class="style9"><fmt:message key="sortTitles.byName"/></div>
</div>
<div id="SearchBtn03base">
  <div id="SearchBtn03"><a href="<c:out value='${listUrlSales}'/>" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image22','','<c:out value="${imagesPath}"/>/Pic_Button/Search_btn_on.png',1)"><img src="<c:out value="${imagesPath}"/>/Pic_Button/Search_btn_off.png" name="Image22" width="220" height="70" border="0" id="Image22" /></a></div>
  <div id="layer">
    <div align="center" class="style9"><fmt:message key="sortTitles.bySales"/></div>
  </div>
</div>
<!-- Following buttons are currently empty and don't do anything -->
<!--
<div id="SearchBtn04base">
  <div id="SearchBtn04"><a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image23','','<c:out value="${imagesPath}"/>/Pic_Button/Search_btn_on.png',1)"><img src="<c:out value="${imagesPath}"/>/Pic_Button/Search_btn_off.png" name="Image23" width="220" height="70" border="0" id="Image23" /></a></div>
  <div id="layer3">
    <div align="center" class="style9"></div>
  </div>
</div>
<div id="SearchBtn05base">
  <div id="SearchBtn05"><a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image24','','<c:out value="${imagesPath}"/>/Pic_Button/Search_btn_on.png',1)"><img src="<c:out value="${imagesPath}"/>/Pic_Button/Search_btn_off.png" name="Image24" width="220" height="70" border="0" id="Image24" /></a></div>
  <div id="layer5">
    <div align="center" class="style9"></div>
  </div>
</div>
<div id="SearchBtn06base">
  <div id="SearchBtn06"><a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image25','','<c:out value="${imagesPath}"/>/Pic_Button/Search_btn_on.png',1)"><img src="<c:out value="${imagesPath}"/>/Pic_Button/Search_btn_off.png" name="Image25" width="220" height="70" border="0" id="Image25" /></a></div>
  <div id="layer4">
    <div align="center" class="style9"></div>
  </div>
</div>
<div id="SearchBtn07base">
  <div id="SearchBtn07"><a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image26','','<c:out value="${imagesPath}"/>/Pic_Button/Search_btn_on.png',1)"><img src="<c:out value="${imagesPath}"/>/Pic_Button/Search_btn_off.png" name="Image26" width="220" height="70" border="0" id="Image26" /></a></div>
  <div id="layer6">
    <div align="center" class="style9"></div>
  </div>
</div>
<div id="SearchBtn08base">
  <div id="SearchBtn08"><a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image27','','<c:out value="${imagesPath}"/>/Pic_Button/Search_btn_on.png',1)"><img src="<c:out value="${imagesPath}"/>/Pic_Button/Search_btn_off.png" name="Image27" width="220" height="70" border="0" id="Image27" /></a></div>
  <div id="layer7">
    <div align="center" class="style9"></div>
  </div>
</div>
-->
<div id="SearchBtn01base">
  <div id="SearchBtn01"><a href="<c:out value='${listUrlReleaseDate}'/>" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','<c:out value="${imagesPath}"/>/Pic_Button/Search_btn_on.png',1)"><img src="<c:out value="${imagesPath}"/>/Pic_Button/Search_btn_off.png" name="Image2" width="220" height="70" border="0" id="Image2" /></a></div>
  <div id="layer2">
    <div align="center" class="style9"><fmt:message key="sortTitles.byReleaseDate"/></div>
  </div>
</div>
<table width="608" border="0" cellpadding="0" cellspacing="0">
  <!--DWLayoutTable-->
  <tr>
    <td width="24" height="409">&nbsp;</td>
    <td width="160">&nbsp;</td>
    <td width="40">&nbsp;</td>
    <td width="160">&nbsp;</td>
    <td width="40">&nbsp;</td>
    <td width="160">&nbsp;</td>
    <td width="24">&nbsp;</td>
  </tr>
  
  
  
  
  
  
  
  
  <tr>
    <td height="24"></td>
    <td align="center" valign="top"><!--DWLayoutEmptyCell-->&nbsp;</td>
    <td>&nbsp;</td>
    <td align="center" valign="top"><strong><fmt:message key="sortTitles.returnToList"/></strong></td>
    <td>&nbsp;</td>
    <td align="center" valign="top"><!--DWLayoutEmptyCell-->&nbsp;</td>
    <td></td>
  </tr>
  
  <tr>
    <td height="83"></td>
    <td>&nbsp;</td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
  </tr>
</table>
</body>
</html>
