//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    return YES;
}

/*
 stringByTruncatingNameOfLocation:toLength: should return a string containing the beginning of the submitted location's name with the number of letters specified in the length argument.
 Hint: Look up the substringToIndex: method on NSString.
 dictionaryForLocationWithName:latitude:longitude: should return a dictionary containing the three argument values stored to keys of the argument names (@"name", @"latitude", @"longitude").
 namesOfLocations: should return an array containing all of the values for the name key in the location dictionaries in the submitted locations array.
 dictionaryIsValidLocation: should return YES only if the submitted location dictionary has exactly three keys by the names of @"name", @"latitude", and @"longitude". If any of these conditions fail, the method should return NO.
 
 Advanced: Write additional checks to determine that the value for latitude falls between -90.0 and 90.0, that the value for longitude falls between 180.0 and -180.0, and that the value for name is not an empty string. However, there are no tests for these cases.
 locationNamed:inLocations: should return the location dictionary in the submitted locations array with the matching value for the name key as the submitted name string. If there are no matches, then it should return nil.
 */

-(NSString *)stringByTruncatingNameOfLocation:(NSDictionary *)location toLength:(NSUInteger)length {
    
    NSString *name = [location[@"name"] mutableCopy];
    
    if (length <= [name length]) {
        name = [name substringToIndex:length];
    }
    
    return name;
    
}

-(NSDictionary *)dictionaryForLocationWithName:(NSString *)name latitude:(CGFloat)latitude longitude:(CGFloat)longitude {
    
    NSDictionary *locationDict = @{
                                   @"name": name,
                                   @"latitude": @(latitude),
                                   @"longitude": @(longitude)
                                   };
    
    return locationDict;
}

-(NSArray *)namesOfLocations:(NSArray *)locations {
    
    return [locations valueForKey:@"name"];
    
}

-(BOOL)dictionaryIsValidLocation:(NSDictionary *)location {
    
    NSArray *keys = [location allKeys];
    
    if ([keys count] == 3 && [keys containsObject:@"name"] && [keys containsObject:@"latitude"] && [keys containsObject:@"longitude"]) {
        
        // Advanced
        CGFloat latitude = [location[@"latitude"] floatValue];
        CGFloat longitude = [location[@"longitude"] floatValue];
        
        if ((location[@"name"]) && (latitude >= -90.0 && latitude <= 90.0) && (longitude >= -180.0 && longitude <= 180.0)) {
            return YES;
        } else {
            return NO;
        }
        
    } else {
        return NO;
    }
}

-(NSDictionary *)locationNamed:(NSString *)name inLocations:(NSArray *)locations {
    
    for (NSDictionary *location in locations) {
        if ([location[@"name"] isEqualToString:name]) {
            return location;
        }
    }
    
    return nil;
    
}

@end
