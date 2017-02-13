//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

/*

 1. Apply what you've learned about collections to correctly store some real-world information.
 2. Verify that a dictionary contains the expected keys.
 3. Retrieve a stored dictionary by the value for a key.
 
 */
 
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    return YES;
}

- (NSString *)stringByTruncatingNameOfLocation:(NSDictionary *)location toLength:(NSUInteger)length; {

    // should return a string containing the beginning of the submitted location's name with the number of letters specified in the length argument. Hint: look up the substringToIndex: method on NSString.
    
    NSString *name = location[@"name"];
    
    if (length < [name length]) {
        
        name = [name substringToIndex:length];
    }
    
    return name;
// Created a string to equal location[@"name"] which accounts for all of the @"name"'s in the location dictionary. Then set the if statement that if length is < [name length] (which it will always since all of the locations have more than 3 letters, which is what NSUInteger length equals) than substringToIndex:length.
    
}

- (NSDictionary *)dictionaryForLocationWithName:(NSString *)name latitude:(CGFloat)latitude longitude:(CGFloat)longitude; {
    
    return @{@"name" : name, @"latitude" : @(latitude), @"longitude" : @(longitude)};
// By utilizing @{ } I was easily able to return a dictionary contaning the three argument values stored to the keys of the argument names. This just takes carefully reading the header written and ensuring to put the key : value in the right place. I coule have also created a new dictionary and returned that, this is just less lines.
    
}

- (NSArray *)namesOfLocations:(NSArray *)locations; {
    
    // should return an array containing all of the values for the 'name' key in the location dictionaries in the submitted 'locations' array.
    
    NSMutableArray *names = [[NSMutableArray alloc] init];
    
    NSUInteger i = 0;
    
    for (NSDictionary *location in locations) {
        
        names[i] = location[@"name"];
                            i++;
    }
    
    return names;
 // Defined the index outside of the for-in loop to  add the locations name to my mutable array. Since I utilized a for-in loop, adding the i++ was necessary to continue adding to the array.
    
}

- (BOOL)dictionaryIsValidLocation:(NSDictionary *)dictionary; {
    
    // should return YES only if the submitted 'location' dictionary has exactly three keys by the names of @"name", @"latitude", and @"longitude". If any of these conditions fail, the method should return NO. Advanced: Write additional checked to determine that the value for 'latitude' falls between -90 & 90, that the value for 'longitude' falls between -180 & 180, and that the value for name is not an empty string.
    
    BOOL validDictionary = 0;
    NSArray *keys = [dictionary allKeys];
    NSUInteger equalThree = [keys count];
    NSUInteger three = 3;
    
    if ([ keys containsObject:@"name"]) {
        
        validDictionary = 1;
    }
    
    return (validDictionary && (equalThree == three) && [dictionary[@"latitude"] integerValue] <= 90.0 && [dictionary[@"latitude"] integerValue] >= -90.0 && [dictionary[@"longitude"] integerValue] <= 180.0 && [dictionary[@"longitude"] integerValue] >= -180.0);
    // Since I defined BOOL validDictionary = 0; at the beginning of this method, implementing this if statement ensures that only if the if statement passes will the BOOL validDictionary be true, otherwise false (this is done even without chaining an else statement, which I previously would have done by default). Also, I was able to chain the additional checks right in the return statement.
    
}

- (NSDictionary *)locationNamed:(NSString *)name inLocations:(NSArray *)locations; {
    
    // should return the 'location' dictionary in the submitted 'locations' array with the matching value for the 'name' key as the submitted 'name' string. If there are no matches, then it should return nil;
    
    NSMutableDictionary *location = [[NSMutableDictionary alloc] init];
    
    for (NSDictionary *place in locations) {
        
        if ([place[@"name"] isEqualToString:name]) {
            
            location = [place mutableCopy];
        }
    
    }
    NSArray *names = [self namesOfLocations:locations];
    
    if (![names containsObject:name]) {
        
        location = nil;
    
    }
    
    return location;
    
}

@end
