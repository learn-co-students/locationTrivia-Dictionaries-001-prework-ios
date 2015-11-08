//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    return YES;
}

/** 
 
 *  Write your method implementations here.
 
 */

- (NSString *)stringByTruncatingNameOfLocation:(NSDictionary *)location toLength:(NSUInteger)length {
    NSString *nameOfLocation = location[@"name"];
    NSString *truncatedNameOfLocation = [[NSString alloc] init];
    if (length > nameOfLocation.length) {
        truncatedNameOfLocation = nameOfLocation;
    } else {
        truncatedNameOfLocation = [nameOfLocation substringToIndex:length];
    }
    return truncatedNameOfLocation;
}
- (NSDictionary *)dictionaryForLocationWithName:(NSString *)name latitude:(CGFloat)latitude longitude:(CGFloat)longitude {
    NSMutableDictionary *locationWithName = [[NSMutableDictionary alloc] init];
    locationWithName[@"name"] = name;
    locationWithName[@"latitude"] = @(latitude);
    locationWithName[@"longitude"] = @(longitude);
    return locationWithName;
}
- (NSArray *)namesOfLocations:(NSArray *)locations {
    NSMutableArray *locationsArray = [[NSMutableArray alloc] init];
    for (NSUInteger i = 0; i < locations.count; i++) {
        [locationsArray addObject:locations[i][@"name"]];
    }
    return locationsArray;
}
- (BOOL)dictionaryIsValidLocation:(NSDictionary *)dictionary {
    NSArray *dictionaryKeys = [dictionary allKeys];
    NSArray *correctDictionaryKeys = @[@"name", @"latitude", @"longitude"];
    BOOL isValidLocation = YES;
    if (dictionaryKeys.count != 3) {
        isValidLocation = NO;
    }
    for (NSUInteger i = 0; i < correctDictionaryKeys.count; i++) {
        if (![dictionaryKeys containsObject:correctDictionaryKeys[i]]) {
            isValidLocation = NO;
        }
    }
    return isValidLocation;
}
- (NSDictionary *)locationNamed:(NSString *)name inLocations:(NSArray *)locations {
    NSMutableDictionary *locationByName = [[NSMutableDictionary alloc] init];
    for (NSUInteger i = 0; i < locations.count; i++) {
        if ([name isEqualToString:locations[i][@"name"]]) {
            locationByName = locations[i];
            return locationByName;
        }
    }
    return nil;
}

@end
