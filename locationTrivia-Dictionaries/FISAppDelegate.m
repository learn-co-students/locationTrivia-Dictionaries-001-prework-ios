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

//stringByTruncatingNameOfLocation:toLength: that takes two arguments, an NSDictionary called location and an NSUInteger called length; and returns an NSString.

- (NSString *)stringByTruncatingNameOfLocation:(NSDictionary *)location
                                      toLength:(NSUInteger)length {
    
    NSString *name = location[@"name"];
    if(length > name.length) {
        return name;
    }
    
    return [name substringToIndex:length];
}

// dictionaryForLocationWithName:latitude:longitude: that takes three arguments, an NSString called name, and two CGFloats called latitude and longitude; and returns an NSDictionary.


- (NSDictionary *)dictionaryForLocationWithName:(NSString *)name
                                       latitude:(CGFloat)latitude
                                      longitude:(CGFloat)longitude {
    
    NSDictionary *location =  @{ @"name"     : name      ,
                                 @"latitude" : @(latitude)  ,
                                 @"longitude": @(longitude) };
    
    return location;
}

//namesOfLocations: should return an array containing all of the values for the name key in the location dictionaries in the submitted locations array.


-(NSArray *)namesOfLocations:(NSArray *)locations {
    
    NSMutableArray *names = [[NSMutableArray alloc] init];
    for (NSDictionary *location in locations) {
        NSString *name = location[@"name"];
        [names addObject:name];
    }
    
    return names;
}

//dictionaryIsValidLocation: should return YES only if the submitted location dictionary has exactly three keys by the names of @"name", @"latitude", and @"longitude". If any of these conditions fail, the method should return NO.


- (BOOL)dictionaryIsValidLocation:(NSDictionary *)location {
    
    if (location.count != 3) {
        return NO;
    }
    
    
    NSString *name = location[@"name"];
    if (!name) {
        return NO;
    }
    
    // there are no tests for this code, it just feels like good practice
    if (![name isKindOfClass:[NSString class]]) {
        return NO;
    }
    
    if (name.length == 0) {
        return NO;
    }
    
    
    NSNumber *latitudeNumber = location[@"latitude"];
    if (!latitudeNumber) {
        return NO;
    }
    
    // there are no tests for this code, it just feels like good practice
    if (![location[@"latitude"] isKindOfClass:[NSNumber class]]) {
        return NO;
    }
    
    CGFloat latitude = [latitudeNumber floatValue];
    if (latitude > 90.0 || latitude < -90.0) {
        return NO;
    }
    
    
    NSNumber *longitudeNumber = location[@"longitude"];
    if (!longitudeNumber) {
        return NO;
    }
    
    // there are no tests for this code, it just feels like good practice
    if (![location[@"longitude"] isKindOfClass:[NSNumber class]]) {
        return NO;
    }
    
    CGFloat longitude = [longitudeNumber floatValue];
    if (longitude > 180.0 || longitude <= -180.0) {
        return NO;
    }

    
    return YES;
}

//#5 locationNamed:inLocations: should return the location dictionary in the submitted locations array with the matching value for the name key as the submitted name string. If there are no matches, then it should return nil.


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
