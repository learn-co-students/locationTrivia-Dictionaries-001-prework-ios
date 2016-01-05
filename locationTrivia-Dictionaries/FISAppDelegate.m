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

-(NSString *)stringByTruncatingNameOfLocation:(NSDictionary *)location toLength:(NSUInteger)length {
    NSString *str;
    
    if (length <= [location[@"name"] length]) {
        str = [location[@"name"] substringToIndex:length];
    } else {
        str = location[@"name"];
    }
    return str;
}

-(NSDictionary *)dictionaryForLocationWithName:(NSString *)name latitude:(CGFloat)latitude longitude:(CGFloat)longitude {
    NSDictionary *newLocation = @{@"name"        :   name,
                                  @"latitude"    :   @(latitude),
                                  @"longitude"   :   @(longitude)
                                  };
    return newLocation;
}

-(NSArray *)namesOfLocations:(NSArray *)locations {
    NSMutableArray *leNames = [ @[] mutableCopy ];
    for (NSDictionary *loc in locations) {
        [leNames addObject:loc[@"name"]];
    }
    return leNames;
}

-(BOOL)dictionaryIsValidLocation:(NSDictionary *)dict {
    NSArray *keys = [dict allKeys];
    NSArray *necessaryKeys = @[ @"name", @"latitude", @"longitude" ];
    
    if ( [keys count] != 3 ) {
        return NO;
    } else {
        for (NSString *leKey in necessaryKeys) {
            if ( ![keys containsObject:leKey] ) {
                return NO;
            }
        }
    }
    
    CGFloat lat = [dict[@"latitude"] floatValue];
    CGFloat lon = [dict[@"longitude"] floatValue];
    
    if ( lat < -90.0 || lat > 90) {
        return NO;
    }
    if ( lon < -180.0 || lon > 180.0 ) {
        return NO;
    }
    
    return YES;
}

-(NSDictionary *)locationNamed:(NSString *)name inLocations:(NSArray *)locations {
    NSPredicate *namePredicate = [NSPredicate predicateWithFormat:@"name LIKE %@", name];
    NSArray *namedLocation = [locations filteredArrayUsingPredicate:namePredicate];
    if ([namedLocation count] == 1) {
        return namedLocation[0];
    }
    
    return nil;
}




@end
