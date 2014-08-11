package;

#if cpp
import cpp.Lib;
#elseif neko
import neko.Lib;
#end

#if (android && openfl)
import openfl.utils.JNI;
#end


class PushNotifications
{
    //TODO-callback
	//public static function getDeviceToken (callback:String -> Void):Void
    public static function getDeviceToken ():Void
    {
    #if ios
        //pushnotifications_setcallback(callback);
		pushnotifications_gettoken();
	#end

	}
	private static var pushnotifications_gettoken = Lib.load ("pushnotifications", "pushnotifications_gettoken", 0);
    private static var pushnotifications_setcallback = Lib.load("pushnotifications", "pushnotifications_setcallback", 1);
}