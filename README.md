Haxe-PushNotifications-ios
==========================

<include path="PushNotifications" if="ios"/>
<source path="PushNotifications/src" /> (FlashDevelop won't compile without this, IntelliJ works fine)

Anywhere in hx file:
PushNotifications.getDeviceToken(); -> asks for permission and logs device's token to the console
