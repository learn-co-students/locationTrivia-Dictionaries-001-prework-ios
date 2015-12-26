//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    return YES;
}

-(NSString*)stringByTruncatingNameOfLocation:(NSDictionary*)location toLength:(NSUInteger)length {
    NSString *name = location[@"name"];
    if (length < [name length]) {
        return [name substringToIndex:length];
    } else {
        return name;
    }
}
-(NSDictionary*)dictionaryForLocationWithName:(NSString*)name latitude:(CGFloat)latitude longitude:(CGFloat)longitude {
    NSDictionary *dictionary = @{
                                 @"name"        :   name,
                                 @"latitude"    :   @(latitude),
                                 @"longitude"   :   @(longitude)
                                 };
    return dictionary;
}
-(NSArray*)namesOfLocations:(NSArray*)locations {
    NSMutableArray *names = [[NSMutableArray alloc] init];
    
    for (NSUInteger i = 0; i < [locations count]; i++) {
        [names addObject:locations[i][@"name"]];
    }
    
    return names;
}
-(BOOL)dictionaryIsValidLocation:(NSDictionary*)dictionary {
    return (dictionary[@"name"] && dictionary[@"latitude"] && dictionary[@"longitude"] && ([[dictionary allKeys] count] == 3));
}
-(NSDictionary*)locationNamed:(NSString*)name inLocations:(NSArray*)locations {
    NSDictionary *location;
    
    for (NSUInteger i = 0; i < [locations count]; i++) {
        location = locations[i];
        if (location[@"name"] == name) {
            return location;
        }
    }
    
    return nil;
}

@end
