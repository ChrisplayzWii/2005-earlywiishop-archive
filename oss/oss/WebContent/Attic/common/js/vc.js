// Virtual console javascript functions

        var useProgressBar = false; // set by initPage()
        var titleId = null;
        var defTitleId = 0x0001000000008001;
        var ec = new ECommerceInterface ();  // only create one per page
        var activeOpId;
        var progressRate = 3;  // 1:slow, 2:normal, 3:fast
        var returnedPoints = new Object;
        var purchasedPoints = new Object;
        var returnedVcId = new Object;
        var Name;
        var Desc;
        var purchaseName;
        var purchaseDesc;
        var redeemName;
        var redeemDesc;
        var buyPointsName;
        var buyPointsDesc;
        var downloadName;
        var downloadDesc;

        function setText1 (dynText1, optStyle1)
        {
            if (dynText1 != null) {
                var d1 = document.getElementById("dynDiv1");
                d1.innerHTML = dynText1;
                if (optStyle1 == null) {
                    d1.className = "style1";
                } else  {
                    d1.className = optStyle1;
                }
            }
        }

        function setText2 (dynText2, optStyle2)
        {
            if (dynText2 != null) {
                var d2 = document.getElementById("dynDiv2");
                d2.innerHTML = dynText2;
                if (optStyle2 == null) {
                    d2.className = "style2";
                } else  {
                    d2.className = optStyle2;
                }
            }
        }

        function setErr (errText, optStyle)
        {
            var d = document.getElementById("errDiv");
            d.innerHTML = errText;
            if (optStyle == null) {
                d.className = "errText";
            } else  {
                d.className = optStyle;
            }
        }


        function hexString (number)
        {
            return "0x" + number.toString(16);
        }


        function setPoints(points)
        {
            document.getElementById("points").innerHTML = points;
        }

        function getPoints()
        {
            var opId = ec.getPoints(returnedPoints);
            if (opId < 0) {
                setErr ( "ERROR:  returned: " + errString(opId));
            }
            else {
                activeOpId = opId;
                Name = "Get Points";
                Desc = "Getting Points available for purchases";
                showProgress(true, Name, Desc, "onDone");
            }
        }

        function onDone(rv, progress)
        {
            showResult (rv, Name, Desc);
            onOpDone ();
            if (rv >= 0) {
                setPoints(returnedPoints.value);
            }
        }

        function purchase(hexTitleId)
        {
        	titleId = parseInt(hexTitleId, 16);
            if (titleId == null) {
                setErr ( "ERROR: purchaseTitle:  No selected title");
            }
            else {
                var opId = ec.purchaseTitle (titleId);
                if (opId < 0) {
                    setErr ( "ERROR: purchaseTitle  " + hexString(titleId) +
                                "  returned: " + errString(opId));
                }
                else {
                    activeOpId = opId;
                    purchaseName  = "Purchase";
                    purchaseDesc  = "Purchasing " + hexString(titleId);
                    showProgress(true, purchaseName, purchaseDesc, "onPurchaseDone");
                }
            }
        }

        function  onPurchaseDone (rv, progress)
        {
            showResult (rv, purchaseName, purchaseDesc);
            onOpDone ();
            showPurchaseButtons();
        }

        function redeemECard()
        {
            if (titleId == null) {
                setErr ( "ERROR: redeemECard:  No selected title");
            }
            else {
                var eCard;
                var suggested = "0008000200030004";
                var answer = prompt ("Enter eCard:", suggested);

                if (answer != null && answer != "") {
                    eCard = answer;
                }
                else {
                    setText1 ("Redeem eCard canceled");
                    return;
                }
                var opId = ec.redeemECard (titleId, eCard);
                if (opId < 0) {
                    setErr ( "ERROR: redeemECard  " + hexString(titleId) + ", "
                                + eCard + "  returned: " + errString(opId));
                }
                else {
                    activeOpId = opId;
                    redeemName    = "Redeem eCard";
                    redeemDesc    = "Redeeming  " + eCard + "  for title  "
                                        + hexString(titleId);
                    showProgress(true, redeemName, redeemDesc, "onRedeemDone");
                }
            }
        }

        function  onRedeemDone (rv, progress)
        {
            showResult (rv, redeemName, redeemDesc);
            onOpDone ();
        }

        function download(hexTitleId)
        {
        	var titleId = parseInt(hexTitleId, 16);
            if (titleId == null) {
                setErr ( "ERROR: download:  No selected title");
            }
            else {
                var opId = ec.getTitle (titleId);
                if (opId < 0) {
                    setErr ( "ERROR: getTitle  " + hexString(titleId) +
                                "  returned: " + errString(opId));
                }
                else {
                    activeOpId = opId;
                    downloadName = "Download";
                    downloadDesc = "Downloading "  + hexString(titleId);
                    showProgress(true, downloadName, downloadDesc, "onDownloadDone");
                }
            }
        }

        function onDownloadDone(rv, progress)
        {
            showResult (rv, downloadName, downloadDesc);
            onOpDone ();
        }

        function getMeta()
        {
            var opId = ec.getMeta ();
            if (opId < 0) {
                setErr ( "ERROR: getMeta returned: " + errString(opId));
            }
            else {
                activeOpId = opId;
                getMetaName = "Get Metadata";
                getMetaDesc = "Geting Metadata";
                showProgress(true, getMetaName, getMetaDesc, "onGetMetaDone");
            }
        }

        function onGetMetaDone(rv, progress)
        {
            showResult (rv, getMetaName, getMetaDesc);
            onOpDone ();
        }

        function registerVirtualConsole()
        {
            var opId = ec.registerVirtualConsole (returnedVcId);
            if (opId < 0) {
                setErr ( "ERROR: registerVirtualConsole returned: " + errString(opId));
            }
            else {
                activeOpId = opId;
                getRegisterVirtualConsoleName = "Register Virtual Console";
                getRegisterVirtualConsoleDesc = "Registering Virtual Console";
                showProgress(true, getRegisterVirtualConsoleName,
                                   getRegisterVirtualConsoleDesc,
                                   "onRegisterVirtualConsoleDone");
            }
        }

        function onRegisterVirtualConsoleDone(rv, progress)
        {
            var vcid = returnedVcId;
            showResult (rv, getRegisterVirtualConsoleName, getRegisterVirtualConsoleDesc);
            onOpDone ();
            window.location="Home.jsp"
            if (rv >= 0) {
                //document.getElementById("vcid").innerHTML = vcid.value;
            }
        }

        function showProgress(firstTime, operation, description, onDone)
        {
            var text1;
            var text2;
            var s1;
            var done = true;
            var isFailed = true;
            var onDoneText;

            if (activeOpId < 0) {
                return;
            }

            if (useProgressBar) {
                var timeInterval = 1000;
                var message1 = operation + " progress: ";
                var message2 = null;
                // use default color,height,width,style
                var color = null;
                var height = null;
                var width = null;
                var style = null;
                setText1 (description, "style2");
                setErr ("");
                showProgressBar("ec", activeOpId,
                                 "defTbpFunc", onDone,
                                 "dynDiv2", timeInterval,
                                 message1,message2,
                                 color,height,width,style);
            }
            else {
                var progress = new Object;
                var rv = ec.getProgress(activeOpId, progress);

                if (rv == EC_ERROR_NOT_DONE) {
                    setText1 (operation + " progress: " + progress.value + "%");
                    if (firstTime) {
                        setText2 (description);
                        setErr ("");
                    }
                    setTimeout ('showProgress(false,"' + operation + '","' + description
                                            + '","' + onDone + '")', 1000);
                }
                else {
                    eval (onDone+"(rv, progress)");
                }
            }
        }


        function showResult (rv, operation, description)
        {
            var t1;
            var s1;

            if (rv == EC_ERROR_NOT_DONE) {
                t1 = "Internal Error: showResult was called before operation finished";
                s1 = "errText";
            }
            else if (rv == EC_ERROR_NOT_BUSY || rv == EC_ERROR_NOT_FOUND) {
                t1 = "Internal Error: expected operation status " +
                        "but ec.getProgress(opId) returned: " + errString(rv);
                s1 = "errText";
            }
            else if (rv < 0) {
                t1 = description + ": Failed: " + errString(rv);
                s1 = "errText";
            }
            else {
                t1 = description + ": Success";
                s1 = "successText";
            }

            setText1 (t1, s1);
            setText2 ("");
        }


        function defTbpFunc (barPerCent, progress)
        {
            // Returns progess text and bar %.  see updateProgress().
            // The 'tbp' stands for text and bar per cent.
            // default meaning of progess.value is  0 to 99 per cent
            // but could be used diferently for different operations.
            // The tbpFunction is not normally called by updateProgess
            // when progress.value is 100, because at that point the
            // operation is complete and onDone is called instead.

            barPerCent.value = progress.value;
            return progress.value + "%";
        }


        function onOpDone ()
        {
            activeOpId = null;
            setErr (""); // op errors are displayed by setText1 (t1)
        }

        function setCountry(countryId)
        {
            var countryId;
            var suggested = "2";
            var answer = prompt ("Enter country ID:", suggested);

            if (answer != null && answer != "") {
                countryId = answer;
            }
            else {
                setText1 ("Set country canceled");
                return;
            }
            var r = ec.setCountry (countryId);
            if (r != EC_ERROR_OK) {
                setErr ( "ERROR: setCountry returned  " + errString(opId));
            }
            else {
                document.getElementById("country").innerHTML = countryId;
                setText1 ("Set country was succesfull");
                setText2 ("Select another Operation");
                setErr ("");
            }
        }

        function checkParentalControlPassword()
        {
            var t;
            var passwd;
            var suggested = "********";
            var answer = prompt ("Enter password:", suggested);

            if (answer != null && answer != "") {
                passwd = answer;
            }
            else {
                setText1 ("\"Let me play\" canceled");
                return;
            }
            var r = ec.checkParentalControlPassword (passwd);
            if (r)
                t = "Password was correct";
            else
                t = "Password was wrong";
            setText1 (t);
            setText2 ("Select another Operation");
            setErr ("");
        }


        function getTitleInfo()
        {
            if (titleId == null) {
                setErr ( "ERROR: getTitleInfo:  No selected title");
            }
            else {
                var t = ec.getTitleInfo (titleId);
                var info;
                if (t == null) {
                    info = "Title is not owned";
                }
                else {
                    info = "<table border=1>" +
                           "<tr>"+
                               "<th>titleId</th>" +
                               "<th>onCard </th>" +
                               "<th>updated</th>" +
                               "<th>limits</th>" +
                           "</tr>" +
                           "<tr>" +
                               "<td  class='td1'>" + hexString(t.titleId) + "</td>" +
                               "<td  class='td1'>" + t.onCard               + "</td>" +
                               "<td  class='td1'>" + t.updateAvailable      + "</td>";

                    if (t.limits.length == 0) {
                        info += "<td  class='td1'>none</td>";
                    }
                    else {
                        info += "<th><table>" +
                                "<tr>"+
                                    "<th>limit code</th>" +
                                    "<th>limit</th>" +
                                    "<th>consumption</th>" +
                                "</tr>"
                        for (l in t.limits) {
                            info += "<tr>" +
                                        "<td  class='td1'>" + t.limits[0].code         + "</td>" +
                                        "<td  class='td1'>" + t.limits[0].limit        + "</td>" +
                                        "<td  class='td1'>" + t.limits[0].consumption  + "</td>" +
                                    "</tr>";
                        }
                        info += "</table></th>";
                    }

                    info += "</tr></table>";
                }
                setText1 (info);
                setText2 ("Select another Operation");
                setErr ("");
            }
        }


        function listOwnedTitles()
        {
            // It would be an internal error if returned value isn't an array of EC_TitleInfo
            var ownedTitles = ec.listOwnedTitles ();
            var t;
            var i;
            var list = "<table border=1>" +
                           "<tr>"+
                               "<th>titleId</th>" +
                               "<th>onCard </th>" +
                               "<th>updated</th>" +
                               "<th>limits</th>" +
                           "</tr>"
           for (i = 0;  i < ownedTitles.length;  ++i) {
                t = ownedTitles[i];
                list +=
                   "<tr><td  class='td1'>" + hexString(t.titleId) + "</td>" +
                       "<td  class='td1'>" + t.onCard               + "</td>" +
                       "<td  class='td1'>" + t.updateAvailable      + "</td>";

                if (t.limits.length == 0) {
                    list += "<td  class='td1'>none</td>";
                }
                else {
                    list += "<th><table>" +
                            "<tr>"+
                                "<th>limit code</th>" +
                                "<th>limit</th>" +
                                "<th>consumption</th>" +
                            "</tr>"
                    for (l in t.limits) {
                        list += "<tr>" +
                                    "<td  class='td1'>" + t.limits[0].code         + "</td>" +
                                    "<td  class='td1'>" + t.limits[0].limit        + "</td>" +
                                    "<td  class='td1'>" + t.limits[0].consumption  + "</td>" +
                                "</tr>";
                    }
                    list += "</th></table>";
                }

                list += "</tr>";
            }
            list += "</table>";
            setText1 (list)
            setText2 ("Select another Operation");
            setErr ("");
        }



        function togProgressBar()
        {
            useProgressBar = !useProgressBar;
            document.getElementById("useProgressBar").innerHTML = useProgressBar;
        }

		function showBack()
		{
			history.back()
		}

		function showHome()
		{
			window.location="Home.jsp"
		}

		function showHelp(index)
		{
			// TODO: Change common to locale, redirect to different file based on index			
			window.location="/common/html/Help.html"
		}
		
		function showPurchaseButtons(hexTitleId, reqPoints)
		{
			// Hide buttons as appropriate
			if (hexTitleId != null) {
				titleId = parseInt(hexTitleId, 16);
			}
			var t = ec.getTitleInfo (titleId);
			if (t == null) {
				// Don't own title yet - hide download button
				document.getElementById("Download").style.display='none';
				if (reqPoints != null && EC_getPoints() < reqPoints) {
					document.getElementById("Purchase").style.display='none';
					document.getElementById("AddPoints").style.display='';
				} else {
					document.getElementById("Purchase").style.display='';
					document.getElementById("AddPoints").style.display='none';
				}
			} else {
				// Already own title - hide purchase button
				document.getElementById("Download").style.display='';
				document.getElementById("Purchase").style.display='none';
				document.getElementById("AddPoints").style.display='none';
			}
		}
		
		function exit()
		{
			window.close();
		}

// Returns the number of points in the VC
function EC_getPoints()
{
	return 1000;
}

				
		

		