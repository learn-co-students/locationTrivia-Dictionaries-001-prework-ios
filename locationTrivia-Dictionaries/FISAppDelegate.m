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
        if (length > [location[@"name"] length]) {
                length = [location[@"name"] length];
            }
    
        NSString *newString = [location[@"name"] substringToIndex:length];
    
        return newString;
    }

- (NSDictionary *)dictionaryForLocationWithName:(NSString *)name latitude:(CGFloat)latitude longitude:(CGFloat)longitude{
    
        NSMutableDictionary *locationWithName = [[NSMutableDictionary alloc]init];
    
        locationWithName[@"name"] = name;
        locationWithName[@"latitude"] = @(latitude);
        locationWithName[@"longitude"] = @(longitude);
        return locationWithName;
    }

- (NSArray *)namesOfLocations:(NSArray *)locations{
        NSMutableArray *locationNames = [[NSMutableArray alloc]init];
    
        for (NSDictionary *location in locations){
                [locationNames addObject:location[@"name"]];
            }
    
        return locationNames;
    };

- (BOOL)dictionaryIsValidLocation:(NSDictionary *)dictionary{
        BOOL dictIsValidLocation = NO;
    
        if ([ [dictionary allKeys] containsObject:@"name"] &&
                     [ [dictionary allKeys] containsObject:@"latitude"] &&
                     [ [dictionary allKeys] containsObject:@"longitude"] &&
                     [dictionary count] == 3 ) {
        
                dictIsValidLocation = YES;
            }
    
    
        return dictIsValidLocation;
    }

- (NSDictionary *)locationNamed:(NSString *)name inLocations:(NSArray *)locations{
        for (NSDictionary *location in locations){
                if ([location[@"name"] isEqualToString:name]) {
                        return location;
                    }
            }
    
        return nil;
    }

@end
