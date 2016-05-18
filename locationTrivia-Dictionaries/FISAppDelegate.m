//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    return YES;
}

- (NSString *)stringByTruncatingNameOfLocation:(NSDictionary *)location toLength:(NSUInteger)length; {
    
    //`stringByTruncatingNameOfLocation:toLength:` should return a string containing the beginning of the submitted location's name with the number of letters specified in the `length` argument. **Hint:** *Look up the* `substringToIndex:` *method on* `NSString`.
    
    NSLog(@"%@\n\n\n\n\n", location);
    
  //  NSArray *locationArray = []
    
    NSString *name = location[@"name"];
// Subscripting the dictionary location.
    
    NSLog(@"%@\n\n\n\n\n\n\n\n", name);
    
    if (length < [name length]) {
         name = [name substringToIndex:length];
// NSUInteger length = 3 (I was able to figure this out based on the test file expecting "emp") this if statement ensures that the NSString *name will only print "emp" by utilizing the substringToIndex:
        
    }
    
   
    return name;
}

- (NSDictionary *)dictionaryForLocationWithName:(NSString *)name latitude:(CGFloat)latitude longitude:(CGFloat)longitude; {
    
    //2. `dictionaryForLocationWithName:latitude:longitude:` should return a dictionary containing the three argument values stored to keys of the argument names (`@"name"`, `@"latitude"`, `@"longitude"`).
    
    NSDictionary *locationWithName = @{@"name"      :name           ,
                                       @"latitude"  :@(latitude)    ,
                                       @"longitude" :@(longitude)  };
// Note the NSString *name is submitted without @ sign or parenthesis whereas CGFloat needed to be submitted with said properties.
    
    return locationWithName;
}

- (NSArray *)namesOfLocations:(NSArray *)locations; {
    
    // 3. `namesOfLocations:` should return an array containing all of the values for the `name` key in the location dictionaries in the submitted `locations` array.
    
    NSLog(@"%@\n\n\n\n\n\n\n", locations);
    
    NSMutableArray *mLocations = [[NSMutableArray alloc] init];
    
    NSUInteger i = 0;
    
    for (NSDictionary *location in locations) {
        
        
        mLocations[i] = location[@"name"];
        i++;
        
     //   if ([location containsString:@"name"]) {
            
       //     [mLocations addObject:location];
            
    //    }
    }
    return mLocations;
}

- (BOOL)dictionaryIsValidLocation:(NSDictionary *)location; {
    
    // 4. `dictionaryIsValidLocation:` should return `YES` only if the submitted `location` dictionary has exactly three keys by the names of `@"name"`, `@"latitude"`, and `@"longitude"`. If any of these conditions fail, the method should return `NO`.
   // **Advanced:** *Write additional checks to determine that the value for* `latitude` *falls between -90.0 and 90.0, that the value for* `longitude` *falls between 180.0 and -180.0, and that the value for* `name` *is not an empty string. However, there are no tests for these cases.*
    
    NSLog(@"%@\n\n\n\n\n\n", location);
    
    BOOL validLocation = NO;
    
    NSArray *locationArray = [location allKeys];
    
    NSString *name = @"name";
    NSString *latitude = @"latitude";
    NSString *longitude = @"longitude";
    
    if ([locationArray containsObject:name] && [locationArray containsObject:latitude] && [locationArray containsObject:longitude] && [locationArray count] <= 3 ) {
        
        validLocation = YES;
    }
    
    NSInteger latitudeInt = [location[@"latitude"] integerValue];
    NSInteger longitudeInt = [location[@"longitude"] integerValue];
    
//    if (latitudeInt >= -90.00 && latitudeInt <= 90.0) {
        
  //      validLocation = YES;
  //  } if (longitudeInt >= -180.0 && longitudeInt <= 180.0) {
        
  //      validLocation = YES;
  //  } if ([location[@"name"] isEqualToString:@""]) {
        
   //     validLocation = NO;
        
   // }
    
    
   // for (NSString *string in location) {
        
   //     if ([string containsString:@"name"]) {
            
     //       validLocation = YES;
        
   // } else if ([string containsString:@"latitude"]) {
        
     //   validLocation = YES;;
        
   // } else if ([string containsString:@"longitude"]) {
        
    //    validLocation = YES;
        
   // } else {
        
     //   validLocation = NO;
        
   // }
    //}
    

    
    return validLocation;
}

- (NSDictionary *)locationNamed:(NSString *)name inLocations:(NSArray *)locations; {
  // 5. `locationNamed:inLocations:` should return the `location` dictionary in the submitted `locations` array with the matching value for the `name` key as the submitted `name` string. If there are no matches, then it should return `nil`.
    
    NSLog(@"\n\n\n\n\n\n%@\n\n\n\n\n\n\n", locations);
    
    NSDictionary *locationNames;
    
    for (NSDictionary *dictionaryName in locations) {
        if (dictionaryName[@"name"] == name) {
            
            locationNames = dictionaryName;
        }
    }
    NSLog(@"\n\n\n\n\n\n\n%@\n\n\n\n\n", locationNames);
    
    return locationNames;
}


@end
