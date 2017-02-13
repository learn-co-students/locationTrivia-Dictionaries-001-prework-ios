//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    return YES;
}

// a method that returns the truncated version of the name by the length
// if length is not greater than the length of the name
-(NSString *)stringByTruncatingNameOfLocation: (NSDictionary *)location toLength:(NSUInteger)length {
    if ([location[@"name"] length] >= length) {
        return [location[@"name"] substringToIndex:length];
    }
    return location[@"name"];
}


// a method that returns a dictionary with elements that were passed as parameters
-(NSDictionary *)dictionaryForLocationWithName:(NSString *)name latitude:(CGFloat)latitude longitude:(CGFloat)longitude {
    NSDictionary *locationDictionary = @{
                                        @"name" : name,
                                        @"latitude" : @(latitude),
                                        @"longitude" : @(longitude)
                                        };
    return locationDictionary;
}



// a method that returns an array of the names of dictionaries in the array that was submitted as a parameter
-(NSArray *)namesOfLocations:(NSArray *)locations {
    NSMutableArray *allLocationNames = [[NSMutableArray alloc] init];
    for (NSDictionary *eachLocationName in locations) {
        [allLocationNames addObject:eachLocationName[@"name"]];
    }
    return allLocationNames;
}


// a method that checks whether the dicsionary has exactly 3 keys and they are  name, latitude, and longitude
-(BOOL)dictionaryIsValidLocation:(NSDictionary *)locationToValidate {
    NSArray *locationAllKeys = [locationToValidate allKeys];
    NSUInteger keyCheckCounter = 0;
    BOOL areValuesGood = NO;
    if( [locationAllKeys count] == 3) {
        for (NSString *key in locationAllKeys) {
            if ([key isEqualToString:@"name"] || [key isEqualToString:@"latitude"] || [key isEqualToString:@"longitude"]) {
                keyCheckCounter++;
            }
        }
    }
    //checking if the values are within the required ranges and if there is a location name
    if ([locationToValidate[@"name"] length] > 0 &&
        (([locationToValidate[@"latitude"] integerValue] > -90 )&& ([locationToValidate[@"latitude"] integerValue] < 90 )) &&
        (([locationToValidate[@"longitude"] integerValue] > -180 )&& ([locationToValidate[@"longitude"] integerValue] < 180 ))) {
            areValuesGood = YES;
    }
    
    if (keyCheckCounter == 3 && areValuesGood) {
        return YES;
    }
    return NO;
}


// a method that returns the dictionary from an array when the name of the location matches the name in the parameter
-(NSDictionary *)locationNamed:(NSString *)name inLocations:(NSArray *)locations {
    NSPredicate *matchingNamePredicate = [NSPredicate predicateWithFormat:@"name LIKE %@",name];
    NSArray *matchingLocationsWithName = [locations filteredArrayUsingPredicate:matchingNamePredicate];
    //since we are returning only one dictionary, the first element in the array will be returned if the array is not empty
    if ([matchingLocationsWithName count] > 0) {
        return matchingLocationsWithName[0];
    }
    return nil;
}


@end
