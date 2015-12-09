//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    return YES;
}

- (NSString *) stringByTruncatingNameOfLocation: (NSDictionary *) location toLength: (NSUInteger) length {
    NSMutableString *trun = [[NSMutableString alloc]init];
    if (([location[@"name"] length] > length) ) {
        trun = [[location[@"name"] substringToIndex:length] mutableCopy];
    } else {
        trun = [location[@"name"] mutableCopy];
    }
        return trun;
}

- (NSDictionary *) dictionaryForLocationWithName: (NSString *) name latitude: (CGFloat) latitude longitude: (CGFloat) longitude {
    NSMutableDictionary *list = [[NSMutableDictionary alloc]init];
    list[@"name"] = name;
    list[@"latitude"] = @(latitude);
    list[@"longitude"] = @(longitude);
    return list;
}

- (NSArray *) namesOfLocations: (NSArray *) locations {
    NSMutableArray *names = [[NSMutableArray alloc]init];
    for (NSUInteger i = 0; i < [locations count]; i++) {
        names[i]= [locations[i][@"name"]mutableCopy];
    }
    return names;
}

- (BOOL) dictionaryIsValidLocation: (NSDictionary *) dictionary {
    BOOL ans;
    if ((dictionary[@"name"])&&(dictionary[@"latitude"])&&(dictionary[@"longitude"])&&([[dictionary allKeys]count] == 3)) {
        ans = YES;
    }else {
        ans = NO;
    }
    return ans;
}

- (NSDictionary *) locationNamed: (NSString *) name inLocations: (NSArray *) locations {
    NSDictionary *local;
    
    for (NSUInteger i = 0; i < [locations count]; i++) {
        if (([locations[i] objectForKey:@"name"] == name)) {
            local = locations[i];
        }
    }
    return local;
}

@end
