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
    if (length < name.length)
    {
        name = [name substringToIndex:length];
    }
    return name;
}

-(NSDictionary *)dictionaryForLocationWithName:(NSString *)name latitude:(CGFloat)latitude longitude:(CGFloat)longitude {
    return @{ @"name" : name, @"latitude" : @(latitude), @"longitude" :@(longitude)};
}

-(NSArray *)namesOfLocations:(NSArray *)locations {
    NSMutableArray *locationNames = [[NSMutableArray alloc] init];
    NSUInteger i = 0;
    for (NSDictionary *place in locations) {
        locationNames[i] = place[@"name"];
        i++;
    }
    return locationNames;
}

-(BOOL)dictionaryIsValidLocation:(NSDictionary *)dictionary{
    BOOL dictionaryIsValid = false;
    NSArray *keys = [dictionary allKeys];
    NSUInteger doesEqualThree = keys.count;
    NSUInteger three = 3;
    
/*    
    NSArray *nameLatLong = @[@"name", @"latitude", @"longitude"];
    if ([nameLatLong[0] isEqualToString:keys[0]] ) {
        dictionaryIsValid = true;
    }
 */
    if ( [keys containsObject:@"name"] ) {
        dictionaryIsValid = true;
    }
    return (dictionaryIsValid && (doesEqualThree == three));
}

-(NSDictionary *)locationNamed:(NSString *)searchName inLocations:(NSArray *)locations {
    NSMutableDictionary *returnLocation = [[NSMutableDictionary alloc] init];
    for (NSDictionary *place in locations) {
        if ([place[@"name"] isEqualToString:searchName]) {
            returnLocation = [place mutableCopy];
        }
    }
    NSArray *namesOfLoc = [self namesOfLocations:locations];
    if ( !([namesOfLoc containsObject:searchName]) ) {
        returnLocation = nil;
    }
    
/*  Experimenting here in an actual GitSubmit I wouldn't publish this commented out text
    NSPredicate *namePredicate = [NSPredicate predicateWithFormat:@"name CONTAINS %@", searchName];
    NSArray *filteredLocations = [locations filteredArrayUsingPredicate:namePredicate];
    
    NSLog(filteredLocations);
  
 */

    
    return returnLocation;
}

@end
