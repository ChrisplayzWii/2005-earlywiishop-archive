<%@ include file="Common.jspf" %>

<html>
<head>
  <%@ include file="Header.jspf" %>
  <title>Use Settings</title>
</head>

<jsp:useBean id="countries" class="com.broadon.cas.CountryListBean" scope="request">
</jsp:useBean>

<SCRIPT language="JavaScript">
		function showSelectedOption(listId, value)
		{
			var list = document.getElementById(listId);
			if (list != null) {
				for (i = 0; i < list.options.length; i++) {
					var option = list.options[i];					
					if (option.value == value) {
						list.selectedIndex = option.index;
					}
				}
			}
		}

		function initPage()
		{
			var agefield = document.getElementById("ageField");
			if (agefield != null) {
				agefield.value = '<c:out value="${age}" />';			
			}

			showSelectedOption("regionList", '<c:out value="${region}" />');
			showSelectedOption("countryList", '<c:out value="${country}" />');
			showSelectedOption("languageList", '<c:out value="${locale}" />');
		}
		
		function changeRegion()
		{
			var regionlist = document.getElementById("regionList");
			if (regionlist != null) {
				var region = regionlist.options[regionlist.selectedIndex].value;
				location.replace("UseSettings.jsp?region=" + region);
			}
		}

		function changeLanguage()
		{
			var languagelist = document.getElementById("languageList");
			if (languagelist != null) {
				var language = languagelist.options[languagelist.selectedIndex].value;
				location.replace("UseSettings.jsp?locale=" + language);
			}
		}

		function changeCountry()
		{
			var countrylist = document.getElementById("countryList");
			if (countrylist != null) {
				var country = countrylist.options[countrylist.selectedIndex].value;
				ec.setCountry (country);
				location.replace("UseSettings.jsp?country=" + country);
			}
		}

		function validate()
		{
			var submitOK = true;

			var agefield = document.getElementById("ageField");
			if (agefield != null) {
				var age = agefield.value;
				if (age.length > 0 && (isNaN(age)||age<1||age>100))
				{
					alert("The age must be a number between 1 and 100");
					submitOK = false;
	 			}
			}
						
			return submitOK;
		}

</SCRIPT>
<%
	pageContext.setAttribute("countryCount", String.valueOf(countries.getCountries().size()));
%>

<body onload="initPage()">

<CENTER>

<FORM action="Terms.jsp" onsubmit="return validate()" method="get">
<c:choose>
<c:when test="${countryCount eq '0'}">
No countries found for region <c:out value="${countries.region}" />
</c:when>
<c:otherwise>
Country<BR>
<select name="country" size="1" id="countryList" onchange="changeCountry()">
	<c:forEach items="${countries.countries}" var="country">
		<option value="<c:out value="${country.countryId}"/>">
		<c:out value="${country.name}"/>
		</option>		
	</c:forEach>
</select>
</c:otherwise>
</c:choose>

<BR><BR>
<button onclick="showBack()" id="ReturnButton"><fmt:message key="all.back"/></button>
<input type="submit" name="submit" value="<fmt:message key="all.next"/>"/>

<BR><BR>
<HR>
The following settings are for testing purposes and will not be part of the Virtual Console.
<BR><BR>
Region<BR>
<select name="region" size="1" id="regionList" onchange="changeRegion()">
	<option value="NCL">NCL</option>
	<option value="NOA">NOA</option>
</select>
<BR>Current region: <c:out value="${region}" />

<BR><BR>
language<BR>
<select name="locale" size="1" id="languageList" onchange="changeLanguage()">
	<option value="en_US">English</option>
	<option value="ja_JP">Japanese</option>
</select>
<BR>Current language: <c:out value="${locale}" />

<BR><BR>
Age<BR>
<input type="text" name="age" id="ageField"/>

<BR><BR>

</FORM>

</CENTER>

</body>
</html>