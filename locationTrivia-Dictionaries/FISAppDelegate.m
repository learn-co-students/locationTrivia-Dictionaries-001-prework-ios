//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    return YES;
}

-(NSString *)stringByTruncatingNameOfLocation:(NSDictionary *)location
                                     toLength:(NSUInteger )length{
    
    NSString *locationName = location[@"name"];
    
    if (length > locationName.length) {
        return locationName;
    }
    
    NSString *truncatedName = [locationName substringToIndex:length];
   
    return truncatedName;
}


-(NSDictionary *)dictionaryForLocationWithName:(NSString *)name
                                      latitude:(CGFloat )latitude
                                     longitude:(CGFloat )longitude{
    
    
    NSDictionary *dictionaryOfNameLatLong = [NSDictionary new];
    dictionaryOfNameLatLong = @{@"name"      : name ,
                                @"latitude"  : [NSNumber numberWithDouble:latitude] ,
                                @"longitude" : [NSNumber numberWithDouble:longitude],
                                };
    
    return dictionaryOfNameLatLong;
}


-(NSArray *)namesOfLocations:(NSArray *)locations{
    
    NSMutableArray *nameValues = [NSMutableArray new];
    
    for (NSDictionary *location in locations) {
        NSString *name = location[@"name"];
        [nameValues addObject:name];
        
    }
    
    return nameValues;
}

-(BOOL)dictionaryIsValidLocation:(NSDictionary *)dictionary{
    
    
    NSArray *keys = [dictionary allKeys];
    
    if (keys.count != 3 ) {
        return NO;
    }
    
    if ([keys containsObject:@"name"] &&
        [keys containsObject:@"latitude"] &&
        [keys containsObject:@"longitude"]) {
        
        return YES;
        
    } else {
        
        return NO;
    }
    
    if ([dictionary[@"name"] isEqualToString:@""]) {
        return NO;
    }
    
    if ([dictionary[@"latitude"] integerValue] > 90 || [dictionary[@"latitude"] integerValue] < -90) {
        return NO;
        
    }
    
    if ([dictionary[@"longitude"] integerValue] > 180 || [dictionary[@"longitude"] integerValue] < -180) {
        return NO;
    }
    
}

-(NSDictionary *)locationNamed:(NSString *)name inLocations:(NSArray *)locations{
    
    for (NSDictionary *location in locations) {
        
        NSString *locationsName = location[@"name"];
        
        if ([name isEqualToString:locationsName]) {
            return location;
        }
    }
    
    return nil;
    
}

@end
