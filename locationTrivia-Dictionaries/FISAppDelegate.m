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

- (NSString *)stringByTruncatingNameOfLocation:(NSDictionary *)location toLength:(NSUInteger)length {
    
    NSString *returnString = @"";
    
    if ([[location allKeys] containsObject:@"name"]) {
        returnString = [location[@"name"] substringToIndex:length];
    }
    
    return returnString;
}

- (NSDictionary *)dictionaryForLocationWithName:(NSString *)name latitude:(CGFloat)latitude longitude:(CGFloat)longitude {
    
    NSMutableDictionary *returnDictionary = [[NSMutableDictionary alloc] init];
    NSNumber *latitudeNumber = @(latitude);
    NSNumber *longitudeNumber = @(longitude);
    
    [returnDictionary setValue:name forKey:@"name"];
    [returnDictionary setValue:latitudeNumber forKey:@"latitude"];
    [returnDictionary setValue:longitudeNumber forKey:@"longitude"];
    
    return returnDictionary;
}

- (NSArray *)namesOfLocations:(NSArray *)locations {
    
    NSMutableArray *returnArray = [[NSMutableArray alloc] init];
    
    for (NSUInteger i=0; i<[locations count]; i++) {
        [returnArray addObject:locations[i][@"name"]];
    }
    
    return returnArray;
}

- (BOOL)dictionaryIsValidLocation:(NSDictionary *)argument {
    
    BOOL isNo = NO;
    BOOL isYes = YES;
    
    if ([argument count] > 3) {
        return isNo;
    } else if ([[argument allKeys]containsObject:@"name"] && [[argument allKeys]containsObject:@"latitude"] && [[argument allKeys] containsObject:@"longitude"]) {
        return isYes;
    } else {
        return isNo;
    }

}

- (NSDictionary *)locationNamed:(NSString *)name inLocations:(NSArray *)locations {
    
    
    for (NSDictionary *returnDictionary in locations) {
        if ([returnDictionary[@"name"] isEqualToString:name]) {
            
            return returnDictionary;
        }
    }
    
    return nil;
}

@end
