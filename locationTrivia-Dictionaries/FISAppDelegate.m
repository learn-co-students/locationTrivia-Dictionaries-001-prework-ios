//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    return YES;
}


- (NSString *) stringByTruncatingNameOfLocation:(NSDictionary *)location toLength:(NSUInteger)length {
    if ([location[@"name"] length] >= length) {
        return [location[@"name"] substringToIndex:length];
    } else {
        return location[@"name"];
    }
}


- (NSDictionary *) dictionaryForLocationWithName:(NSString *)name latitude:(CGFloat)latitude longitude:(CGFloat)longitude {
    return @{@"name" : name, @"latitude" : @(latitude), @"longitude" : @(longitude)};
}


- (NSArray *) namesOfLocations:(NSArray *)locations {
    NSMutableArray *locationNames = [[NSMutableArray alloc] init];
    for (NSDictionary *location in locations) {
        [locationNames addObject:location[@"name"]];
    }
    return locationNames;
}


- (BOOL) dictionaryIsValidLocation:(NSDictionary *)dictionary {
    NSArray *dictionaryKeys = [[dictionary allKeys] sortedArrayUsingSelector:@selector(compare:)];
    NSArray *properDictionaryKeys = @[@"latitude", @"longitude", @"name"];
    if ([dictionaryKeys isEqualToArray:properDictionaryKeys] && [dictionary[@"name"] length] > 0 &&
        [dictionary[@"latitude"] floatValue] < 90 && [dictionary[@"latitude"] floatValue] > -90 &&
        [dictionary[@"longitude"] floatValue] < 180 && [dictionary[@"longitude"] floatValue] > -180) {
        return YES;
    }
    return NO;
}


- (NSDictionary *) locationNamed:(NSString *)name inLocations:(NSArray *)locations {
    for (NSDictionary *location in locations) {
        if ([location[@"name"] isEqualToString:name]) {
            return location;
        }
    }
    return nil;
}


@end
