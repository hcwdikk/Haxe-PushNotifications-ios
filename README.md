Haxe-PushNotifications-ios
==========================

application.xml:<br>
&lt;include path="PushNotifications" if="ios"/&gt; <br>
&lt;source path="PushNotifications/src" /&gt; //FlashDevelop won't compile without this, IntelliJ works fine


Anywhere in hx file:
PushNotifications.getDeviceToken(); -> asks for permission and logs device's token to the console
