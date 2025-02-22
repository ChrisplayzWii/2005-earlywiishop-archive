        
/* ECError values */
var EC_ERROR_OK                   =     0;  /* No error */
var EC_ERROR_FAIL                 = -4001;  /* Generic error */
var EC_ERROR_NOT_SUPPORTED        = -4002;  /* Feature not implemented */
var EC_ERROR_INSUFICIENT_RESOURCE = -4003;
var EC_ERROR_INVALID              = -4004;
var EC_ERROR_NOMEM                = -4005;
var EC_ERROR_NOT_FOUND            = -4006;
var EC_ERROR_NOT_BUSY             = -4007;  /* no active async operation */
var EC_ERROR_BUSY                 = -4008;
var EC_ERROR_NOT_DONE             = -4009;
                                  
var EC_ERROR_NET_NA               = -4013;  /* Internet access not available */
var EC_ERROR_ECS_NA               = -4014;  /* ECommerce service not available */
var EC_ERROR_ECS_RESP             = -4015;  /* ECS reports a problem */
var EC_ERROR_ECARD                = -4017  /* Invalid eCard */
                                  
var EC_ERROR_NET_CONTENT          = -4019;  /* non specific error getting
                                             * content from server */
var EC_ERROR_FILE                 = -4020;  /* Error creating or opening file */
                                  
var EC_ERROR_POINTS               = -4030;  /* Insufficient points to purchase */
var EC_ERROR_ECARD_USED           = -4031;  /* ecard was previously used */
var EC_ERROR_ECARD_INVALID        = -4032;  /* ecard is not valid for title */
var EC_ERROR_ECARD_FORMAT         = -4033;  /* ecard string is not valid ecard format */

var EC_ERROR_WS_RESP              = -4034   /* invalid web service response */
var EC_ERROR_TICKET               = -4035;  /* problem importing ticket */
var EC_ERROR_TITLE                = -4036;  /* problem importing title */
var EC_ERROR_TITLE_CONTENT        = -4037;  /* problem importing title content */
var EC_ERROR_CANCELED             = -4038;  /* an extended operation was canceled */
var EC_ERROR_ALREADY              = -4039;  /* one time only action was previously done */

var EC_ERROR_NET_CONTENT_HASH     = -4040;  /* hash miscompare on downloaded content */ 
var EC_ERROR_INIT                 = -4041;  /* library has not been initialized */
var EC_ERROR_REGISTER             = -4042;  /* virtual console is not registered */
var EC_ERROR_WS_RECV              = -4043;  /* recv error on web service response */
var EC_ERROR_NOT_ACTIVE           = -4044;  /* expected operation is not active op */

var EC_ERROR_RANGE_START          = -4000;

/* -4200 to -4599 correspond to http status codes 200 to 599 */


var ES_MAX_LIMIT_TYPE  = 8;
var EC_INVALID_MONEY_AMOUNT = (-2147483647-1);

var EC_PHASE_NoPhase                    =  0;
var EC_PHASE_Starting                   =  1;
var EC_PHASE_Done                       =  2;
var EC_PHASE_GettingUpdatedAppVersions  =  3;
var EC_PHASE_PurchasingTitle            =  4;
var EC_PHASE_RedeemingECard             =  5;
var EC_PHASE_DownloadingContent         =  6;
var EC_PHASE_GettingTicketsFromServer   =  7;
var EC_PHASE_GettingPointsBalance       =  8;
var EC_PHASE_PurchasingPoints           =  9;
var EC_PHASE_RegisteringVirtualConsole  = 10;
var EC_PHASE_DeleteTicket               = 11;


var EC_CreditCardKind_MasterCard = 0;
var EC_CreditCardKind_Visa       = 1;
var EC_CreditCardKind_Discover   = 2;
var EC_CreditCardKind_Amex       = 3;
var EC_CreditCardKind_DinersClub = 4;
var EC_CreditCardKind_JCB        = 5;

var EC_PaymentMethod_ECard      = 0;
var EC_PaymentMethod_Account    = 1;
var EC_PaymentMethod_CreditCard = 2;

