#import "AppInstallDate.h"

@implementation AppInstallDate

RCT_EXPORT_MODULE()

// Example method
// See // https://reactnative.dev/docs/native-modules-ios
RCT_REMAP_METHOD(multiply,
                 multiplyWithA:(nonnull NSNumber*)a withB:(nonnull NSNumber*)b
                 withResolver:(RCTPromiseResolveBlock)resolve
                 withRejecter:(RCTPromiseRejectBlock)reject)
{
    NSURL* urlToDocumentsFolder = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
  __autoreleasing NSError *error;
  NSDate *installDate = [[[NSFileManager defaultManager] attributesOfItemAtPath:urlToDocumentsFolder.path error:&error] objectForKey:NSFileCreationDate];
  
  
  NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
  [dateFormatter setDateFormat:@"dd/MM/yyyy hh:mm:ss"];
  
  NSString *stringDate = [dateFormatter stringFromDate:installDate];

  resolve(stringDate);
}

@end
