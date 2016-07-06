//  FISAppDelegate.h

#import <UIKit/UIKit.h>

@interface FISAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

//Return a string containing the beginning of the submitted location's name with the number of letters specified in the length argument.
//Assumes dictionary is correctly formatted, with a value for the key "name"
- (NSString *)stringByTruncatingNameOfLocation:(NSDictionary *)location
                                      toLength:(NSUInteger)length;

//Return a dictionary containing the three argument values stored to keys of the argument names (@"name", @"latitude", @"longitude").
- (NSDictionary *)dictionaryForLocationWithName:(NSString *)name
                                       latitude:(CGFloat)latitude
                                      longitude:(CGFloat)longitude;

//Given an array of location dictionaries, return an array containing all of the location names.
- (NSArray *)namesOfLocations:(NSArray *)locations;

//Return YES only if the submitted location dictionary has exactly three keys by the names of @"name", @"latitude", and @"longitude". If any of these conditions fail, the method should return NO.
//Advanced: Write additional checks to determine that the value for latitude falls between -90.0 and 90.0, that the value for longitude falls between 180.0 and -180.0, and that the value for name is not an empty string. However, there are no tests for these cases.
- (BOOL)dictionaryIsValidLocation:(NSDictionary *)dict;

//Given array of location dictionaries, return the one with whose name matches "name." If there are no matches, return nil.
//Assume we can return the first one we find that matches.
- (NSDictionary *)locationNamed:(NSString *)name inLocations:(NSArray *)locations;

@end
