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

-(NSString *)stringByTruncatingNameOfLocation:(NSDictionary *)location toLength:(NSUInteger)length {
    NSString *name = location[@"name"];
    if (length > name.length) {
        return name;
    }
    // NSString *truncatedName = [name substringToIndex:length];
    return [name substringToIndex:length];
}


-(NSDictionary *)dictionaryForLocationWithName:(NSString *)name latitude:(CGFloat)latitude longitude:(CGFloat)longitude {
    NSDictionary *dictionaryForLocation = @{ @"name" : name, @"latitude" : @(latitude), @"longitude" : @(longitude) };
    return dictionaryForLocation;
}


-(NSArray *)namesOfLocations:(NSArray *)locations {
    NSMutableArray *locationNames = [[NSMutableArray alloc] init];
    for (NSDictionary *location in locations) {
        NSString *name = location[@"name"];
        [locationNames addObject:name];
    }
    return locationNames;
}


-(BOOL)dictionaryIsValidLocation:(NSDictionary *)dictionary {
    NSArray *keys = [dictionary allKeys];
    if ([keys count] != 3) {
        return NO;
    }
    if ( [keys containsObject:@"name"] && [keys containsObject:@"latitude"] && [keys containsObject:@"longitude"] ) {
        return YES;
    }
    return NO;
}


-(NSDictionary *)locationNamed:(NSString *)string inLocations:(NSArray *)locations {
    NSPredicate *namePredicate = [NSPredicate predicateWithFormat:@"name LIKE %@", string];
    NSArray *foundLocations = [locations filteredArrayUsingPredicate:namePredicate];
    if ([foundLocations count] == 0) {
        return nil;
    }
    return foundLocations[0];
}

@end
