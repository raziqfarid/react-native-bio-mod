#import "BioMod.h"


@implementation BioMod

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(sampleMethod:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject)

{
    resolve(true);
//    // TODO: Implement some actually useful functionality
//    callback(@[[NSString stringWithFormat: @"numberArgument: %@ stringArgument: %@", numberArgument, stringArgument]]);
}

@end
