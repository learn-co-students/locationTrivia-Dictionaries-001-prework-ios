//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    return YES;
}

- (NSString *)stringByTruncatingNameOfLocation:(NSDictionary *)location
                                      toLength:(NSUInteger)length {
    
    NSString *shortenedName = [location[@"name"] mutableCopy];
    
    return [shortenedName substringToIndex:fmin(length, [shortenedName length])];
}

- (NSDictionary *)dictionaryForLocationWithName:(NSString *)name
                                       latitude:(CGFloat)latitude
                                      longitude:(CGFloat)longitude {
    
    NSDictionary *locationWithName = @{ @"name"       :  name           ,
                                        @"latitude"   :  @(latitude)    ,
                                        @"longitude"  :  @(longitude)  };
    
    return locationWithName;
}

- (NSArray *)namesOfLocations:(NSArray *)locations {
    
    NSMutableArray *locationNames = [[NSMutableArray alloc] init];
    
    for (NSDictionary *locationName in locations) {
        [locationNames addObject:locationName[@"name"]];
    }
    
    return locationNames;
}

- (BOOL)dictionaryIsValidLocation:(NSDictionary *)location {
    
    BOOL returnValid = NO;
    
    NSArray *locationKeys = [location allKeys];
    
    CGFloat latitudeFV  = [location[@"latitude"] floatValue];
    CGFloat longitudeFV = [location[@"longitude"] floatValue];
    
    //dictionary has exactly three keys == 3
    
    if ([locationKeys count] == 3 && [locationKeys containsObject:@"name"]
        && [locationKeys containsObject:@"latitude"]
        && [locationKeys containsObject:@"longitude"]) {
        
        returnValid = YES;
        
    } else if ([locationKeys count] > 3) {
        returnValid = NO;
        
        if ((location[@"name"])
            && (latitudeFV < -90.0 && latitudeFV > 90.0)
            && (longitudeFV < -180.0 && longitudeFV > 180.0)) {
            
            returnValid = YES;
            
        } else {
            
            returnValid = NO;
            return returnValid;
        }
    }
    return returnValid;
    
}


- (NSDictionary *)locationNamed:(NSString *)name
                    inLocations:(NSArray *)locations {
    
    for (NSDictionary *locationName in locations) {
        
        if ([locationName[@"name"] isEqualToString:name]) {
            
            return locationName;
        }
    }
    
    return nil;
}

@end
