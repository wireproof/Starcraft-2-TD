class mochi.as2.MochiServices
{
   var _callbacks;
   var isLoading;
   var onEnterFrame;
   var startTime;
   var waitInterval;
   static var _clip;
   static var _container;
   static var _id;
   static var _listenChannel;
   static var _sendChannel;
   static var _sendChannelName;
   static var onError;
   static var _servURL = "http://www.mochiads.com/static/lib/services/";
   static var _services = "services.swf";
   static var _mochiLC = "MochiLC.swf";
   static var _listenChannelName = "__ms_";
   static var _connecting = false;
   static var _connected = false;
   static var netup = true;
   static var netupAttempted = false;
   static var servicesSync = new mochi.as2.MochiSync();
   function MochiServices()
   {
   }
   static function get id()
   {
      return _id;
   }
   static function get clip()
   {
      return _container;
   }
   static function get childClip()
   {
      return _clip;
   }
   static function getVersion()
   {
      return "3.7 as2";
   }
   static function allowDomains(server)
   {
      var _loc1_ = server.split("/")[2].split(":")[0];
      if(System.security)
      {
         if(System.security.allowDomain)
         {
            System.security.allowDomain("*");
            System.security.allowDomain(_loc1_);
         }
         if(System.security.allowInsecureDomain)
         {
            System.security.allowInsecureDomain("*");
            System.security.allowInsecureDomain(_loc1_);
         }
      }
      return _loc1_;
   }
   static function get isNetworkAvailable()
   {
      var _loc1_;
      if(System.security)
      {
         _loc1_ = System.security;
         if(_loc1_.sandboxType == "localWithFile")
         {
            return false;
         }
      }
      return true;
   }
   static function set comChannelName(val)
   {
      if(val != undefined)
      {
         if(val.length > 3)
         {
            _sendChannelName = val + "_fromgame";
            initComChannels();
         }
      }
   }
   static function get connected()
   {
      return _connected;
   }
   static function connect(id, clip, onError)
   {
      warnID(id,false);
      if(!_connected && _clip == undefined)
      {
         trace("MochiServices Connecting...");
         _connecting = true;
         init(id,clip);
      }
      if(onError != undefined)
      {
         mochi.as2.MochiServices.onError = onError;
      }
      else if(mochi.as2.MochiServices.onError == undefined)
      {
         mochi.as2.MochiServices.onError = function(errorCode)
         {
            trace(errorCode);
         };
      }
   }
   static function disconnect()
   {
      if(_connected || _connecting)
      {
         _connecting = _connected = false;
         flush(true);
         if(_clip != undefined)
         {
            _clip.removeMovieClip();
            delete _clip;
         }
         _listenChannel.close();
      }
   }
   static function init(id, clip)
   {
      _id = id;
      if(clip != undefined)
      {
         _container = clip;
      }
      else
      {
         _container = _root;
      }
      loadCommunicator(id,_container);
   }
   static function loadCommunicator(id, clip)
   {
      var _loc6_ = "_mochiservices_com_" + id;
      var _loc5_ = new MovieClipLoader();
      var _loc3_ = {};
      if(_clip != null)
      {
         return _clip;
      }
      if(!isNetworkAvailable)
      {
         return null;
      }
      if(urlOptions().servURL)
      {
         _servURL = urlOptions().servURL;
      }
      var _loc4_ = _servURL + _services;
      if(urlOptions().servicesURL)
      {
         _loc4_ = urlOptions().servicesURL;
      }
      allowDomains(_loc4_);
      _clip = clip.createEmptyMovieClip(_loc6_,10336,false);
      _listenChannelName += Math.floor(new Date().getTime()) + "_" + Math.floor(Math.random() * 99999);
      listen();
      if(_loc3_.waitInterval != null)
      {
         clearInterval(_loc3_.waitInterval);
      }
      _loc3_.onLoadError = loadError;
      _loc3_.onLoadStart = function(target_mc)
      {
         this.isLoading = true;
      };
      _loc3_.onLoadComplete = function(target_mc)
      {
         target_mc.MochiServices = mochi.as2.MochiServices;
      };
      _loc3_.startTime = getTimer();
      _loc3_.wait = function()
      {
         if(getTimer() - this.startTime > 10000)
         {
            if(!this.isLoading)
            {
               disconnect();
               onError.apply(null,["IOError"]);
            }
            clearInterval(this.waitInterval);
         }
      };
      _loc3_.waitInterval = setInterval(_loc3_,"wait",1000);
      _loc5_.addListener(_loc3_);
      _loc5_.loadClip(_loc4_ + "?listenLC=" + _listenChannelName + "&mochiad_options=" + escape(_root.mochiad_options) + "&api_version=" + getVersion(),_clip);
      _sendChannel = new LocalConnection();
      _sendChannel._queue = [];
      return _clip;
   }
   static function loadError(target_mc, errorCode, httpStatus)
   {
      trace("MochiServices could not load.");
      disconnect();
      onError.apply(null,[errorCode]);
   }
   static function onStatus(infoObject)
   {
      var _loc0_;
      if((_loc0_ = infoObject.level) === "error")
      {
         _connected = false;
         _listenChannel.connect(_listenChannelName);
      }
   }
   static function listen()
   {
      _listenChannel = new LocalConnection();
      _listenChannel.handshake = function(args)
      {
         comChannelName = args.newChannel;
      };
      _listenChannel.allowDomain = function(d)
      {
         return true;
      };
      _listenChannel.allowInsecureDomain = _listenChannel.allowDomain;
      _listenChannel._nextcallbackID = 0;
      _listenChannel._callbacks = {};
      _listenChannel.connect(_listenChannelName);
      trace("Waiting for MochiAds services to connect...");
   }
   static function initComChannels()
   {
      if(!_connected)
      {
         _sendChannel.onStatus = function(infoObject)
         {
            onStatus(infoObject);
         };
         _sendChannel.send(_sendChannelName,"onReceive",{methodName:"handshakeDone"});
         _sendChannel.send(_sendChannelName,"onReceive",{methodName:"registerGame",id:_id,version:getVersion()});
         _listenChannel.onStatus = function(infoObject)
         {
            onStatus(infoObject);
         };
         _listenChannel.onReceive = function(pkg)
         {
            var _loc5_ = pkg.callbackID;
            var _loc4_ = this._callbacks[_loc5_];
            if(!_loc4_)
            {
               return undefined;
            }
            var _loc2_ = _loc4_.callbackMethod;
            var _loc3_ = _loc4_.callbackObject;
            if(_loc3_ && typeof _loc2_ == "string")
            {
               _loc2_ = _loc3_[_loc2_];
            }
            if(_loc2_ != undefined)
            {
               _loc2_.apply(_loc3_,pkg.args);
            }
            delete this._callbacks[_loc5_];
         };
         _listenChannel.onEvent = function(pkg)
         {
            switch(pkg.target)
            {
               case "events":
                  mochi.as2.MochiEvents.triggerEvent(pkg.event,pkg.args);
                  break;
               case "coins":
                  mochi.as2.MochiSocial.triggerEvent(pkg.event,pkg.args);
                  break;
               case "sync":
                  servicesSync.triggerEvent(pkg.event,pkg.args);
               default:
                  return;
            }
         };
         _listenChannel.onError = function()
         {
            onError.apply(null,["IOError"]);
         };
         trace("[SERVICES_API] connected!");
         _connecting = false;
         _connected = true;
         while(_sendChannel._queue.length > 0)
         {
            _sendChannel.send(_sendChannelName,"onReceive",_sendChannel._queue.shift());
         }
      }
   }
   static function flush(error)
   {
      var _loc1_;
      var _loc2_;
      while(_sendChannel._queue.length > 0)
      {
         _loc1_ = _sendChannel._queue.shift();
         false;
         if(_loc1_.callbackID != null)
         {
            _loc2_ = _listenChannel._callbacks[_loc1_.callbackID];
         }
         delete _listenChannel._callbacks[_loc1_.callbackID];
         if(error)
         {
            handleError(_loc1_.args,_loc2_.callbackObject,_loc2_.callbackMethod);
         }
      }
   }
   static function handleError(args, callbackObject, callbackMethod)
   {
      if(args != null)
      {
         if(args.onError != null)
         {
            args.onError.apply(null,["NotConnected"]);
         }
         if(args.options != null && args.options.onError != null)
         {
            args.options.onError.apply(null,["NotConnected"]);
         }
      }
      if(callbackMethod != null)
      {
         args = {};
         args.error = true;
         args.errorCode = "NotConnected";
         if(callbackObject != null && typeof callbackMethod == "string")
         {
            callbackObject[callbackMethod](args);
         }
         else if(callbackMethod != null)
         {
            callbackMethod.apply(args);
         }
      }
   }
   static function send(methodName, args, callbackObject, callbackMethod)
   {
      if(_connected)
      {
         _sendChannel.send(_sendChannelName,"onReceive",{methodName:methodName,args:args,callbackID:_listenChannel._nextcallbackID});
      }
      else
      {
         if(_clip == undefined || !_connecting)
         {
            trace("Error: MochiServices not connected.   Please call MochiServices.connect().  Function: " + methodName);
            handleError(args,callbackObject,callbackMethod);
            flush(true);
            return undefined;
         }
         _sendChannel._queue.push({methodName:methodName,args:args,callbackID:_listenChannel._nextcallbackID});
      }
      _listenChannel._callbacks[_listenChannel._nextcallbackID] = {callbackObject:callbackObject,callbackMethod:callbackMethod};
      _listenChannel._nextcallbackID++;
   }
   static function urlOptions()
   {
      var _loc5_ = {};
      var _loc6_;
      var _loc2_;
      if(_root._url.indexOf("mochiad_options") != -1)
      {
         _loc2_ = _root._url.indexOf("mochiad_options") + "mochiad_options".length + 1;
         _loc6_ = _root._url.substr(_loc2_,_root._url.length);
      }
      else if(_root.mochiad_options)
      {
         _loc6_ = _root.mochiad_options;
      }
      var _loc4_;
      var _loc3_;
      if(_loc6_)
      {
         _loc4_ = _root.mochiad_options.split("&");
         _loc2_ = 0;
         while(_loc2_ < _loc4_.length)
         {
            _loc3_ = _loc4_[_loc2_].split("=");
            _loc5_[unescape(_loc3_[0])] = unescape(_loc3_[1]);
            _loc2_ = _loc2_ + 1;
         }
      }
      return _loc5_;
   }
   static function warnID(bid, leaderboard)
   {
      bid = bid.toLowerCase();
      if(bid.length != 16)
      {
         trace("WARNING: " + (!leaderboard ? "game" : "board") + " ID is not the appropriate length");
         return undefined;
      }
      if(bid == "1e113c7239048b3f")
      {
         if(leaderboard)
         {
            trace("WARNING: Using testing board ID");
         }
         else
         {
            trace("WARNING: Using testing board ID as game ID");
         }
         return undefined;
      }
      if(bid == "84993a1de4031cd8")
      {
         if(leaderboard)
         {
            trace("WARNING: Using testing game ID as board ID");
         }
         else
         {
            trace("WARNING: Using testing game ID");
         }
         return undefined;
      }
      var _loc1_ = 0;
      while(_loc1_ < bid.length)
      {
         switch(bid.charAt(_loc1_))
         {
            case "0":
            case "1":
            case "2":
            case "3":
            case "4":
            case "5":
            case "6":
            case "7":
            case "8":
            case "9":
            case "a":
            case "b":
            case "c":
            case "d":
            case "e":
            case "f":
               break;
            default:
               trace("WARNING: Board ID contains illegal characters: " + bid);
               return undefined;
         }
         _loc1_ = _loc1_ + 1;
      }
   }
   static function addLinkEvent(url, burl, btn, onClick)
   {
      var timeout = 1500;
      var t0 = getTimer();
      var _loc2_ = new Object();
      _loc2_.mav = getVersion();
      _loc2_.swfv = btn.getSWFVersion() || 6;
      _loc2_.swfurl = btn._url;
      _loc2_.fv = System.capabilities.version;
      _loc2_.os = System.capabilities.os;
      _loc2_.lang = System.capabilities.language;
      _loc2_.scres = System.capabilities.screenResolutionX + "x" + System.capabilities.screenResolutionY;
      var s = "?";
      var _loc3_ = 0;
      for(var _loc6_ in _loc2_)
      {
         if(_loc3_ != 0)
         {
            s += "&";
         }
         _loc3_ = _loc3_ + 1;
         s = s + _loc6_ + "=" + escape(_loc2_[_loc6_]);
      }
      var _loc7_;
      if(!(netupAttempted || _connected))
      {
         var ping = btn.createEmptyMovieClip("ping",777);
         _loc7_ = btn.createEmptyMovieClip("nettest",778);
         netupAttempted = true;
         ping.loadMovie("http://x.mochiads.com/linkping.swf?t=" + getTimer());
         _loc7_.onEnterFrame = function()
         {
            if(ping._totalframes > 0 && ping._totalframes == ping._framesloaded)
            {
               delete this.onEnterFrame;
            }
            else if(getTimer() - t0 > timeout)
            {
               delete this.onEnterFrame;
               netup = false;
            }
         };
      }
      var _loc4_ = btn.createEmptyMovieClip("clk",1001);
      _loc4_._alpha = 0;
      _loc4_.beginFill(1044735);
      _loc4_.moveTo(0,0);
      _loc4_.lineTo(0,btn._height);
      _loc4_.lineTo(btn._width,btn._height);
      _loc4_.lineTo(btn._width,0);
      _loc4_.lineTo(0,0);
      _loc4_.endFill();
      _loc4_.onRelease = function()
      {
         if(netup)
         {
            getURL(url + s,"_blank");
         }
         else
         {
            getURL(burl,"_blank");
         }
         if(onClick != undefined)
         {
            onClick();
         }
      };
   }
   static function setContainer(clip)
   {
   }
   static function stayOnTop(clip)
   {
   }
}
