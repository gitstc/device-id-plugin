#import "DeviceIDPlugin.h"
#import <AdSupport/AdSupport.h>

#import <dlfcn.h>
#import <mach/port.h>
#import <mach/kern_return.h>

@interface DeviceIDPlugin()

@end

@implementation DeviceIDPlugin

- (void)getUniqueIdentifier:(CDVInvokedUrlCommand*)command
{
	NSString *appName=[[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString*)kCFBundleNameKey];

    NSString *strApplicationUUID = [SSKeychain passwordForService:appName account:@"incoding"];
    if (strApplicationUUID == nil)
    {
        strApplicationUUID  = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
        [SSKeychain setPassword:strApplicationUUID forService:appName account:@"incoding"];
    }

	CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:strApplicationUUID];
	[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end