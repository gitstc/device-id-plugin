#import <Cordova/CDVPlugin.h>
#import <Cordova/CDVInvokedUrlCommand.h>
#import "SSKeychain.h"

@interface DeviceIDPlugin : CDVPlugin

- (void)getUniqueIdentifier:(CDVInvokedUrlCommand*)command;

@end