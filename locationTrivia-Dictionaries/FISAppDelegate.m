//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    return YES;
}

- (NSString *)stringByTruncatingNameOfLocation:(NSDictionary *)location toLength:(NSUInteger)length; {
    
    NSString *shortName = location[@"name"];
    
    if (length < [shortName length]) {
        shortName = [shortName substringToIndex:length];
        
//From iOS Developer Library, you can extract substrings from the beginning or end of a string to a particular index, or from a specific range, with the substringToIndex:, substringFromIndex:, and substringWithRange: methods.
//Utilized substringToIndex: to ensure shortName is returned only with the amount of letters that NSUInteger length is defined to have (in this case, I believe 3).

    }
    return shortName;
}

- (NSDictionary *)dictionaryForLocationWithName:(NSString *)name latitude:(CGFloat)latitude longitude:(CGFloat)longitude; {

    NSDictionary *values = @{@"name"       : name,
                             @"latitude"   : @(latitude),
                             @"longitude"  : @(longitude)
                             };
//Return a dictionary containing the three argument values stored to keys of the argument names.
    
    return values;
}

- (NSArray *)namesOfLocations:(NSArray *)locations; {
    
    NSMutableArray *namesOnly = [[NSMutableArray alloc] init];
    
    NSUInteger i = 0;
//Since I was utilizing a for-in loop, I had to pre-define the index.
    
    for (NSDictionary *location in locations) {
        namesOnly[i] = location[@"name"];
        i++;
//Should return an array containing all of the values for the 'name' key in the location dictionaries in the submitted 'locations' array.
        
    }
    
    NSLog(@"\n\n\n\n%@", namesOnly);
//Utilized new line (\n) in order to better read NSLog in debug console amongst test gibberish.
    
    return namesOnly;
}

- (BOOL)dictionaryIsValidLocation:(NSDictionary *)dictionary; {
    
    BOOL validLocation = NO;
//Generally speaking, make BOOL values start at NO.
    
    NSArray *locations = [dictionary allKeys];
    
    NSLog(@"\n\n\n %@", locations);
//New line (\n) generally helps with reading NSLog's in the test madness!
    
    NSString *name = @"name";
    NSString *longitude = @"longitude";
    NSString *latitude = @"latitude";
    
    if ([locations containsObject:name] && [locations containsObject:longitude] && [locations containsObject:latitude] && [locations count] <= 3) {
//Since [locations count] <= 3 isn't a method, putting brackets around the entire statement wasn't necessary. Also, while originally I had < 3, it needed to be <= 3 in order for the tests to pass.
        
       validLocation = YES;
        
    }
    
    NSLog(@"/n/n/n/n/n %d", validLocation);
    return validLocation;
}

- (NSDictionary *)locationNamed:(NSString *)name inLocations:(NSArray *)locations; {
    
    NSDictionary *matchedLocations;
    
    for (NSDictionary *locName in locations) {
        
        if (locName[@"name"] == name) {
            
            matchedLocations = locName;
        }
    }
//Should return the 'location' dictionary in the submitted 'locations' array with the matching value for the 'name' key as the submitted 'name' string. If there are no  matches, then it should return nil.
//Wording of this question confused me a lot, but that's also because there are a lot of similiarly named objects. By checking if locName[@"name"] == name, I was able to compare the values of "name" in locations to NSString name.
    
    return matchedLocations;
    
}

@end
