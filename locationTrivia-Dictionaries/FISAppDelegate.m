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
    
    NSMutableArray *namesOfLocations = [NSMutableArray arrayWithCapacity:[locations count]];
    for (NSDictionary *location in locations) {
        [namesOfLocations addObject:location[@"name"]];
    }
    return namesOfLocations;
}

- (BOOL)dictionaryIsValidLocation:(NSDictionary *)dictionary {
    
    if ([[dictionary allKeys] count] != 3) {
        return NO;
    }
    
    NSString *name = dictionary[@"name"];
    if (!name || [name isEqualToString:@""]) {
        return NO;
    }
    
    NSNumber *latitude = dictionary[@"latitude"];
    if (!latitude || (fabsf([latitude floatValue]) > 90.0f)) {
        return NO;
    }
    
    NSNumber *longitude = dictionary[@"longitude"];
    if (!longitude || (fabsf([longitude floatValue]) > 180.0f)) {
        return NO;
    }
    
    return YES;
}

- (NSDictionary *)locationNamed:(NSString *)name inLocations:(NSArray *)locations {
    
    return nil;
}

@end
