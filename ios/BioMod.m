#import "BioMod.h"


@implementation BioMod

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(sampleMethod: (RCTResponseSenderBlock)callback)

{
   NSArray *nativeModuleList = @[@"react-native-fbsdk", @"react-native-camera", @"react-native-maps"];
   callback(@[[NSNull null], nativeModuleList]);
//    // TODO: Implement some actually useful functionality
//    callback(@[[NSString stringWithFormat: @"numberArgument: %@ stringArgument: %@", numberArgument, stringArgument]]);
}

@end
