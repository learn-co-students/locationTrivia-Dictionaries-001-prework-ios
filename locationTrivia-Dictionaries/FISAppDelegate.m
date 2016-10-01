//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    return YES;
}

- (NSString *)stringByTruncatingNameOfLocation:(NSDictionary *)location
                                      toLength:(NSUInteger)length {
    
    NSString *name = location[@"name"];
    
    if (length > [name length]) {
        length = [name length];
    }
    
    return [name substringToIndex:length];
}

- (NSDictionary *)dictionaryForLocationWithName:(NSString *)name
                                       latitude:(CGFloat)latitude
                                      longitude:(CGFloat)longitude {
    
    NSDictionary *dictionary = @{ @"name"       : name          ,
                                  @"latitude"   : @(latitude)   ,
                                  @"longitude"  : @(longitude)   };
    
    return dictionary;
}

- (NSArray *)namesOfLocations:(NSArray *)locations {
    
    NSMutableArray *names = [[NSMutableArray alloc] init];
    
    for (NSDictionary *location in locations) {
        [names addObject:location[@"name"]];
    }
    
    return names;
}

- (BOOL)dictionaryIsValidLocation:(NSDictionary *)location {
    
    NSSet *locationKeys = [NSSet setWithArray:[location allKeys]];
    NSSet *correctKeys = [NSSet setWithArray:@[ @"name", @"latitude", @"longitude"]];
    
    return [locationKeys isEqualToSet:correctKeys];
}

- (NSDictionary *)locationNamed:(NSString *)name
                    inLocations:(NSArray *)locations {
    
    NSDictionary *namedLocation = nil;
    
    for (NSDictionary *location in locations) {
        if ([location[@"name"] isEqualToString:name]) {
            namedLocation = location;
            break;
        }
    }
    
    return namedLocation;
}

@end
