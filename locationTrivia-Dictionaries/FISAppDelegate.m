//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    return YES;
}

- (NSString *)stringByTruncatingNameOfLocation:(NSDictionary *)location toLength:(NSUInteger)length {
    
    NSString *truncLocationName = location[@"name"];
    
    if ([truncLocationName length] >= length) {
        
        truncLocationName = [truncLocationName substringToIndex:length];
    }
    
    return truncLocationName;
}

- (NSDictionary *)dictionaryForLocationWithName:(NSString *)name latitude:(CGFloat)latitude longitude:(CGFloat)longitude {
    
    return @{@"name" : name,
             @"latitude" : @(latitude),
             @"longitude" : @(longitude)};
}

- (NSArray *)namesOfLocations:(NSArray *)locations {
    
    NSMutableArray *locationNames = [[NSMutableArray alloc] init];
    
    for (NSDictionary *loc in locations) {
        
        [locationNames addObject:loc[@"name"]];
    }
    
    return locationNames;
}

- (BOOL)dictionaryIsValidLocation:(NSDictionary *)dictLocation {
    
    BOOL keyCount = [[dictLocation allKeys ]count] == 3;
    BOOL nameCheck = dictLocation[@"name"] && ![dictLocation[@"name"] isEqualToString:@""];
    BOOL latCheck = dictLocation[@"latitude"] && [dictLocation[@"latitude"] floatValue] >= -90.0 && [dictLocation[@"latitude"] floatValue] <= 90.0;
    BOOL longCheck = dictLocation[@"longitude"] && [dictLocation[@"longitude"] floatValue] >= -180.0 && [dictLocation[@"longitude"] floatValue] <= 180.0;
    
    return keyCount && nameCheck && latCheck && longCheck;
}

- (NSDictionary *)locationNamed:(NSString *)name inLocations:(NSArray *)locations {
    
    for (NSDictionary *loc in locations) {
        
        if ([loc[@"name"] isEqualToString:name]) {
            
            return loc;
        }
    }
    
    return nil;
}

@end
