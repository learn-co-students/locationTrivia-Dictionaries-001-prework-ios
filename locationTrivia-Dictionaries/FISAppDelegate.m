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

-(NSString *)stringByTruncatingNameOfLocation:(NSDictionary *)location toLength:(NSUInteger)length
{
  NSString *shortenedName = @"";
  NSUInteger nameLength = [location[@"name"]length];
  
  if (length>nameLength) {
    shortenedName = location[@"name"];
  }
  else {
    shortenedName = [location[@"name"] substringToIndex:length];
  }
  
  return shortenedName;
}

-(NSDictionary *)dictionaryForLocationWithName:(NSString *)name latitude:(CGFloat)latitude longitude:(CGFloat)longitude
{
  NSMutableDictionary *nameAndLocations = [[NSMutableDictionary alloc]init];
  
  
  nameAndLocations[@"name"]=name;
  nameAndLocations[@"latitude"]= @(latitude);
  nameAndLocations[@"longitude"]=@(longitude);
  

  return nameAndLocations;
}

-(NSArray *)namesOfLocations:(NSArray *)locations
{
  NSMutableArray *arrayOfLocationNames = [[NSMutableArray alloc]init];
  for (NSUInteger i = 0; i<locations.count; i++) {
    
    NSString *name = locations[i][@"name"];
    [arrayOfLocationNames addObject:name];

  }

  return arrayOfLocationNames;
}

-(BOOL)dictionaryIsValidLocation:(NSDictionary *)location
{
  BOOL validLocations = nil;

  
  if ([[location allKeys] containsObject:@"name"] &&
      [[location allKeys] containsObject:@"latitude"] &&
      [[location allKeys] containsObject:@"longitude"] &&
      [[location allKeys] count]==3 ) {
    NSInteger lowerLatBounds = -90.0;
    NSInteger upperLatBounds = 90.0;
    NSInteger integerLatitude = [location[@"latitude"] integerValue];
    
    NSInteger lowerLongBounds = -180.0;
    NSInteger upperLongBounds = 180.0;
    NSInteger integerLongitude = [location[@"longitude"] integerValue];
    if (integerLatitude > lowerLatBounds &&
        integerLatitude < upperLatBounds &&
        integerLongitude > lowerLongBounds &&
        integerLongitude < upperLongBounds) {
      
      validLocations = true;
    }
    else{
    validLocations = false;
    }
  }
  else{
    validLocations = false;
  }

  return validLocations;
}

-(NSDictionary *)locationNamed:(NSString *)name inLocations:(NSArray *)locations
{

  
  for (NSDictionary *returnedLocationDictionary in locations){
    if ([returnedLocationDictionary[@"name" ] isEqualToString:name]) {
      return returnedLocationDictionary;
    }
  }
    
  return nil;
}


@end
