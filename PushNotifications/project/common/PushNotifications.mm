#include "Utils.h"
#import <UIKit/UIKit.h>
#import <objc/runtime.h>


@interface PushNotifications:NSObject
@end

@interface NMEAppDelegate : NSObject <UIApplicationDelegate>
@end
@interface NMEAppDelegate (PushNotifications)
	@property (nonatomic, retain) id pushNotif;
@end
static char const * const PushNotifKey = "pushnotifications";

@implementation NMEAppDelegate (PushNotifications)
@dynamic pushNotif;
	- (id)pushNotif
	{
	    return objc_getAssociatedObject(self, PushNotifKey);
	}

	- (void)setPushNotif:(id)newPushNotif
	{
	    objc_setAssociatedObject(self, PushNotifKey, newPushNotif, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
	}

	- (void)application:(UIApplication*)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData*)deviceToken
    {
        NSLog(@"didRegister");
    	NSLog(@"My token is: %@", deviceToken);
    }

    - (void)application:(UIApplication*)application didFailToRegisterForRemoteNotificationsWithError:(NSError*)error
    {
    	NSLog(@"Failed to get token, error: %@", error);
    }
@end


@implementation PushNotifications
- (id)init
    {
		NSLog(@"Init");
		return self;
	}

	- (void)register
	{
		[[UIApplication sharedApplication]
			registerForRemoteNotificationTypes:(UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound)];
		[UIApplication sharedApplication].applicationIconBadgeNumber = 0;
	}
@end

namespace pushnotifications
{
	PushNotifications* push;
	void GetDeviceToken()
	{
        push = [[PushNotifications alloc] init];
        NMEAppDelegate *app = [[UIApplication sharedApplication] delegate];
        [app setPushNotif:push];
		[push register];
	}

}