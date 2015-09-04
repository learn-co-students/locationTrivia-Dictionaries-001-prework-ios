//
//  FISAppDelegate.m
//  locationTrivia-Dictionaries
//
//  Created by Joe Burgess on 5/13/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//

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
    
    NSString *modifiedString = [location[@"name"] substringToIndex:length];

    return modifiedString;
}

- (NSDictionary *)dictionaryForLocationWithName:(NSString *)name latitude:(CGFloat)latitude longitude:(CGFloat)longitude{
    
    NSMutableDictionary *locationWithName = [[NSMutableDictionary alloc]init];
    
    locationWithName[@"name"] = name;
    locationWithName[@"latitude"] = @(latitude);
    locationWithName[@"longitude"] = @(longitude);
    return locationWithName;
}

- (NSArray *)namesOfLocations:(NSArray *)locations{
    NSMutableArray *namesOfLocations = [[NSMutableArray alloc]init];
    
    for (NSDictionary *location in locations){
        [namesOfLocations addObject:location[@"name"]];
    }
    
    return namesOfLocations;
};

- (BOOL)dictionaryIsValidLocation:(NSDictionary *)dictionary{
    BOOL dictionaryIsValidLocation = NO;
    
    if ([ [dictionary allKeys] containsObject:@"name"] &&
        [ [dictionary allKeys] containsObject:@"latitude"] &&
        [ [dictionary allKeys] containsObject:@"longitude"] &&
        [dictionary count] == 3 ) {
        
        dictionaryIsValidLocation = YES;
    }


    return dictionaryIsValidLocation;
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
