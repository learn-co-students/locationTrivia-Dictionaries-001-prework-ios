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

-(NSString *)stringByTruncatingNameOfLocation:(NSDictionary*)location toLength:(NSUInteger)length {
    NSString * name = location[@"name"];
    if (length < name.length)                                   //is there a way to have one if statement thats ALSO readable
    {
        name = [name substringToIndex:length];
    }
    return name;
}

-(NSDictionary *)dictionaryForLocationWithName:(NSString *)name latitude:(CGFloat)latitude longitude:(CGFloat)longitude {
    return @{ @"name"      : name,
              @"latitude"  : @(latitude),
              @"longitude" : @(longitude)};
}

-(NSArray *)namesOfLocations:(NSArray *)locations {
/*  NSMutableArray *locationNames = [[NSMutableArray alloc] init]; //names > locationNames
    NSUInteger i = 0;                                              //indexing can be replaced with [names addObject:name] method
    for (NSDictionary *place in locations) {                       //singular variable names, *location in locations
        locationNames[i] = place[@"name"];
        i++;
    }
*/
    NSMutableArray *names = [[NSMutableArray alloc] init];
    for (NSDictionary *location in locations) {
        NSString *name = location[@"name"];
        [names addObject:name];
    }

    return names;
}

-(BOOL)dictionaryIsValidLocation:(NSDictionary *)location{ //location > dictionary
    BOOL locationIsValid = NO;                           //its more readable if you set YES, then provide edge cases for no
    NSArray *keys = [location allKeys];
    NSUInteger lookingForThreeKeys = keys.count;
    NSUInteger three = 3;
    
/*    
    NSArray *nameLatLong = @[@"name", @"latitude", @"longitude"];
    if ([nameLatLong[0] isEqualToString:keys[0]] ) {
        dictionaryIsValid = true;
    }
 */
    NSNumber *latitudeNumber = location[@"latitude"];
    CGFloat latitude = [latitudeNumber floatValue];
    NSNumber *longitudeNumber = location[@"longitude"];
    CGFloat longitude = [longitudeNumber floatValue];
    NSString *name = location[@"name"];
    NSString *tester = @"";
    BOOL hasLetters = ( [tester length] > 0);
    
    if ( [keys containsObject:@"name"] &&
       ( latitude > -90.0 && latitude < 90.0) &&
       ( longitude > -180.0 && longitude < 180.0) &&
       ( lookingForThreeKeys == three)  )
    {
        locationIsValid = YES;
    }
    
      
    return locationIsValid;
}

-(NSDictionary *)locationNamed:(NSString *)searchName inLocations:(NSArray *)locations {
    NSMutableDictionary *retLocation = [[NSMutableDictionary alloc] init];
    for (NSDictionary *place in locations) {
        if ([place[@"name"] isEqualToString:searchName]) {
            retLocation = [place mutableCopy];
        }
    }
    NSArray *namesOfLoc = [self namesOfLocations:locations];
    if ( !([namesOfLoc containsObject:searchName]) ) {
        retLocation = nil;
    }
    
/*  Experimenting here, in an actual GitSubmit I wouldn't publish this commented out text
    NSPredicate *namePredicate = [NSPredicate predicateWithFormat:@"name CONTAINS %@", searchName];
    NSArray *filteredLocations = [locations filteredArrayUsingPredicate:namePredicate];
    
    NSLog(filteredLocations);
  
 */

    
    return retLocation;
}



@end
