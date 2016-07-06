//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    return YES;
}

//Return a string containing the beginning of the submitted location's name with the number of letters specified in the length argument.
//Assumes dictionary is correctly formatted, with a value for the key "name"
- (NSString *)stringByTruncatingNameOfLocation:(NSDictionary *)location
                                      toLength:(NSUInteger)length{
    
    NSString *loc = location[@"name"];
    
    if(length <= loc.length){
        NSString *truncated = [loc substringToIndex:length];
        return truncated;
    }else{
        return loc;
    }
}

//Return a dictionary containing the three argument values stored to keys of the argument names (@"name", @"latitude", @"longitude").
- (NSDictionary *)dictionaryForLocationWithName:(NSString *)name
                                       latitude:(CGFloat)latitude
                                      longitude:(CGFloat)longitude{
    
    NSDictionary *dict = @{@"name": name,
                           @"latitude": @(latitude),
                           @"longitude": @(longitude)};
    
    return dict;
}

//Given an array of location dictionaries, return an array containing all of the location names.
- (NSArray *)namesOfLocations:(NSArray *)locations{
    
    NSMutableArray *names = [[NSMutableArray alloc] init];
    
    for(NSDictionary *dict in locations){
        [names addObject:dict[@"name"]];
    }
    
    return names;
}

//Return YES only if the submitted location dictionary has exactly three keys by the names of @"name", @"latitude", and @"longitude". If any of these conditions fail, the method should return NO.
//Advanced: Write additional checks to determine that the value for latitude falls between -90.0 and 90.0, that the value for longitude falls between 180.0 and -180.0, and that the value for name is not an empty string. However, there are no tests for these cases.
- (BOOL)dictionaryIsValidLocation:(NSDictionary *)dict{
    
    NSArray *keys = [dict allKeys];
    
    if([keys count] > 3
       || ![keys containsObject:@"name"]
       || [[dict objectForKey:@"name"] isEqualToString:@""]
       || ![keys containsObject:@"latitude"]
       || ([[dict objectForKey:@"latitude"] floatValue] < -90.0 || [[dict objectForKey:@"latitude"] floatValue] > 90.0)
       || ![keys containsObject:@"longitude"]
       || ([[dict objectForKey:@"longitude"] floatValue] < -180.0 || [[dict objectForKey:@"longitude"] floatValue] > 180.0)){
        
        return NO;
        
    }else{
        
        
        return YES;
        
    }
    
}

//Given array of location dictionaries, return the one with whose name matches "name." If there are no matches, return nil.
//Assume we can return the first one we find that matches.
- (NSDictionary *)locationNamed:(NSString *)name inLocations:(NSArray *)locations{
    
    for(NSDictionary *dict in locations){

        if([dict[@"name"] isEqualToString:name]){
            return dict;
        }
        
    }
    //else
    return nil;
}

@end
