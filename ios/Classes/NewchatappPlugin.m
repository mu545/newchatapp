#import "NewchatappPlugin.h"
#if __has_include(<newchatapp/newchatapp-Swift.h>)
#import <newchatapp/newchatapp-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "newchatapp-Swift.h"
#endif

@implementation NewchatappPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftNewchatappPlugin registerWithRegistrar:registrar];
}
@end
