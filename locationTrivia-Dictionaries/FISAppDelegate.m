//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    return YES;
}

-(NSString *)stringByTruncatingNameOfLocation:(NSDictionary *)location toLength:(NSUInteger)length {
    NSString *truncatedName = location[@"name"];
    
    if (length >= truncatedName.length) {
        return truncatedName;
    }
    
    return [truncatedName substringToIndex:length];
}

-(NSDictionary *)dictionaryForLocationWithName:(NSString *)name latitude:(CGFloat)latitude longitude:(CGFloat)longitude {
    NSMutableDictionary *locationDict = [@{} mutableCopy];
    locationDict[@"name"] = name;
    locationDict[@"latitude"] = @(latitude);
    locationDict[@"longitude"] = @(longitude);
    
    return locationDict;
}

-(NSArray *)namesOfLocations:(NSArray *)locations {
    NSArray *locationsOnly = [locations valueForKey:@"name"];
  
    return locationsOnly;
}

-(BOOL)dictionaryIsValidLocation:(NSDictionary *)locationDict {
    NSArray *keys = [locationDict allKeys];
    
    return [keys count] == 3 && 
                [keys containsObject:@"name"] &&
                    [keys containsObject:@"latitude"] &&
                        [keys containsObject:@"longitude"];
}

-(NSDictionary *)locationNamed:(NSString *)name inLocations:(NSArray *)locations {
    NSPredicate *location = [NSPredicate predicateWithFormat:@"name == %@", name];
    NSDictionary *locationsDict = [[locations filteredArrayUsingPredicate:location]firstObject];
    
    
    return locationsDict;
}

@end
