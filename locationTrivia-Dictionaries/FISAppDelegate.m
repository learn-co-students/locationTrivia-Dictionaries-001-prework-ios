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
    return [location[@"name"] substringToIndex:length];
}

- (NSDictionary *)dictionaryForLocationWithName:(NSString *)name latitude:(CGFloat)latitude longitude:(CGFloat)longitude
{
    return nil;
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
