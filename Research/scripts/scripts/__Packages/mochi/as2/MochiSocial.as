class mochi.as2.MochiSocial
{
   static var LOGGED_IN = "LoggedIn";
   static var LOGGED_OUT = "LoggedOut";
   static var LOGIN_SHOW = "LoginShow";
   static var LOGIN_HIDE = "LoginHide";
   static var LOGIN_SHOWN = "LoginShown";
   static var PROFILE_SHOW = "ProfileShow";
   static var PROFILE_HIDE = "ProfileHide";
   static var PROPERTIES_SAVED = "PropertySaved";
   static var WIDGET_LOADED = "WidgetLoaded";
   static var USER_INFO = "UserInfo";
   static var ERROR = "Error";
   static var IO_ERROR = "IOError";
   static var NO_USER = "NoUser";
   static var PROPERTIES_SIZE = "PropertiesSize";
   static var _dispatcher = new mochi.as2.MochiEventDispatcher();
   function MochiSocial()
   {
   }
   static function getVersion()
   {
      return mochi.as2.MochiServices.getVersion();
   }
   static function showLoginWidget(options)
   {
      mochi.as2.MochiServices.setContainer();
      mochi.as2.MochiServices.stayOnTop();
      mochi.as2.MochiServices.send("coins_showLoginWidget",{options:options});
   }
   static function hideLoginWidget()
   {
      mochi.as2.MochiServices.send("coins_hideLoginWidget");
   }
   static function requestLogin()
   {
      mochi.as2.MochiServices.send("coins_requestLogin");
   }
   static function getUserInfo()
   {
      mochi.as2.MochiServices.send("coins_getUserInfo");
   }
   static function saveUserProperties(properties)
   {
      mochi.as2.MochiServices.send("coins_saveUserProperties",properties);
   }
   static function addEventListener(eventType, delegate)
   {
      _dispatcher.addEventListener(eventType,delegate);
   }
   static function triggerEvent(eventType, args)
   {
      _dispatcher.triggerEvent(eventType,args);
   }
   static function removeEventListener(eventType, delegate)
   {
      _dispatcher.removeEventListener(eventType,delegate);
   }
}
