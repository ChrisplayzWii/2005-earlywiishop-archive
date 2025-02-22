<%@ include file="TitleDetails.jspf" %>

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
.style4 {
	color: #CCFF00;
	font-weight: bold;
}
.style5 {font-size: 24px}
.style6 {font-size: 18px}
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
#ScreenShot01 {
	position:absolute;
	left:24px;
	top:138px;
	width:160px;
	height:120px;
	z-index:5;
}
#ScreenShot02 {
	position:absolute;
	left:24px;
	top:264px;
	width:160px;
	height:120px;
	z-index:4;
}
#Comment {
	position:absolute;
	left:192px;
	top:144px;
	width:392px;
	height:232px;
	z-index:6;
}
#Rating {
	position:absolute;
	left:544px;
	top:68px;
	width:40px;
	height:48px;
	z-index:7;
	text-align: center;
	vertical-align: middle;
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

function listTitles()
{
	history.go(-2);
}
//-->
</script>
</head>

<body onload="MM_preloadImages('<c:out value="${imagesPath}"/>/Pic_Button/under_btn_on.png')">
<div id="UnderBtnL"><a href="javascript:listTitles()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','<c:out value="${imagesPath}"/>/Pic_Button/under_btn_on.png',1)"><img src="<c:out value="${imagesPath}"/>/Pic_Button/under_btn_off.png" name="Image2" width="192" height="56" border="0" id="Image2" /></a><a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image13','','<c:out value="${imagesPath}"/>/Pic_Button/under_btn_on.png',1)"></a><a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image6','','<c:out value="${imagesPath}"/>/Pic_Button/under_btn_on.png',1)"></a></div>
<div id="UnderBtnC"><a href="javascript:showBack()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image7','','<c:out value="${imagesPath}"/>/Pic_Button/under_btn_on.png',1)"><img src="<c:out value="${imagesPath}"/>/Pic_Button/under_btn_off.png" name="Image7" width="192" height="56" border="0" id="Image7" /></a></div>
<div id="ScreenShot01"><img src="<c:out value="${ccsPath}/${title.titleId}/${title.contents['IMG.DL02']}"/>" width="160" height="120" alt="Screen Shot 2"/></div>
<div id="ScreenShot02"><img src="<c:out value="${ccsPath}/${title.titleId}/${title.contents['IMG.DL03']}"/>" width="160" height="120" alt="Screen Shot 3"/></div>
<div id="Comment"><span class="style6"><c:out value="${title.description}"/></span></div>
<table width="608" border="0" cellpadding="0" cellspacing="0">
  <!--DWLayoutTable-->
  <tr>
    <td width="16" height="35">&nbsp;</td>
    <td width="8">&nbsp;</td>
    <td width="160">&nbsp;</td>
    <td width="40">&nbsp;</td>
    <td width="160">&nbsp;</td>
    <td width="40">&nbsp;</td>
    <td width="160">&nbsp;</td>
    <td width="8">&nbsp;</td>
    <td width="16">&nbsp;</td>
  </tr>
  
  <tr>
    <td height="22"></td>
    <td colspan="6" align="right" valign="middle" background="<c:out value='${colorPlatform}'/>"><div align="right"><span class="style4"><fmt:message key="${title.platform}" /></span></div></td>
    <td valign="top" background="<c:out value='${colorPlatform}'/>"><!--DWLayoutEmptyCell-->&nbsp;</td>
    <td></td>
  </tr>
  <tr>
    <td height="72"></td>
    <td valign="top" background="<c:out value="${imagesPath}"/>/Pic_Material/Color_List_White.gif"><!--DWLayoutEmptyCell-->&nbsp;</td>
    <td colspan="5" valign="middle" background="<c:out value="${imagesPath}"/>/Pic_Material/Color_List_White.gif"><div align="center"><span class="style5"><c:out value="${title.name}" /></span></div></td>
    <td valign="top" background="<c:out value="${imagesPath}"/>/Pic_Material/Color_List_White.gif"><!--DWLayoutEmptyCell-->&nbsp;</td>
    <td></td>
  </tr>
  
  <tr>
    <td height="276"></td>
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
    <td height="24"></td>
    <td>&nbsp;</td>
    <td align="center" valign="top"><strong><fmt:message key="button.listTitles"/></strong></td>
    <td>&nbsp;</td>
    <td align="center" valign="top"><strong><fmt:message key="button.prevPage"/></strong></td>
    <td>&nbsp;</td>
    <td align="center" valign="top"><!--DWLayoutEmptyCell-->&nbsp;</td>
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
  </tr>
</table>
</body>
</html>
