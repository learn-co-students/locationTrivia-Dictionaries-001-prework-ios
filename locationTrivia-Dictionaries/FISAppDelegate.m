//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    return YES;
}

-(NSString *)stringByTruncatingNameOfLocation:(NSDictionary *)location
                                     toLength:(NSUInteger)length {
    //stringByTruncatingNameOfLocation:toLength: should return a string containing the beginning of the submitted location's name with the number of letters specified in the length argument.
    //Hint: Look up the substringToIndex: method on NSString.
    
    NSString *name = location[@"name"];
    if (length > name.length) {
        return name;
    }
    return [name substringToIndex:length];
}

-(NSDictionary *)dictionaryForLocationWithName:(NSString *)name
                                      latitude:(CGFloat)latitude
                                     longitude:(CGFloat)longitude {
    //dictionaryForLocationWithName:latitude:longitude: should return a dictionary containing the three argument values stored to keys of the argument names (@"name", @"latitude", @"longitude").
    NSDictionary *location = @{@"name":name,
                               @"latitude":@(latitude),
                               @"longitude":@(longitude) };
    
    return location;
}

-(NSArray *)namesOfLocations:(NSArray *)locations {
    //namesOfLocations: should return an array containing all of the values for the name key in the location dictionaries in the submitted locations array.
    
    NSMutableArray *names = [[NSMutableArray alloc] init];
    for (NSDictionary *location in locations) {
        NSString *name = location[@"name"];
        [names addObject:name];
    }
    return names;
}

-(BOOL)dictionaryIsValidLocation:(NSDictionary *)location {
    //dictionaryIsValidLocation: should return YES only if the submitted location dictionary has exactly three keys by the names of @"name", @"latitude", and @"longitude". If any of these conditions fail, the method should return NO.
    if (location.count != 3) {
        return NO;
    }
    NSNumber *latitudeNumber = location[@"latitude"];
    if (!latitudeNumber) {
        return NO;
    }
    NSNumber *longitudeNumber = location[@"longitude"];
    if (!longitudeNumber) {
        return NO;
    }
    CGFloat latitude = [latitudeNumber floatValue];
    if (latitude > 90.0 || latitude < -90.0) {
        return NO;
    }
    CGFloat longitude = [longitudeNumber floatValue];
    if (longitude > 180.0 || longitude <= -180.0) {
        return NO;
    }
    NSString *name = location[@"name"];
    if (!name) {
        return NO;
    }
    return YES;
}

- (NSDictionary *)locationNamed:(NSString *)name
                    inLocations:(NSArray *)locations {
    for (NSDictionary *location in locations) {
        NSString *locationName = location[@"name"];
        if ([locationName isEqualToString:name]) {
            return location;
        }
    }
    return nil;
}

@end
