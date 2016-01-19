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

- (NSString *)stringByTruncatingNameOfLocation:(NSDictionary *)location toLength:(NSUInteger)length
{
    
    NSArray *allKeys = [location allKeys];
    NSString *firstKey = allKeys[0];
    NSString *longName = location[firstKey];
    NSString *shortName = longName;
    
    BOOL lengthShorterThanName = [longName length] > length;
    
    if(lengthShorterThanName)
    {
        shortName = [longName substringToIndex:length];
    }

        return shortName;
}

- (NSDictionary *)dictionaryForLocationWithName:(NSString *)name latitude:(CGFloat)latitude longitude:(CGFloat)longitude
{
    NSMutableDictionary *locationWithName = [[NSMutableDictionary alloc] init];
    
    [locationWithName setObject:name forKey:@"name"];
    [locationWithName setObject:@(latitude) forKey:@"latitude"];
    [locationWithName setObject:@(longitude) forKey:@"longitude"];
    
    return locationWithName;
    
}

- (NSArray *)namesOfLocations:(NSArray *)locations
{
    NSMutableArray *namesOfLocations = [[NSMutableArray alloc] init];
    
    for(NSDictionary *dictionary in locations)
    {
        [namesOfLocations addObject:dictionary[@"name"]];
    }
    
    return namesOfLocations;
}

- (BOOL)dictionaryIsValidLocation:(NSDictionary *)dictionary
{
    NSArray *dictionaryKeys = [dictionary allKeys];
    
    NSUInteger nameCount = 0;
    NSUInteger latCount = 0;
    NSUInteger longCount = 0;
    
    CGFloat latitudeMax = 90.0;
    CGFloat latitudeMin = -90.0;
    CGFloat longitudeMax = 180.0;
    CGFloat longitudeMin = -180.0;
    
    for (NSString *key in dictionaryKeys)
    {
        if([key isEqualToString:@"name"])
        {
            nameCount++;
        }
        else if([key isEqualToString:@"latitude"])
        {
            latCount++;
        }
        else if ([key isEqualToString:@"longitude"])
        {
            longCount++;
        }
    }
    
    BOOL isKeysCorrect = nameCount == 1 && latCount ==1 && longCount == 1;
    BOOL isKeysEqualToThree = [dictionaryKeys count] == 3;
    
    BOOL isLatitudeValid = [dictionary[@"latitude"] floatValue] >= latitudeMin && [dictionary[@"latitude"] integerValue] <= latitudeMax;
    
    BOOL isLongitudeValid = [dictionary[@"latitude"] floatValue] >= longitudeMin && [dictionary[@"latitude"] integerValue] <= longitudeMax;
    
    
    BOOL isValid = isKeysCorrect && isKeysEqualToThree && isLatitudeValid && isLongitudeValid;
    
    return isValid;
}

- (NSDictionary *)locationNamed:(NSString *)name inLocations:(NSArray *)locations
{
  
    NSMutableDictionary *dictionaryWithGivenName = [[NSMutableDictionary alloc] init];
    BOOL foundMatch = 0;
    
    for(NSDictionary *dictionary in locations)
    {
        BOOL isMatch = [dictionary[@"name"] isEqualToString:name];
        
        if(isMatch)
        {
            NSMutableDictionary *dictionaryCopy = [dictionary mutableCopy];
            dictionaryWithGivenName =  dictionaryCopy;
            foundMatch = 1;
        }
            
        
    }
    
    if(foundMatch)
    {
        return dictionaryWithGivenName;
    }
    else
    {
        return nil;
    }
    
}

@end
