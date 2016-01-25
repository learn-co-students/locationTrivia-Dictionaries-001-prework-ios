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

// return string  of location name based on specified number of letters; return name if length larger than name
- (NSString *)stringByTruncatingNameOfLocation:(NSDictionary *)location toLength:(NSUInteger)length{
    NSString *truncatedLocationName;
    NSString *locationName = location[@"name"];
    
    if (length <= [locationName length]) {
        truncatedLocationName = [locationName substringToIndex:length];
    } else {
        truncatedLocationName = locationName;
    }
    
    return truncatedLocationName;
}

// returns dictionary with name, latitude, and longitude
- (NSDictionary *)dictionaryForLocationWithName:(NSString *)name latitude:(CGFloat)latitude longitude:(CGFloat)longitude{
    
    
    NSDictionary *location = @{@"name" : name,
                               @"latitude" : [NSNumber numberWithDouble:latitude],
                               @"longitude" : [NSNumber numberWithDouble:longitude]};
    return location;
}

// return array of all values in name key from dictionaries in submitted locations array
- (NSArray *)namesOfLocations:(NSArray *)locations{
    NSMutableArray *locationArray = [[NSMutableArray alloc] init];
    
    for (NSDictionary *locationDictionary in locations){
        [locationArray addObject:locationDictionary[@"name"]];
    }
    
    return locationArray;
}

// return YES if dictionary has three keys by the names of @"name", @"latitude", @"longitude"
- (BOOL)dictionaryIsValidLocation:(NSDictionary *)dictionary{
    BOOL validLocation = NO;
    NSArray *locationArray = [dictionary allKeys];
    
    if ([locationArray containsObject:@"name"]&&[locationArray containsObject:@"latitude"]&&[locationArray containsObject:@"longitude"]) {
        validLocation = YES;
    }
    
    if ([locationArray count] > 3) {
        validLocation = NO;
    }
    
    return validLocation;
}

// return location dictionary from locations array based on name string; if no matchese return nil
- (NSDictionary *)locationNamed:(NSString *)name inLocations:(NSArray *)locations{
    NSDictionary *matchingLocation;
    
    for (NSDictionary *locationEntry in locations){
        if (locationEntry[@"name"] == name) {
            matchingLocation = locationEntry;
        }
    }
    
    return matchingLocation;
}

@end
