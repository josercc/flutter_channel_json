#import "FlutterChannelJsonPlugin.h"
#if __has_include(<flutter_channel_json/flutter_channel_json-Swift.h>)
#import <flutter_channel_json/flutter_channel_json-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutter_channel_json-Swift.h"
#endif

@implementation FlutterChannelJsonPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterChannelJsonPlugin registerWithRegistrar:registrar];
}
@end
