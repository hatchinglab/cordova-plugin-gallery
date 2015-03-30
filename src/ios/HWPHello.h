#import <Cordova/CDV.h>

@interface HWPHello : CDVPlugin

- (void)show:(CDVInvokedUrlCommand*)command;
- (void)isPhone:(CDVInvokedUrlCommand*)command;
- (void)isTablet:(CDVInvokedUrlCommand*)command;
//- (void)show:(CDVInvokedUrlCommand*)command;

@end
