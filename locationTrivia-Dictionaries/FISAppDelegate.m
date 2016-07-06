//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    return YES;
}

- (NSString*)stringByTruncatingNameOfLocation:(NSDictionary*)location
                                     toLength: (NSUInteger)length {
    
    NSString *namedLocation = location[@"name"];
    if (length > namedLocation.length) {
        
        return namedLocation;
    }
    
    return [namedLocation substringToIndex:length];
}

- (NSDictionary*)dictionaryForLocationWithName:(NSString*)name
                                      latitude:(CGFloat)latitude
                                     longitude: (CGFloat)longitude{
    
    NSDictionary *latAndLon = @{@"name" :name,
                                @"latitude" : @(latitude),
                                @"longitude" : @(longitude)};
    
    
    
    return latAndLon;
}

- (NSArray*)namesOfLocations: (NSArray*)locations {
    
    NSMutableArray *namesOfLoc = [[NSMutableArray alloc]init];
    
    for (NSDictionary *key in locations) {
        
        NSString *name = key[@"name"];
        [namesOfLoc addObject:name];
    }
    
    return namesOfLoc;
}

- (BOOL*)dictionaryIsValidLocation: (NSDictionary*)dictionary {
    
    if (dictionary.count != 3) {
        
        return NO;
    }
    
    NSString *name = dictionary[@"name"];
    if (name.length == 0) {
        
        return NO;
    }
    
    if (!name) {
        
        return NO;
    }
    
    NSNumber *latNum = dictionary[@"latitude"];
    
    if (!latNum) {
        
        return NO;
    }
    
    NSNumber *lonNum = dictionary[@"latitude"];
    
    if (!lonNum) {
        
        return NO;
    }
    
        return YES;
}

- (NSDictionary*)locationNamed:(NSString*)name
                   inLocations: (NSArray*)locations {
    
    for (NSDictionary *location in locations) {
        
        NSString *locationName = location[@"name"];
        if ([name isEqualToString:locationName]) {
            
            return location;
        }
        
        
    }
    
    return nil;
}

@end
