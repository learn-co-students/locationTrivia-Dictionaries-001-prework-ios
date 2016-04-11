//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    return YES;
}

//should return a string containing the beginning of the submitted location's name with the number of letters specified in the length argument.
//Hint: Look up the substringToIndex: method on NSString.
-(NSString *)stringByTruncatingNameOfLocation:(NSDictionary *)location
                                     toLength:(NSUInteger)length {
    
    NSString *name = location[@"name"];
        if(length > name.length) {
            return name;
        }
    
    return [name substringToIndex:length];
    }

//should return a dictionary containing the three argument values stored to keys of the argument names (@"name", @"latitude", @"longitude").
-(NSDictionary *)dictionaryForLocationWithName:(NSString *)name
                                      latitude:(CGFloat)latitude
                                     longitude:(CGFloat)longitude {
    
    NSDictionary *newDictionary =  @{ @"name":name,
                                      @"latitude":@(latitude),
                                      @"longitude":@(longitude)};

    return newDictionary;
}

//should return an array containing all of the values for the name key in the location dictionaries in the submitted locations array.
-(NSArray *)namesOfLocations:(NSArray *)locations{
    
    NSMutableArray *locationNames = [[NSMutableArray alloc]init];
    for (NSDictionary *location in locations) {
        NSString *name = location[@"name"];
        [locationNames addObject:name];
    }
    return locationNames;
}

//should return YES only if the submitted location dictionary has exactly three keys by the names of @"name", @"latitude", and @"longitude". If any of these conditions fail, the method should return NO.
-(BOOL)dictionaryIsValidLocation:(NSDictionary *)dictionary{
        
    BOOL validDictionary = YES;

    NSInteger keyCount = [[dictionary allKeys] count];
    if (keyCount != 3) {
        validDictionary = NO;
        return validDictionary;
    }

//should return the location dictionary in the submitted locations array with the matching value for the name key as the submitted name string. If there are no matches, then it should return nil.
    - (NSDictionary *)locationNamed:(NSString *)name
inLocations:(NSArray *)locations {
    
    for (NSDictionary *locationName in locations) {
        
        if ([locationName[@"name"] isEqualToString:name]) {
            
            return locationName;
        }
    }
    
    return nil;
}
    
}
@end
