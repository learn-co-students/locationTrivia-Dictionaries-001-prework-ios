//  FISAppDelegate.h

#import <UIKit/UIKit.h>

@interface FISAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
// stringByTruncatingNameOfLocation:toLength: that takes two arguments, an NSDictionary called location and an NSUInteger called length; and returns an NSString.
-(NSString *)stringByTruncatingNameOfLocation : (NSDictionary *)location
                                     toLength : (NSInteger) length;

//dictionaryForLocationWithName:latitude:longitude: that takes three arguments, an NSString called name, and two CGFloats called latitude and longitude; and returns an NSDictionary.
-(NSDictionary *)dictionaryForLocationWithName:(NSString *)name
                                      latitude:(NSNumber *)latitude
                                     longitude:(NSNumber *)longitude;

//namesOfLocations: that takes one NSArray argument called locations and returns an NSArray.
-(NSArray *)namesOfLocations : (NSArray *)locations;

// dictionaryIsValidLocation: that takes one NSDictionary argument and returns a BOOL.
-(BOOL)dictionaryIsValidLocations : (NSDictionary *)location;

// locationNamed:inLocations: that takes two arguments, an NSString called name and an NSArray called locations; and returns an NSDictionary.
-(NSDictionary *)locationNamed : (NSString *)name
                   inLocations : (NSArray *)locations;

@end
