//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    return YES;
}

-(NSString *)stringByTruncatingNameOfLocation:(NSDictionary *)location toLength:(NSUInteger)length   {
    NSString *stringToShorten = location[@"name"];
    if (length > [stringToShorten length]) {
        return stringToShorten;
    }
    stringToShorten = [stringToShorten substringToIndex:length];
    return stringToShorten;
}

-(NSDictionary *)dictionaryForLocationWithName:(NSString *)name latitude:(CGFloat)latitude longitude:(CGFloat)longitude {
    return nil;
}

-(NSArray *)namesOfLocations:(NSArray *)locations {
    return nil;
}

-(BOOL)dictionaryIsValidLocation:(NSDictionary *)dictionary {
    return nil;
}

-(NSDictionary *)locationNamed:(NSString *)name inLocations:(NSArray *)locations {
    return nil;
}

@end
