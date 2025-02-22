        
/* ECError values */
var EC_ERROR_OK                   =  0  /* No error */
var EC_ERROR_FAIL                 = -1  /* Generic error */
var EC_ERROR_NOT_SUPPORTED        = -2  /* Feature not implemented */
var EC_ERROR_INSUFICIENT_RESOURCE = -3
var EC_ERROR_INVALID              = -4
var EC_ERROR_NOMEM                = -5
var EC_ERROR_NOT_FOUND            = -6
var EC_ERROR_NOT_BUSY             = -7  /* no active async operation */
var EC_ERROR_BUSY                 = -8
var EC_ERROR_NOT_DONE             = -9

var EC_ERROR_NET_NA               = -13  /* Internet access not available */
var EC_ERROR_ECS_NA               = -14  /* ECommerce service not available */
var EC_ERROR_ECS_RESP             = -15  /* ECS reports a problem */
var EC_ERROR_ECARD                = -17  /* Invalid eCard */

var EC_ERROR_NET_CONTENT          = -19  /* non specific error getting
                                          * content from CCS */
var EC_ERROR_NET_CONTENT_FILE     = -20  /* Error creating or opening file */

var EC_ERROR_POINTS               = -30  /* Insufficient points to purchase */
var EC_ERROR_ECARD_USED           = -31  /* ecard was previously used */
var EC_ERROR_ECARD_INVALID        = -32  /* ecard is not valid for title */
var EC_ERROR_ECARD_FORMAT         = -33  /* ecard string is not valid ecard format */

/* -200 to -599 correspond to http status codes 200 to 599 */
        

function ECommerceInterface ()
{
    this.getProgress = EC_GetProgress;
    this.getPoints = EC_GetPoints;
    this.purchaseTitle = EC_PurchaseTitle;
    this.getTitle = EC_GetTitle;
    this.purchasePoints = EC_PurchasePoints;
    this.redeemECard = EC_RedeemECard;
    this.getMeta = EC_GetMeta;
    this.registerVirtualConsole = EC_RegisterVirtualConsole;
    this.getTitleInfo = EC_GetTitleInfo
    this.listOwnedTitles = EC_ListOwnedTitles
    
    this.getDeviceInfo = EC_GetDeviceInfo;
    this.setCountry = EC_SetCountry;
    this.checkParentalControlPassword = EC_CheckParentalControlPassword;

    this.initOwnedTitles = ec_initOwnedTitles    
    this.addOwnedTitle = ec_addOwnedTitle;
    
    this.progress = 0;
    this.onDone = null;
    this.opId = 0;    // by convention 0 not a valid opId
    this.nextOpId = 1;
    this.maxProgressInc = 40;
    this.minProgressInc = 15;
    this.points = 0;
    
    this.deviceId = 0x8104a127d8;
    this.vcId = 0xa104a127da;
    this.pin = "InitialPin";
    this.countryId = 100;
    this.region = "NOA";
    this.language = "en_US";
    this.blockSize = 16*1024;
    this.usedBlocks = 0;
    this.totalBlocks = (128*1024*1024)/this.blockSize;
    this.isParentalControlEnbaled = true;
    this.parentalControlPasswd = "thePasswd";
    this.userAge = 13;
    
    // the following is not necessary, but documents the properties
    this.returnedPoints = null;
    this.titleId = null;
    this.eCard = null;
    this.usedECards = null;
    this.returnedVcId = null;
    
    this.initOwnedTitles ();  // initialize this.ownedTitles
}

function EC_GetProgress (opId, progress)
{
    var rv = EC_ERROR_NOT_DONE;

    if (!this.opId) {
        rv = EC_ERROR_NOT_BUSY;
    }
    else if (opId != this.opId) {
        rv = EC_ERROR_NOT_FOUND;
    }
    else {  
        progress.value = this.progress;
        this.progress += Math.max (this.minProgressInc,
                         Math.round(Math.random() * this.maxProgressInc));
        if (this.progress >= 100) {
            this.progress = 100;
            rv = EC_ERROR_OK;
            if (this.onDone != null) {
                rv = this.onDone();
            }
        }
    }
    return rv;
}


