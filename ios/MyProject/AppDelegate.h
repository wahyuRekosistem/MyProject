#import <RCTAppDelegate.h>
#import <UIKit/UIKit.h>
#import <React/RCTBridgeModule.h>

@interface AppDelegate : RCTAppDelegate

@end

@interface RCT_EXTERN_MODULE(CustomModule, NSObject)
RCT_EXTERN_METHOD(showAlert: (NSString *)message)
RCT_EXTERN_METHOD(showBlueView: (RCTResponseSenderBlock)callback)

@end
