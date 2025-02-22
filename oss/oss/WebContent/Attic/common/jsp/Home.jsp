<%@ include file="Common.jspf" %>

<html>
<head>
  <%@ include file="Header.jspf" %>
  <title>Virtual Console Home</title>
</head>

<body>
<H1><center><fmt:message key="all.virtualConsole"/></center></H1>
<table width=100%>
	<tr>
		<td width="200">
			<a href="TitleCatalog.jsp">
				<img src="<c:out value="${imagesPath}"/>/b_vc_download_off.gif" alt="Download" width="200" height="40" align="left"/>
			</a>
		</td>
		<td width="250" rowspan=5 align=center>
			<textarea name="Message" rows=10 cols="70" readonly>
<c:import url="${txtPath}/message.txt" />
			</textarea>
			<BR>
			<a href="Message.jsp">Message from Nintendo</a>
		</td>
	</tr>
	<tr>
		<td>
			<a href="AddPoints.jsp">
				<img src="<c:out value="${imagesPath}"/>/b_vc_addpoints_off.gif" alt="Add Points" width="200" height="40" align="left"/>
			</a>
		</td>
	</tr>
	<tr>
		<td>
			<a href="ListTransactions.jsp">
				<img src="<c:out value="${imagesPath}"/>/b_vc_history_off.gif" alt="Purchase History" width="200" height="40" align="left"/>
			</a>
		</td>
	</tr>
	<tr>
		<td>
			<a href="UseSettings.jsp">
				<img src="<c:out value="${imagesPath}"/>/b_vc_settings_off.gif" alt="Settings" width="200" height="40" align="left" /> 
			</a>
		</td>
	</tr>
	<tr>
		<td>
			<img onclick="showHelp('Home')" src="<c:out value="${imagesPath}"/>/b_vc_help_off.gif" alt="Help" width="200" height="40" align="left"/>
		</td>
	</tr>
</table>

<BR><BR>
<div align="center">
<button class="tdButton" onclick="exit()"><fmt:message key="all.exit"/></button>
</div>


</body>
</html>