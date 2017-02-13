//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    return YES;
}

// stringByTruncatingNameOfLocation:toLength: that takes two arguments, an NSDictionary called location and an NSUInteger called length; and returns an NSString.

//stringByTruncatingNameOfLocation:toLength: should return a string containing the beginning of the submitted location's name with the number of letters specified in the length argument.

//Hint: Look up the substringToIndex: method on NSString.

-(NSString *)stringByTruncatingNameOfLocation : (NSDictionary *)location
                                     toLength : (NSInteger) length{
    
    NSString *name = location[@"name"];
    if (length < 0){
        return name;
    }
    else if (length > name.length) {
        return name;
    }
    else {
        return [name substringToIndex:length];
    }
}

//dictionaryForLocationWithName:latitude:longitude: that takes three arguments, an NSString called name, and two CGFloats called latitude and longitude; and returns an NSDictionary.

//dictionaryForLocationWithName:latitude:longitude: should return a dictionary containing the three argument values stored to keys of the argument names (@"name", @"latitude", @"longitude").

-(NSDictionary *)dictionaryForLocationWithName:(NSString *)name
                                      latitude:(CGFloat)latitude
                                     longitude:(CGFloat)longitude{
    
    NSNumber *numLatitude = @(latitude);
    NSNumber *numLongitude = @(longitude);
    NSDictionary *location = @{@"name" : name,
                               @"latitude" : numLatitude,
                               @"longitude" : numLongitude};
    return location;
}

//namesOfLocations: that takes one NSArray argument called locations and returns an NSArray.

//namesOfLocations: should return an array containing all of the values for the name key in the location dictionaries in the submitted locations array.

-(NSArray *)namesOfLocations : (NSArray *)locations{
    NSMutableArray *namesOfLocations = [[NSMutableArray alloc] init];
    for (NSDictionary *location in locations) {
        NSString *nameOfLocation = location[@"name"];
        [namesOfLocations addObject:nameOfLocation];
    }
    return namesOfLocations;
}

// dictionaryIsValidLocation: that takes one NSDictionary argument and returns a BOOL.

//dictionaryIsValidLocation: should return YES only if the submitted location dictionary has exactly three keys by the names of @"name", @"latitude", and @"longitude". If any of these conditions fail, the method should return NO.

//Advanced: Write additional checks to determine that the value for latitude falls between -90.0 and 90.0, that the value for longitude falls between 180.0 and -180.0, and that the value for name is not an empty string. However, there are no tests for these cases.

-(BOOL)dictionaryIsValidLocation : (NSDictionary *)location{
    NSArray *neededKeys = [location allKeys];
    bool *validLocation = ([neededKeys containsObject:@"name"] &&
                           [neededKeys containsObject:@"longitude"] &&
                           [neededKeys containsObject:@"latitude"] &&
                           (neededKeys.count == 3));
    return validLocation;
}
// locationNamed:inLocations: that takes two arguments, an NSString called name and an NSArray called locations; and returns an NSDictionary.
// locationNamed:inLocations: should return the location dictionary in the submitted locations array with the matching value for the name key as the submitted name string. If there are no matches, then it should return nil.

-(NSDictionary *)locationNamed : (NSString *)name
                   inLocations : (NSArray *)locations{
    for (NSDictionary *location in locations) {
        NSString *place = location[@"name"];
        if ([place isEqualToString:name]){
            return location;
        }
    
    }
    return nil;
}
@end