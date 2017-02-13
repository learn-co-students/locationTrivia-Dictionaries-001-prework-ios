//  FISAppDelegate.h

#import <UIKit/UIKit.h>

@interface FISAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

/**
 
 *  Declare your method names here.
 
 */

// should return a string containing the beginning of the submitted location's name with the number of letters specified in the length argument.Hint: Look up the substringToIndex: method on NSString.
- (NSString *)stringByTruncatingNameOfLocation:(NSDictionary *)location toLength:(NSUInteger)length;

// should return a dictionary containing the three argument values stored to keys of the argument names (@"name", @"latitude", @"longitude").
- (NSDictionary *)dictionaryForLocationWithName:(NSString *)name latitude:(CGFloat)latitude longitude:(CGFloat)longitude;

// should return an array containing all of the values for the name key in the location dictionaries in the submitted locations array.
- (NSArray *)namesOfLocations:(NSArray *)locations;

// should return YES only if the submitted location dictionary has exactly three keys by the names of @"name", @"latitude", and @"longitude". If any of these conditions fail, the method should return NO. Advanced: Write additional checks to determine that the value for latitude falls between -90.0 and 90.0, that the value for longitude falls between 180.0 and -180.0, and that the value for name is not an empty string. However, there are no tests for these cases.
- (BOOL)dictionaryIsValidLocation:(NSDictionary *)argument;

//  should return the location dictionary in the submitted locations array with the matching value for the name key as the submitted name string. If there are no matches, then it should return nil.
- (NSDictionary *)locationNamed:(NSString *)name inLocations:(NSArray *)locations;

@end
