#import "BioMod.h"


@implementation BioMod

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(isSensorAvailable:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject)
{
    LAContext *context = [[LAContext alloc] init];
    
    if ([context canEvaluatePolicy:LAPolicyDeviceOwnerAuthentication error:NULL]) {
        resolve([self getBiometryType:context]);
    } else {
        resolve(Nil);
    }
}

- (NSString *)getBiometryType:(LAContext *)context
{
    if (@available(iOS 11, *)) {
        return (context.biometryType == LABiometryTypeFaceID) ? @"FaceID" : @"TouchID";
    }
    
    return @"TouchID";
}

RCT_EXPORT_METHOD(simplePrompt: (NSString *)promptMessage timeout: (nonnull NSNumber *)timeout resolver:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject) {
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        LAContext *context = [[LAContext alloc] init];
        context.localizedFallbackTitle = @"";
        __block Boolean complete = false;
        [context evaluatePolicy:LAPolicyDeviceOwnerAuthentication localizedReason:promptMessage reply:^(BOOL success, NSError *fingerprintError) {
            complete = true;
            if (success) {
                resolve(@(YES));
            } else {
                reject(@"fingerprint_error", @"Could not confirm fingerprint", nil);
            }
        }];
        
        dispatch_time_t delay = dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC * [timeout intValue]);
        dispatch_after(delay, dispatch_get_main_queue(), ^(void){
            if (!complete) {
                [context invalidate];
            }
        });
    });
}

@end
