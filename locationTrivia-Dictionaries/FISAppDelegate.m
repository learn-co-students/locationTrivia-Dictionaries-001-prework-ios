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
    NSMutableDictionary *nameAndLocation = [[NSMutableDictionary alloc]init];
    nameAndLocation[@"name"] = name;
    nameAndLocation[@"latitude"] = @(latitude);
    nameAndLocation[@"longitude"] = @(longitude);
    
    return nameAndLocation;
}

-(NSArray *)namesOfLocations:(NSArray *)locations {
    //NSPredicate *namesPredicate = [NSPredicate predicateWithFormat:@"self LIKE[cd] %@", @"name"];
    //NSArray *namesOfLocations = [locations filteredArrayUsingPredicate:namesPredicate];
    
    NSMutableArray *namesOfLocations = [[NSMutableArray alloc]init];
    for (NSDictionary *place in locations) {
        [namesOfLocations addObject:place[@"name"]];
    }
    
    return namesOfLocations;
}

-(BOOL)dictionaryIsValidLocation:(NSDictionary *)dictionary {
    
    BOOL validDictionary = YES;
    
    NSString *name = @"name";
    NSString *latitude = @"latitude";
    NSString *longitude = @"longitude";
    
    NSArray *keyNames = [NSArray arrayWithArray:[dictionary allKeys]];
    
    //check to make sure dictionary has exactly 3 keys
    NSInteger keyCount = [[dictionary allKeys] count];
    if (keyCount != 3) {
        validDictionary = NO;
        return validDictionary;
    }
    
    
    //checks each key for key is 'name', 'latitude', and 'longitutde'
    for (NSString *key in keyNames) {
        if ([key isEqualToString:name]) {
            validDictionary = YES;
            //checks to make sure the name is not blank
            NSLog(@"name string: %@\n name String length: %lu", dictionary[name], [dictionary[name]length]);
            if ([dictionary[key] length] < 1) {
                validDictionary = NO;
                NSLog(@"validdictionary for string length less than 1: %d", validDictionary);
                return validDictionary;
            }
        } else if ([key isEqualToString:latitude]){
            validDictionary = YES;
            //checks to make sure latitude value is between -90 and 90
            NSInteger latitudeValue = [dictionary[latitude] integerValue];
            if (latitudeValue < -90 || latitudeValue > 90) {
                validDictionary = NO;
                return validDictionary;
            }
            
        } else if ([key isEqualToString:longitude]){
            validDictionary = YES;
            //checks to make sure longitude is between -180 and 180
            NSInteger longitudeValue = [dictionary[longitude] integerValue];
            if (longitudeValue < -180 || longitudeValue > 180) {
                validDictionary = NO;
                return validDictionary;
            }
        } else {
            validDictionary = NO;
            return validDictionary;
        }
    }
    
    return validDictionary;
}

-(NSDictionary *)locationNamed:(NSString *)name inLocations:(NSArray *)locations {
    
    //creat an array of locations's names
    NSMutableArray *namesOfLocationsArray = [[NSMutableArray alloc]init];
    for (NSDictionary *key in locations) {
        NSString *locationToAdd = key[@"name"];
        [namesOfLocationsArray addObject:locationToAdd];
    }
    
    //check each location in 'namesOfLocations' to see if it matchs 'name'
    BOOL nameIsALocation = NO;
    for (NSString *location in namesOfLocationsArray) {
        if ([[location lowercaseString] isEqualToString:[name lowercaseString]] ) {
            nameIsALocation = YES;
        }
    }
    
    //get properly capitalized location and return the dictionary it's cointained in
    if (nameIsALocation) {
        
        NSPredicate *getCaseSensitiveNamePredicate = [NSPredicate predicateWithFormat:@"self LIKE[c] %@", name];
        NSString *CaseSensitiveNameOfLocation = [namesOfLocationsArray filteredArrayUsingPredicate:getCaseSensitiveNamePredicate][0];
        
        NSPredicate *returnDictionaryPredicate = [NSPredicate predicateWithFormat:@"name LIKE %@", CaseSensitiveNameOfLocation];
        NSDictionary *returnDictionary = [locations filteredArrayUsingPredicate:returnDictionaryPredicate][0];
        return returnDictionary;
    }
    
    return nil;
}


@end
