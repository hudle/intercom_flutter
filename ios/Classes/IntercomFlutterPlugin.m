#import "IntercomFlutterPlugin.h"
#if __has_include(<intercom_flutter/intercom_flutter-Swift.h>)
#import <intercom_flutter/intercom_flutter-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "intercom_flutter-Swift.h"
#endif

@implementation IntercomFlutterPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftIntercomFlutterPlugin registerWithRegistrar:registrar];
}
@end
