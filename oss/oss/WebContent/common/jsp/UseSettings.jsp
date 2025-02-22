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
				list.selectedIndex = -1;
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
			showSelectedOption("languageList", '<c:out value="${language};${locale}" />');
		}
		
		function changeRegion()
		{
			var regionlist = document.getElementById("regionList");
			if (regionlist != null) {
				var region = regionlist.options[regionlist.selectedIndex].value;
				ec.setRegion(region);				
				location.replace("UseSettings.jsp?region=" + region);
			}
		}

		function changeLanguage()
		{
			var languagelist = document.getElementById("languageList");
			if (languagelist != null) {
				var s = languagelist.options[languagelist.selectedIndex].value;
				var i = s.indexOf(';');
				var language = s.substr(0, i);
				var locale = s.substr(i+1);
				ec.setLanguage(language);
				location.replace("UseSettings.jsp?language=" + language + "&locale=" + locale);
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
	 			} else {
					ec.setAge(age);
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

<FORM action="Terms.jsp" onsubmit="return validate()" method="post">
<c:catch var="error">
<c:choose>
<c:when test="${countryCount eq '0'}">
No countries found for region <c:out value="${countries.region}" />
</c:when>
<c:otherwise>
Country<BR>
<c:set var="currentCountry" value="${countries.countries[0]}" />
<select name="country" size="1" id="countryList" onchange="changeCountry()">	
	<!-- Display country name using selected locale, if not available use default locale for country -->
	<c:forEach items="${countries.countries}" var="c">
		<option value="<c:out value="${c.code}"/>">
		<c:out value="${c.name}" default="${c.code}"/>
		</option>		
		<c:if test="${c.code eq country}">
			<c:set var="currentCountry" value="${c}" />
		</c:if>	
	</c:forEach>
</select>
</c:otherwise>
</c:choose>
</c:catch>
<c:if test="${not empty error}">
	<c:out value="${error}"/>
</c:if>

<BR><BR>
<button type="button" onclick="showBack()" id="ReturnButton"><fmt:message key="button.back"/></button>
<input type="submit" name="submit" value="<fmt:message key="button.next"/>"/>

<BR><BR>
<HR>
The following settings are for testing purposes and will not be part of the Virtual Console.
<BR><BR>
Region<BR>
<select name="region" size="1" id="regionList" onchange="changeRegion()">
	<option value="EU">EU</option>
	<option value="JP">JP</option>
	<option value="US">US</option>
</select>
<BR>Current region: <c:out value="${region}" />

<BR><BR>

<c:catch var="error">
<c:choose>
<c:when test="${empty currentCountry}">
No country selected
</c:when>
<c:when test="${currentCountry.languageCount eq '0'}">
No languages found for country <c:out value="${country.code}" />
</c:when>
<c:otherwise>
language<BR>
<select name="langLocale" size="1" id="languageList" onchange="changeLanguage()">
<c:forEach items="${currentCountry.languages}" var="lang">
	<%
		String lang = (String) pageContext.getAttribute("lang");
    	java.util.Locale languageLocale = new java.util.Locale(lang);
    	String langName = languageLocale.getDisplayLanguage();
    	pageContext.setAttribute("langName", langName);
    %>
	<option value="<c:out value="${lang};${currentCountry.locales[lang]}"/>">
		<c:out value="${langName}" default="${lang}"/></option>
</c:forEach>	
</select>
<BR>Current language: <c:out value="${language}"/>, locale: <c:out value="${locale}" />
</c:otherwise>
</c:choose>
</c:catch>
<c:if test="${not empty error}">
	<c:out value="${error}"/>
</c:if>

<BR><BR>
Age: <input type="text" name="age" id="ageField"/>
<BR><BR>

</FORM>

</CENTER>

</body>
</html>
