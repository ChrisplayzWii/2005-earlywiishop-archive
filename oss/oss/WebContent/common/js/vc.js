var ec = new ECommerceInterface ();  // only create one per page

var DEBUG = true;
var wii = true;
var opera = true; // set by vcInitPage()
var msie = false; // set by vcInitPage()
var useProgressBar; // set by vcInitPage()

var opName;
var opDesc;


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
		
function exit()
{
	window.close();
}

		/** Progress bar functions */
        function setText1 (dynText1, optStyle1)
        {
            if (dynText1 != null) {
                var d1 = document.getElementById("dynDiv1");
                d1.innerHTML = dynText1;
                if (optStyle1 != null) {
                    d1.className = optStyle1;
                }
            }
        }

        function setText2 (dynText2, optStyle2)
        {
            if (dynText2 != null) {
                var d2 = document.getElementById("dynDiv2");
                d2.innerHTML = dynText2;
                if (optStyle2 != null) {
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

        function wasOpStarted (progress, msg)
        {
        	trace("wasOpStarted");
            if (progress.status < 0 && progress.status != EC_ERROR_NOT_DONE) {
                showResult (progress, progress.operation, opDesc);
                setErr (""); // op errors are displayed by setText1 (t1)
/*                msg = "ERROR: " + msg + "  returned: " + errString(progress.status);
                if (DEBUG && progress.errInfo != null) {
                    msg += " and message " + progress.errInfo;
                }
                setErr (msg); */
                return false;
            }
            return true;
        }

        // Default onOpDone
        //
        function  onOpDone (progress)
        {
            showResult (progress, opName, opDesc);
            finishOnOpDone ();
        }

        function finishOnOpDone ()
        {
            //disableButtons (false);
            setErr (""); // op errors are displayed by setText1 (t1)
        }

        function showProgress(firstTime, operation, description, onDone)
        {
            var msg;
            var text1;
            var text2;
            var s1;
            var done = true;
            var isFailed = true;
            var onDoneText;

            var progress = ec.getProgress();
            
            if (progress.status == EC_ERROR_NOT_BUSY) {
                return;
            }

            if (useProgressBar) {
            
                var timeInterval = 1000;
                var message1;
                var message2 = null;
                if (progress.totalSize) {
                    message1 = operation + " progress: ";
                } else {
                    progresCount = 0;
                    message1 = operation + ". Please Wait.";
                }
                // use default color,height,width,style
                var color = null;
                var height = null;
                var width = null;
                var style = null;
                setText1 (description, "style2");
                setErr ("");
  //              disableButtons (true);
                showProgressBar("ec", "defTbpFunc", onDone,
                                 "dynDiv2", timeInterval,
                                 message1,message2,
                                 color,height,width,style);
           }
            else {
                if (progress.status == EC_ERROR_NOT_DONE) {
                    // showDebug (progress.phase);
                    msg = operation;
                    if (progress.totalSize) {
                        // not expected except when downloading content
                        var perCent = Math.round((100 * progress.downloadedSize)
                                                   / progress.totalSize);
                        msg += ":  downloadedSize " + progress.downloadedSize +
                               "   totalSize "   + progress.totalSize +
                               "   " + perCent + "%";
                    }
                    else {
                        if (firstTime || dots.length == 10) {
                            dots = "";
                        }
                        dots += "**";
                        msg += ": Please wait.  " + dots;
                    }
                    setText1 (msg);
 
                    if (firstTime) {
                        setText2 (description);
                        setErr ("");
//                        disableButtons (true);
                    }
                    setTimeout ('showProgress(false,"' + operation + '","' + description
                                            + '","' + onDone + '")', 1000);
                }
                else {
                    eval (onDone+"(progress)");
                }
            }
        }

        function showResult (progress, operation, description)
        {
            trace("showResult");
            var t1;
            var s1;
            var rv = progress.status;
            
            if (rv == EC_ERROR_NOT_DONE) {
                t1 = "Internal Error: showResult was called before operation finished";
                s1 = "errText";
            }
            else if (rv == EC_ERROR_NOT_BUSY || rv == EC_ERROR_NOT_FOUND) {
                t1 = "Internal Error: expected operation status " +
                        "but ec.getProgress() returned: " + errString(rv);
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
            if (progress.errInfo == null)
                setText2 ("");
            else
                setText2 (progress.errInfo)
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

            if (progress.totalSize) {
                // not expected except when downloading content
                barPerCent.value = Math.round((100 * progress.nDownloaded) / progress.totalSize);
                return barPerCent.value + "%";
            }
            else {
                if (++progresCount > 4) {
                    barPerCent.value = 10;
                    count = 1;
                } else {
                    barPerCent.value = 20 * progresCount;
                }
                return null;
            }
        }

        function getPointsBalance(doneFunc)
        {
            var msg;
            var progress = ec.refreshCachedBalance ();

            opName = "Refresh Points Balance";
            opDesc = "Refreshing Points available for purchases";
	        if ( wasOpStarted (progress, opDesc)) {
                showProgress(true, opName, opDesc, doneFunc);
            }            
        }
        
        function showPointsBalanceDone(progress)
        {
            showResult (progress, "Refresh Points Balance", "Refreshing Points available for purchases");
		    finishOnOpDone ();    
        }

        function registerVirtualConsole()
        {
            var msg;
            var progress = ec.registerVirtualConsole ();
 
            opName = "Register Virtual Console";
            opDesc = "Registering Virtual Console";
 	        if ( wasOpStarted (progress, opDesc)) {
                showProgress(true, opName, opDesc, "onRegisterVirtualConsoleDone");
            }
        }

        function onRegisterVirtualConsoleDone (progress)
        {
            showResult (progress, opName, opDesc);
            finishOnOpDone ();
            if (progress.status >= 0) {
                //document.getElementById("vcid").innerHTML = "Registered";
                showHome();
            }
        }
        
function vcGetTitleLicense(hexTitleId)
{
	var t = ec.getTitleInfo (hexTitleId);
	
	if (typeof(t) == "object") {
		if (t.limits == null || t.limits.length == 0) {
			return "Unlimited"
		} else {
			return "Limited"
		}		
	} else {
		return null;
	}
}        
        
function vcGetBalance()
{
	if (wii) {
		return ec.cachedBalance;
	} else {
		return 1000;
	}
}

function vcInitPage()
{
    var s = navigator.userAgent.toLowerCase();
    opera = s.indexOf('opera') + 1;
    msie = false;
    if (!opera) {
	    msie = s.indexOf('msie') + 1;
	   	wii = false;
    } else {
    	wii = s.indexOf('uatest') + 1;
    }
    if (msie || wii) {
    	useProgressBar = true; // MS IE
    } else {
        useProgressBar = false;
    }
}
				
		

		