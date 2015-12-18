//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    return YES;
}

- (NSString *)stringByTruncatingNameOfLocation:(NSDictionary *)location
                                      toLength:(NSUInteger)length {
    if (length > [location[@"name"] length]) {
        length = [location[@"name"] length];
    }
    NSString *locationString = [location[@"name"] substringToIndex:length];
    return locationString;
}

- (NSDictionary *)dictionaryForLocationWithName:(NSString *)name
                                       latitude:(CGFloat)latitude
                                      longitude:(CGFloat)longitude {
    
    
    NSDictionary *createLocation = @{
                                     @"name" : name,
                                     @"latitude" : @(latitude),
                                     @"longitude" : @(longitude)
                                     };
    return createLocation;
}

- (NSArray *)namesOfLocations:(NSArray *)locations {
    
    NSArray *names = @[];
    for (NSDictionary *location in locations) {
        names = [names arrayByAddingObject:location[@"name"]];
    }
    return names;
}

- (BOOL)dictionaryIsValidLocation:(NSDictionary *)dictionary {
    
    BOOL dictionaryIsValid = NO;
    
    if ([[dictionary allKeys] containsObject:@"name"] &&
        [[dictionary allKeys] containsObject:@"latitude"] &&
        [[dictionary allKeys] containsObject:@"longitude"] &&
        [dictionary count] == 3 ) {
        dictionaryIsValid = YES;
        
    }
    return dictionaryIsValid;
    
}

- (NSDictionary *)locationNamed:(NSString *)name
                    inLocations:(NSArray *)locations {
    
    for (NSDictionary *location in locations) {
        if ([location[@"name"] isEqualToString:name]) {
            return location;
        }
    }
    return nil;
}

@end