function EC_GetPoints (points)
{
    var rv;
    
    if (this.opId && this.progress != 100) {
        rv = EC_ERROR_BUSY;
    }
    else {
        this.opId = this.nextOpId++;
        rv = this.opId;
        this.progress = 0;
        this.activeOp = "getPoints";
        this.onDone = ec_onGetPointsDone;
        this.returnedPoints = points;
    }
       
    return rv;
}

function ec_onGetPointsDone ()
{
    this.returnedPoints.value = this.points;
    return EC_ERROR_OK;
}


//////////////////////////////////////////////////////////
//
//   Object constructors and methods for EC_PurchasePoints
//
// EC_CreditCardPayment, EC_ECardPayment, and EC_AccountPayment objects
// have a paymentMethod property initialized in the object constructor.
//


var EC_CreditCardKind_MasterCard = 0;
var EC_CreditCardKind_Visa       = 1;
var EC_CreditCardKind_Discover   = 2;
var EC_CreditCardKind_Amex       = 3;
var EC_CreditCardKind_DinersClub = 4;
var EC_CreditCardKind_JCB        = 5;

var EC_CreditCardKinds = new Array();
EC_CreditCardKinds[EC_CreditCardKind_MasterCard] = "MasterCard";
EC_CreditCardKinds[EC_CreditCardKind_Visa] = "Visa";
EC_CreditCardKinds[EC_CreditCardKind_Discover] = "Discover";
EC_CreditCardKinds[EC_CreditCardKind_Amex] = "American Express";
EC_CreditCardKinds[EC_CreditCardKind_DinersClub] = "DinersClub";
EC_CreditCardKinds[EC_CreditCardKind_JCB] = "JCB";


var EC_PaymentMethodType_ECard      = 0;
var EC_PaymentMethodType_Account    = 1;
var EC_PaymentMethodType_CreditCard = 2;



function EC_CreditCardPayment (ccKind, ccNumber, ccOwner,
                               expMonth, expYear, cvv2, addr)
{
    this.paymentMethod = EC_PaymentMethodType_CreditCard;
    this.ccKind = ccKind;
    this.ccNumber = ccNumber;
    this.ccOwner = ccOwner;
    this.expMonth = expMonth;
    this.expYear = expYear,
    this.cvv2 = cvv2;
    this.addr = addr;
}

function EC_ECardPayment (eCard)
{
    this.paymentMethod = EC_PaymentMethodType_ECard;
    this.eCard = eCard;
}

function EC_AccountPayment ()
{
    // already have account (i.e. vcId) and pin in console file
    
    this.paymentMethod = EC_PaymentMethodType_Account;
}

function EC_Price (amount, currency)
{
    this.amount = amount;
    this.currency = currency;
}


function EC_PurchaseRequest (itemId, price, payment)
{
    this.itemId = itemId;
    this.price = price;
    this.payment = payment; // Each payment has paymentMethod property
}

function EC_PurchasePoints (points, purchaseReq)
{
    var rv;
    
    if (this.opId && this.progress != 100) {
        rv = EC_ERROR_BUSY;
    }
    else {
        this.opId = this.nextOpId++;
        rv = this.opId;
        this.progress = 0;
        this.activeOp = "purchasePoints";
        this.onDone = ec_onPurchasePointsDone;
        this.returnedPoints = points;
    }
       
    return rv;
}

function ec_onPurchasePointsDone ()
{
    this.points += this.returnedPoints.value;
    this.returnedPoints.value = this.points;
    return EC_ERROR_OK;
}


