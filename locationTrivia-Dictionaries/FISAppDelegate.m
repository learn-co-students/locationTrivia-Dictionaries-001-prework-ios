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
    return nil;
}

- (BOOL)dictionaryIsValidLocation:(NSDictionary *)dictionary
{
    return nil;
}

- (NSDictionary *)locationNamed:(NSString *)name inLocations:(NSArray *)locations
{
    return nil;
}

@end
