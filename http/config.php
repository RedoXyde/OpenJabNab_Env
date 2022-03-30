<?php
define('OJN_API_HOST','localhost');
define('OJN_API_PORT',8081);
define('OJN_API_ROOT','/home/ojn/ojn_env/http/');

define('APC_PREFIX', 'ojn');

define('DB_HOST','localhost');
define('DB_USER','YOUR_OJN_DB_USER');
define('DB_PASS','YOUR_OJN_DB_PASS');
define('DB_NAME','YOUR_OJN_DB');

define('MAIL_SERVER', 'YOUR_MAIL_SERVER');
define('MAIL_USER', 'YOUR_MAIL_USER');
define('MAIL_PASS', 'YOUR_MAIL_PASS');
define('MAIL_SENDER', 'webmaster@YOUR_DOMAIN');

define('ROOT_BASE', realpath(dirname(__FILE__)).'/');
define('ROOT_SITE', realpath(ROOT_BASE.'/http-wrapper').'/');
define('ROOT_LOCAL', realpath(ROOT_BASE.'/ojn_local').'/');
define('ROOT_SERVER', realpath(ROOT_BASE.'/../OpenJabNab/server').'/');
define('ROOT_DATA', realpath(ROOT_BASE.'/../build/bin/data/').'/');
define('HOSTNAME','http://YOUR_DOMAIN');
define('HOSTNAME_SSL','https://YOUR_DOMAIN');
define('ROOT_WWW_ADMIN', HOSTNAME.'/');
define('ROOT_WWW_API', HOSTNAME.'/ojn_api/');
define('ROOT_WWW_EXTAPI', HOSTNAME.'/ojn_api/');
define('ADMIN_EMAIL', 'webmaster@YOUR_DOMAIN');
define('QUOTA', 25);


define('CACHE_SITE', OJN_API_ROOT.'cache/');
define('LOGS_SITE',  OJN_API_ROOT.'cache/logs/');
define('LOG_OJNAPI', false);

define('CRON_API_USER','YOUR_CRON_USER');
define('CRON_API_PWD', 'YOUR_CRON_PASS');

define('ADMIN_API_USER','YOUR_SCRIPT_ADMIN_USER');
define('ADMIN_API_PWD','YOUR_SCRIPT_ADMIN_PASS');

define('ENABLE_DONATE', false);
define('ENABLE_PREMIUM', false);

define('SERVER_MONTHLY_FEES', 0.0);

define('PAYPAL_VALIDATE_NOTIFY', true);
define('PAYPAL_LOG_NOTIFY', true);
define('PAYPAL_TXN_LOG_FILE',LOGS_SITE.'paypal_txns_GkA1JRZIgC.log');
define('PAYPAL_LOG_FILE',LOGS_SITE.'paypal_RIEMlDIcjd.log');
define('USE_PAYPAL_SANDBOX', false);

if(USE_PAYPAL_SANDBOX)
{
  // https://www.sandbox.paypal.com/cgi-bin/webscr?cmd=_button-management
  define('PAYPAL_DONATE_BTN_ID','YOUR_PAYPAL_SANDBOX_DONATE_BTN_ID');
  define('PAYPAL_PREMIUM_BTN_ID','YOUR_PAYPAL_SANDBOX_DONATE_BTN_ID');
}
else
{
  // https://www.paypal.com/fr/cgi-bin/webscr?cmd=_button-management
  define('PAYPAL_DONATE_BTN_ID','YOUR_PAYPAL_DONATE_BTN_ID');
  define('PAYPAL_PREMIUM_BTN_ID','YOUR_PAYPAL_DONATE_BTN_ID');
}

define('THUNDERFOREST_APIKEY','YOUR_THUNDERFOREST_APIKEY');
define('IPSTACK_APIKEY','YOUR_IPSTACK_APIKEY');
define('IPGEOLOCATION_APIKEY','YOUR_IPGEOLOCATION_APIKEY');
define('GEO_MAX_CONSECUTIVE_ERRORS',10);

define('YWEATHER_APPID','YOUR_YWEATHER_APPID');
define('YWEATHER_KEY','YOUR_YWEATHER_KEY');
define('YWEATHER_SECRET','YOUR_YWEATHER_SECRET');

define('WEATHERAPI_KEY','YOUR_WEATHERAPI_KEY');

?>