// titleId is a number
// itemId is a number
// price is an ECPrice object
// payment is an ECPayment object
// limits is an array of EC_TitleLimit object
// 
function EC_PurchaseTitle (titleId,
                           itemId,
                           price,
                           payment,
                           limits)
{
    var rv;
    
    if (this.opId && this.progress != 100) {
        rv = EC_ERROR_BUSY;
    }
    else {
        this.opId = this.nextOpId++;
        rv = this.opId;
        this.progress = 0;
        this.activeOp = "purchaseTitle";
        this.onDone = ec_onPurchaseTitleDone;
        this.titleId = titleId;
    }
       
    return rv;
}

function ec_onPurchaseTitleDone ()
{
    var onCard = true;
    var updateAvailable = false;
    var limits = new Array (0);  // no limits
    this.addOwnedTitle (this.titleId, onCard, updateAvailable, limits);
    
    return EC_ERROR_OK;
}

function ec_addOwnedTitle (titleId, onCard, updateAvailable, limits)
{
    // using integer index values allows use of ownedTitles.length
    // otherwise would do ownedTitles[titleId} = new EC_TiteInfo (...);
    var i = this.ownedTitles.length;
    this.ownedTitles[i] = new EC_TitleInfo (titleId,
                                            onCard, updateAvailable, limits);
    this.ownedTitles[titleId] =  i;
    
}


function EC_RedeemECard (titleId, eCard)
{
    var rv;
    
    if (this.opId && this.progress != 100) {
        rv = EC_ERROR_BUSY;
    }
    else {
        this.opId = this.nextOpId++;
        rv = this.opId;
        this.progress = 0;
        this.activeOp = "redeemECard";
        this.onDone = ec_onRedeemECardDone;
        this.titleId = titleId;
        this.eCard = eCard;
    }
       
    return rv;
}

function ec_onRedeemECardDone ()
{
    var onCard = true;
    var updateAvailable = false;
    var limits = new Array (0);  // no limits
    
    this.addOwnedTitle (this.titleId, onCard, updateAvailable, limits);
    
    if (this.usedECards != null) {
        this.usedECards += "|";
    }
    this.usedECards + this.eCard;
    
    return EC_ERROR_OK;
}


function EC_GetTitle (titleId)
{
    var rv;
    
    if (this.opId && this.progress != 100) {
        rv = EC_ERROR_BUSY;
    }
    else if (this.ownedTitles[titleId] == null) {
        rv = EC_ERROR_NOT_FOUND;
    }
    else {
        this.opId = this.nextOpId++;
        rv = this.opId;
        this.progress = 0;
        this.activeOp = "getTitle";
        this.onDone = ec_onGetTitleDone;
        this.titleId = titleId;
    }
       
    return rv;
}

function ec_onGetTitleDone ()
{
    var rv;
    var ownedTitles = this.ownedTitles;
    var i = ownedTitles[this.titleId];
    if (i == null) {
        rv = EC_ERROR_FAIL;  // can't get title not owned
    }
    else {
         ownedTitles[i].onCard = true;
         rv = EC_ERROR_OK;
    }
    
    return rv;
}


function EC_GetMeta ()
{
    var rv;
    
    if (this.opId && this.progress != 100) {
        rv = EC_ERROR_BUSY;
    }
    else {
        this.opId = this.nextOpId++;
        rv = this.opId;
        this.progress = 0;
        this.activeOp = "getMeta";
        this.onDone = ec_onGetMetaDone;
    }
       
    return rv;
}

function ec_onGetMetaDone ()
{
   // set update for some title
   var i;
   var t;
   for (i = 0;  i < this.ownedTitles.length; ++i) {
       t = this.ownedTitles[i];
       if (t.onCard && !t.updateAvailable) {
           t.updateAvailable = true;
           break;
       }
   }
   return EC_ERROR_OK;
}



function EC_RegisterVirtualConsole (vcId)
{
    var rv;
    
    if (this.opId && this.progress != 100) {
        rv = EC_ERROR_BUSY;
    }
    else {
        this.opId = rv = this.nextOpId++;
        rv = this.opId;
        this.progress = 0;
        this.activeOp = "registerVirtualConsole";
        this.onDone = ec_onRegisterVirtualConsoleDone;
        this.returnedVcId = vcId;
    }
       
    return rv;
}


