//  FISAppDelegate.h

#import <UIKit/UIKit.h>

@interface FISAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

/**
 
 stringByTruncatingNameOfLocation:toLength: that takes two arguments, an NSDictionary called location and an NSUInteger called length; and returns an NSString.
 
 dictionaryForLocationWithName:latitude:longitude: that takes three arguments, an NSString called name, and two CGFloats called latitude and longitude; and returns an NSDictionary.
 
 namesOfLocations: that takes one NSArray argument called locations and returns an NSArray.
 
 dictionaryIsValidLocation: that takes one NSDictionary argument and returns a BOOL.
 
 locationNamed:inLocations: that takes two arguments, an NSString called name and an NSArray called locations; and returns an NSDictionary.
 
 */

-(NSString*)stringByTruncatingNameOfLocation:(NSDictionary*)location toLength:(NSUInteger*)length;
-(NSDictionary*)dictionaryForLocationWithName:(NSString*)name latitude:(CGFloat)latitude longitude:(CGFloat)longitude;
-(NSArray*)namesOfLocations:(NSArray*)locations;
-(BOOL)dictionaryIsValidLocation:(NSDictionary*)dictionary;
-(NSDictionary*)locationNamed:(NSString*)name inLocations:(NSArray*)locations;


@end
