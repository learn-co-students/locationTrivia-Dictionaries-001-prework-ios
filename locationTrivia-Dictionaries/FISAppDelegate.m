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
  NSString *name = [location objectForKey:@"name"];
  
  if (length < name.length) {
    name = [name substringToIndex:length];
  }

  return name;
}

- (NSDictionary *)dictionaryForLocationWithName:(NSString *)name
                                       latitude:(CGFloat)latitude
                                      longitude:(CGFloat)longitude
{
  NSDictionary *location = @{@"name"      : name,
                             @"latitude"  : @(latitude),
                             @"longitude" : @(longitude)};
  
  return location;
}

- (NSArray *)namesOfLocations:(NSArray *)locations
{
  NSArray *names = [locations valueForKey:@"name"];
  
  return names;
}

- (BOOL)dictionaryIsValidLocation:(NSDictionary *)location
{
  // Check for proper keys & key count
  if (location.allKeys.count != 3) return NO;
  
  NSArray *validKeys = @[@"name", @"latitude", @"longitude"];
  NSSet *validKeySet = [[NSSet alloc] initWithArray:validKeys];
  NSMutableSet *keySet = [[NSMutableSet alloc] initWithArray:location.allKeys];
  [keySet minusSet:validKeySet];
  
  if (keySet.count != 0) return NO;
  
  CGFloat latitude = [[location objectForKey:@"latitude"] floatValue];
  CGFloat longtitude = [[location objectForKey:@"longitude"] floatValue];
  NSString *name = [location objectForKey:@"name"];
  
  if (latitude > 90 || latitude < -90) return NO;
  else if (longtitude > 180 || longtitude < -180) return NO;
  else if ([name isEqualToString:@""]) return NO;
  else return YES;
}

- (NSDictionary *)locationNamed:(NSString *)name inLocations:(NSArray *)locations
{
  NSPredicate *matchingNamePredicate = [NSPredicate predicateWithFormat:@"name == %@", name];
  
  return [[locations filteredArrayUsingPredicate:matchingNamePredicate] firstObject];
}
@end