function ec_onRegisterVirtualConsoleDone ()
{
    this.vcId = Math.round(Math.random() * 16384);
    this.pin = "consolePin";
    this.returnedVcId.value = this.vcId;
    return EC_ERROR_OK;
}


//////////////////////////////////////////////////////////////////////////////////
//
//        TitleInfo object and function definitions
//
//



// constructor for EC_TitleLimit object
//
// code, limit, and consumption are 32 bit values defined in
// eTicket Services doc and estypes.h
// valid codes are
        var ES_LC_DURATION_TIME  =  1
        var ES_LC_ABSOLUTE_TIME  =  2
        var ES_LC_NUM_TITLES     =  3
// units for limit and consumption duration values is seconds
// absolute time is seconds since 1970.1.1 UTC

function EC_TitleLimit (code, limit, consumption)
{
    this.code = code;
    this.limit = limit;
    this.consumption = consumption;
}


// constructor for EC_TitleInfo object
//
// onCard is true means title has been downloaded to console
// and imported into eTicket Services
// limits is an array of EC_TitleLimit objects

function EC_TitleInfo (titleId, onCard, updateAvailable, limits)
{
    this.titleId = titleId;
    this.onCard = onCard;
    this.updateAvailable = updateAvailable;
    this.limits = limits;
}


    
 function ec_initOwnedTitles ()
 {
     var i;
     var titleId = 0x0001000000008000;
     var onCard;
     var limit;
     var limits;
     var limitCode;
     var consumption;
     var updateAvailable;
     
     this.ownedTitles = new Array();
     
     for (i = 0;  i < 5;  ++i) {
         ++titleId;
         updateAvailable = false;
         onCard = false;
         switch (i) {
            case 2:
                updateAvailable = true;
            case 0:
            case 4:
                onCard = true;;
                break;
            default:
                break;
         }
         switch (i) {
            case 3:
                limit = new EC_TitleLimit (ES_LC_DURATION_TIME,
                                           (60*60*24*30), // 30 day limit
                                           (60*60*24*5)); // 5 days consumed);
                limits = new Array (limit);
                break;
            default:
                limits = new Array (0);  // no limits
                break;
         }
         this.addOwnedTitle (titleId, onCard, updateAvailable, limits);
     }
 }
    
    
// EC_GetTitleInfo (titleId)
//
// returns an EC_TitleInfo object or null
//
//

function EC_GetTitleInfo (titleId)
{
   var rv = null;
   var i = this.ownedTitles[titleId];
   if (i != null) {
       rv = this.ownedTitles[i];
   }
   return rv;
}



// EC_ListOwnedTitles ()
//
// returns an array of EC_TitleInfo objects
//
// never returns null.  rv.length == 0 if no owned titles
//
// Can get the index of a specific title by rv[titleId]
//
// Note: use for(i=0; i < rv.length; i++) rather than for (t in rv)
//
function EC_ListOwnedTitles (titleId)
{
   return this.ownedTitles;
}





// returns an object with device info parameters
//
// Does not start asynchronous operation
//
function EC_GetDeviceInfo ()
{
   var r = new Object;
   
   r.deviceId = this.deviceId
   r.vcId = this.vcId
   r.countryId = this.countryId
   r.region = this.region
   r.language = this.language
   r.blockSize = this.blockSize
   r.usedBlocks = this.usedBlocks
   r.totalBlocks = this.totalBlocks
   r.isParentalControlEnabled = this.isParentalControlEnbaled;
   r.userAge = this.userAge
   
   return r;
}


// Does not start asynchronous operation
//
function EC_SetCountry (countryId)
{
    this.countryId = countryId;
       
    return EC_ERROR_OK;
}




// Does not start asynchronous operation
//
// Returns true if password is correct
//         fail if password is not correct
//
function EC_CheckParentalControlPassword (passwd)
{
    if (this.parentalControlPasswd == passwd)           
        return true;
    else
        return false;
}


