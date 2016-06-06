//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    return YES;
}

/*
 
 *  Write your method implementations here.
 
 */

-(NSString *)stringByTruncatingNameOfLocation:(NSDictionary *)location toLength:(NSUInteger)lenghth {
    NSString *nameString = location[@"name"];  //we use the key to access the value.
    
    if (nameString.length < lenghth){ // we are checking if this conditions are met.
        return nameString;
    }
    NSString *truncatedNameString = [nameString substringToIndex:lenghth]; // we are cupturing (storing in the variable truncatedNameString) the return value of the emplamentation of substringToIndex method calling on nameString and taking in a argument length.
    
    NSLog(@"This will be truncating name:%@, and it's length is %li.", truncatedNameString, lenghth);
    //This will be truncating name:Emp, and it's length is 3.

    
    return truncatedNameString;
}


//stringByTruncatingNameOfLocation:toLength: should return a string containing the beginning of the submitted location's name with the number of letters specified in the length argument.
//Hint: Look up the substringToIndex: method on NSString.


-(NSDictionary *)dictionaryForLocationWithName:(NSString *)name latitude:(CGFloat)latitude longitude:(CGFloat)longitude {
    
    NSDictionary *aDictionary = @{@"name" : name, @"latitude" : @(latitude), @"longitude" : @(longitude)};
    
    return aDictionary;
    // return @{@"name" : name, @"latitude" : @(latitude), @"longitude" : @(longitude)};

}

//dictionaryForLocationWithName:latitude:longitude: should return a dictionary containing the three argument values stored to keys of the argument names (@"name", @"latitude", @"longitude").


-(NSArray *)namesOfLocations:(NSArray *)locations {
    NSMutableArray *names = [[NSMutableArray alloc] init];
    
        NSUInteger i = 0;
    
        for (NSDictionary *location in locations) {
        
                names[i] = location[@"name"];
                                    i++;
            }
    
        return names;
}

//namesOfLocations: should return an array containing all of the values for the name key in the location dictionaries in the submitted locations array.



-(BOOL)dictionaryIsValidLocation:(NSDictionary *)argument {
    
    NSArray *keys = [argument allKeys];
    
    if (argument.count != 3){   //Checking if conditions (number of entries in the dictionary argument are not equal 3) are met, if not it will skip over.
        return NO;
    }
    if ([ keys containsObject:@"name"] && [keys containsObject: @"latitude"] && [keys containsObject:@"longitude"]) { //Returns a Boolean value that indicates whether a given objects are present in the array.
        return YES;
    }
    
    return NO;
}

//dictionaryIsValidLocation: should return YES only if the submitted location dictionary has exactly three keys by the names of @"name", @"latitude", and @"longitude". If any of these conditions fail, the method should return NO.
//Advanced: Write additional checks to determine that the value for latitude falls between -90.0 and 90.0, that the value for longitude falls between 180.0 and -180.0, and that the value for name is not an empty string. However, there are no tests for these cases.

-(NSDictionary *)locationNamed:(NSString *)name inLocations:(NSArray *)locations {
    
    NSMutableDictionary *location = [[NSMutableDictionary alloc] init];
    
    for (NSDictionary *place in locations) {
        
        if ([place[@"name"] isEqualToString:name]) {
            
            location = [place mutableCopy];
        }
        
    }
    NSArray *names = [self namesOfLocations:locations];
    
    if (![names containsObject:name]) {
        
        location = nil;
        
    }
    
    return location;
}


//locationNamed:inLocations: should return the location dictionary in the submitted locations array with the matching value for the name key as the submitted name string. If there are no matches, then it should return nil.


@end
