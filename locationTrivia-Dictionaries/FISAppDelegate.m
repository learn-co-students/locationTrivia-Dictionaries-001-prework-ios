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

- (NSString *)stringByTruncatingNameOfLocation:(NSDictionary *)location toLength:(NSUInteger)length
{
    if ([location[@"name"] length] < length) {
        return location[@"name"];
    }
    return [location[@"name"] substringToIndex:length];
}

- (NSDictionary *)dictionaryForLocationWithName:(NSString *)name latitude:(CGFloat)latitude longitude:(CGFloat)longitude
{
    NSDictionary *newLocation = @{ @"name"        :    name         ,
                                   @"latitude"    :    @(latitude)  ,
                                   @"longitude"   :    @(longitude) };
    return newLocation;
}

- (NSArray *)namesOfLocations:(NSArray *)locations
{
    NSArray *names = @[];
    
    for (NSDictionary *location in locations) {
        names = [names arrayByAddingObject:location[@"name"]];
    }
    
    return names;
}

- (BOOL)dictionaryIsValidLocation:(NSDictionary *)dictionary
{
    NSArray *allKeys = [dictionary allKeys];
    if ([allKeys count] != 3) {
        return NO;
    } else if (![dictionary objectForKey:@"name"] || ![dictionary objectForKey:@"latitude"] || ![dictionary objectForKey:@"longitude"]) {
        return NO;
    } else {
        return YES;
    }
}

- (NSDictionary *)locationNamed:(NSString *)name inLocations:(NSArray *)locations
{
    for (NSDictionary *location in locations) {
        if ([location[@"name"] isEqualToString:name]) {
            return location;
        }
    }
    return nil;
}

@end
