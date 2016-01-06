//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    return YES;
}

- (NSString *)stringByTruncatingNameOfLocation:(NSDictionary *)location toLength:(NSUInteger)length {
    
    NSMutableString *truncatedString = [location[@"name"] mutableCopy];
    return [truncatedString substringToIndex:fmin(length, [truncatedString length])];
}

- (NSDictionary *)dictionaryForLocationWithName:(NSString *)name latitude:(CGFloat)latitude longitude:(CGFloat)longitude {
    
    return [NSDictionary dictionaryWithObjects:@[name, @(latitude), @(longitude)] forKeys:@[@"name", @"latitude", @"longitude"]];
}

- (NSArray *)namesOfLocations:(NSArray *)locations {
    
    return nil;
}

- (BOOL)dictionaryIsValidLocation:(NSDictionary *)dictionary {
    
    return NO;
}

- (NSDictionary *)locationNamed:(NSString *)name inLocations:(NSArray *)locations {
    
    return nil;
}

@end
