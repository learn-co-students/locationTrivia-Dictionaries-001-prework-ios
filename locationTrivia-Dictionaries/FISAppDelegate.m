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

-(NSString*)stringByTruncatingNameOfLocation:(NSDictionary*)location toLength:(NSUInteger*)length;{
    
    NSString* locationName = location[@"name"];
    
    if (length > [locationName length]) {
        return locationName;;
    }
    else {
        NSString* shortenedString = [location[@"name"] substringToIndex:length];
        return shortenedString;
    }
}

-(NSDictionary*)dictionaryForLocationWithName:(NSString*)name latitude:(CGFloat)latitude longitude:(CGFloat)longitude;{
    
    NSDictionary* newLocation = @{@"name":name, @"latitude":[NSNumber numberWithDouble:latitude], @"longitude":[NSNumber numberWithDouble:longitude]};
    
    return newLocation;}
-(NSArray*)namesOfLocations:(NSArray*)locations;{
    
    NSString* value1 = locations[0][@"name"];
    NSString* value2 = locations[1][@"name"];
    NSString* value3 = locations[2][@"name"];
    
    NSArray* names = @[value1, value2, value3];
    
    
    return names;}
-(BOOL)dictionaryIsValidLocation:(NSDictionary*)dictionary;{
    if ([dictionary count] == 3) {
        if ([[dictionary allKeys] containsObject:@"name"] && [[dictionary allKeys] containsObject:@"latitude"] && [[dictionary allKeys] containsObject:@"longitude"]) {
            return true;
        }
        else{
            return false;
        }
    }
    else{
        return false;
    }
}
-(NSDictionary*)locationNamed:(NSString*)name inLocations:(NSArray*)locations;{
    NSMutableDictionary* locationDictionary = [[NSMutableDictionary alloc]init];
    
    NSLog(@"%@", locations);
    
    if ([locations[0] containsObject:name]) {
        [locationDictionary setObject:locations[0][@"name"] forKey:@"name"];
        [locationDictionary setObject:locations[0][@"latitude"] forKey:@"latitude"];
        [locationDictionary setObject:locations[0][@"longitude"] forKey:@"longitude"];
        return locationDictionary;
    }
    else if ([locations[1] containsObject:name]){
        [locationDictionary setObject:locations[1][@"name"] forKey:@"name"];
        [locationDictionary setObject:locations[1][@"latitude"] forKey:@"latitude"];
        [locationDictionary setObject:locations[1][@"longitude"] forKey:@"longitude"];
        return locationDictionary;
    }
    else if ([locations[2] containsObject:name]){
        [locationDictionary setObject:locations[2][@"name"] forKey:@"name"];
        [locationDictionary setObject:locations[2][@"latitude"] forKey:@"latitude"];
        [locationDictionary setObject:locations[2][@"longitude"] forKey:@"longitude"];
        return locationDictionary;
    }
    else {
        return nil;
    }
    
    
    
    
}

@end
