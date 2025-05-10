//-------------------------------------------------------------------
//
// Progress Bar
//
// This is a javascript that simulates a progress bar on the page.
// The progress is based on the return value of an external functional call
//
// Usage: showProgressBar(ec,opId,tbpFunction,doneFunction,divObj,
//                        timeInterval,message1, message2,
//                        color,height,width,style)
//   ecVarName    - ECommerceInterface object variable name string
//   opId         - operation id to be passed to ec.getProgress()
//   tbpFunction  - returns progess text and bar %.  see updateProgress()
//                   (tbp stands for text and bar per cent)
//   doneFunction - javascript function to call upon completion
//   divObj       - id of the div object that act as a container of this progress bar
//   timeInterval - time interval (milliseconds) to obtain the status and update the progress bar
//   message1     - a msg string to display before the progress %
//   message2     - a msg string to display after  the progress %
//   color        - color for the bar/outer boundary of the box 
//   height       - height of the box/bar
//   width        - total width of the box/bar 
//   style        - style for the message string displayed above the progress bar
//
// Requirements: Following code must be included in the page
//
//     var ec = new ECommerceObj;  // global variable
//
//     <DIV id="divObj"></DIV>
//
// Where the name used for ec and divObj are passed as args to showProgressBar.
//
//-------------------------------------------------------------------

function showProgressBar(ecVarName,opId,tbpFunction,doneFunction,divObj,
                         timeInterval,message1,message2,
                         color,height,width,style)
{
    var pbColor = (color!=null && color!='') ? color : "#006666";
    var pbHeight = (height!=null && height!='') ? height : "20";
    var pbWidth = (width!=null && width!='') ? width : "400";
    var msgString1 = (message1!=null && message1!='') ? message1 : "";
    var msgString2 = (message2!=null && message2!='') ? message2 : "";
    var msgStyle = (style!=null && style!='') ? style : "font:bold; color:#FA8072;";

    document.getElementById(divObj).innerHTML = ''
             + '      <table width="90%"  border="0" cellspacing="0" cellpadding="0">'
             + '        <tr>'
             + '          <td width="7%" valign="top" align="right">'
             + '            <img src="../images/04.gif" width="26" height="57" border="0">'
             + '          </td>'
             + '          <td width="88%" background="../images/bg_26.gif" align="center">'
             + '            <table width="100%"  border="0" cellspacing="0" cellpadding="0">'
             + '              <tr>'
             + '                <td height="19">&nbsp;</td>'
             + '              </tr>'
             + '              <tr>'
             + '                <td>'
             + '                  <DIV id="box" align="left" style="background-color:#FFFFFF; border:1 solid '
             + pbColor + '; height:' + pbHeight + 'px; width:' + pbWidth + '; visibility:visible;">'
             + '                  <DIV id="bar" align="left" style="position:static; background-color:'
             + pbColor + '; height:' + pbHeight + 'px; width:0; padding-top:5;"></DIV></DIV>'
             + '                </td>'
             + '              </tr>'
             + '            </table>'
             + '            <br>'
             + '          </td>'
             + '          <td width="5%" valign="top">'
             + '            <img src="../images/03.gif" width="26" height="57" border="0">'
             + '          </td>'
             + '        </tr>'
             + '        <tr>'
             + '          <td></td>'
             + '          <td align="left" height="40" valign="middle">'
             + '            <DIV id="msg" align="center" style="'+msgStyle+'">center</DIV>'
             + '          </td>'
             + '          <td></td>'
             + '        </tr>'
             + '      </table>';

    updateProgress(ecVarName,opId,tbpFunction,doneFunction,timeInterval,msgString1,msgString2,pbWidth);
}

//-------------------------------------------------------------------
//
// The progress bar will keep obtaining the status after every timeInterval milliseconds
//
//-------------------------------------------------------------------

function updateProgress(ecVarName,opId,tbpFunction,doneFunction,timeInterval,
                      msgString1,msgString2,barSize)
{
    var result;
    var m;
    var progress = new Object;
    var barPerCent = new Object;
    eval("var rv = " +ecVarName+".getProgress(opId, progress);");

    if (rv != EC_ERROR_NOT_DONE) {
         document.getElementById('msg').innerText = "";
         document.getElementById('box').style.visibility = 'hidden';
         eval(doneFunction+"(rv, progress)");
         return;
    }
    
    eval("result = " +tbpFunction+"(barPerCent, progress);");
    
    m = document.getElementById('msg');
    
    if (msgString1 != null)
        m.innerHTML = msgString1;
    if (result != null)
        m.innerHTML += " " + result;
    if (msgString2 != null)
        m.innerHTML += msgString2;
        
    document.getElementById('bar').style.width = (barPerCent.value * (barSize/100));

    setTimeout("updateProgress(\""+ecVarName+"\",\""+opId+"\",\""+
        tbpFunction+"\",\""+doneFunction+"\",\""+timeInterval+"\",\""+
        msgString1+"\",\""+msgString2+"\",\""+barSize+"\");", timeInterval);

}


function errString (errCode)
{
    a = new Array();
    
    a[0]                                = "OK";
    a[-(EC_ERROR_FAIL)]                 = "Generic error"
    a[-(EC_ERROR_NOT_SUPPORTED)]        = "Feature not implemented"
    a[-(EC_ERROR_INSUFICIENT_RESOURCE)] = "Insufficient resource";
    a[-(EC_ERROR_INVALID)]              = "Invalid argument";
    a[-(EC_ERROR_NOMEM)]                = "Insufficient memory";
    a[-(EC_ERROR_NOT_FOUND)]            = "Not found";
    a[-(EC_ERROR_NOT_BUSY)]             = "No active async operation"
    a[-(EC_ERROR_BUSY)]                 = "Busy";
    a[-(EC_ERROR_NOT_DONE)]             = "Not done";

    a[-(EC_ERROR_NET_NA)]               = "Internet access not available"
    a[-(EC_ERROR_ECS_NA)]               = "ECommerce service not available"
    a[-(EC_ERROR_ECS_RESP)]             = "ECommerce server reports a problem"
    a[-(EC_ERROR_ECARD)]                = "Invalid eCard"

    a[-(EC_ERROR_NET_CONTENT)]          = "non specific error getting content from CCS"
    a[-(EC_ERROR_NET_CONTENT_FILE)]     = "Error creating or opening file"

    a[-(EC_ERROR_POINTS)]               = "Insufficient points to purchase"
    a[-(EC_ERROR_ECARD_USED)]           = "eCard was previously used"
    a[-(EC_ERROR_ECARD_INVALID)]        = "eCard is not valid for title"
    a[-(EC_ERROR_ECARD_FORMAT)]         = "eCard string is not valid ecard format"

    var msg = a[-errCode];

    if (msg == null) {
        msg = "Unrecognized Error Code: " + errCode;
    }
    
    return msg;
}


//-------------------------------------------------------------------
// Trim functions
//   Returns string with whitespace trimmed
//-------------------------------------------------------------------

function LTrim(str) 
{
    if (str==null)
    {
        return str;
    }
    
    for (var i=0; str.charAt(i)==" " || str.charAt(i)=="\n" || str.charAt(i)=="\t"; i++);
    
    return str.substring(i,str.length);
}

function RTrim(str) 
{
    if (str==null)
    {
        return str;
    }
    
    for (var i=str.length-1; str.charAt(i)==" " || str.charAt(i)=="\n" || str.charAt(i)=="\t"; i--);
    
    return str.substring(0,i+1);
}

function Trim(str)
{
    return LTrim(RTrim(str));
}

