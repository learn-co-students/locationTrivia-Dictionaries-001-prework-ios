//  FISAppDelegateSpec.m

#import "Specta.h"
#define EXP_SHORTHAND
#import <Expecta.h>
#import "FISAppDelegate.h"


SpecBegin(FISAppDelegate)

describe(@"FISAppDelegate", ^{
    __block FISAppDelegate *appDelegate;
    
    __block NSString *empireStateName;
    __block CGFloat empireStateLat;
    __block CGFloat empireStateLng;
    
    __block NSDictionary *empireState;
    __block NSDictionary *location1;
    __block NSDictionary *location2;
    
    __block NSArray *locations;
    
    beforeEach(^{
        
        appDelegate = [[FISAppDelegate alloc] init];
        
        empireStateName = @"Empire State Building";
        empireStateLat  = 23.432;
        empireStateLng  = -34.34;
        
        empireState = @{ @"name"      : empireStateName,
                         @"latitude"  : @(empireStateLat) ,
                         @"longitude" : @(empireStateLng)
                         };
        
        location1 = @{ @"name"      : @"The Flatiron School",
                       @"latitude"  : @34.432 ,
                       @"longitude" : @-23.67
                       };
        
        location2 = @{ @"name"      : @"Statue Of Liberty",
                       @"latitude"  : @78.34 ,
                       @"longitude" : @92.42
                       };
        
        locations = @[ empireState, location1, location2 ];
    });
    
    describe(@"stringByTruncatingNameOfLocation:toLength:", ^{
        it(@"returns a shortened location name to 3 characters long when submitted a length argument of 3", ^{
            NSString *shortenedName =[appDelegate stringByTruncatingNameOfLocation:empireState toLength:3];
            expect(shortenedName).to.equal(@"Emp");
        });
        
        it(@"performs correctly when given a length exactly equal to that of the name", ^{
            NSString *shortenedName = [appDelegate stringByTruncatingNameOfLocation:empireState toLength:empireStateName.length];
            expect(shortenedName).to.equal(empireStateName);
        });
        
        it(@"returns a shortened location name to 5 characters long when submitted a length argument of 5", ^{
            NSString *shortenedName =[appDelegate stringByTruncatingNameOfLocation:empireState toLength:5];
            expect(shortenedName).to.equal(@"Empir");
        });
        
        it(@"does no truncation or padding when given a length longer than the name", ^{
            NSString *shortenedName = [appDelegate stringByTruncatingNameOfLocation:empireState toLength:100];
            expect(shortenedName).to.equal(empireStateName);
        });
    });
    
    describe(@"dictionaryForLocationWithName:latitude:longitude:", ^{
        it(@"returns an NSDictionary object", ^{
            expect([appDelegate dictionaryForLocationWithName:empireStateName latitude:empireStateLat longitude:empireStateLng]).to.beKindOf([NSDictionary class]);
        });
        
        it(@"returns a dictionary with the submitted values for the correct keys", ^{
            NSDictionary *newLocation = [appDelegate dictionaryForLocationWithName:empireStateName latitude:empireStateLat longitude:empireStateLng];
            expect(newLocation).to.equal(empireState);
        });
    });
    
    describe(@"namesOfLocations:", ^{
        it(@"returns an array containing the expected three objects", ^{
            NSArray *locationNames = [appDelegate namesOfLocations:locations];
            
            expect(locationNames.count).to.equal(3);
        });
        
        it(@"returns an array containing all of the expected location names in order", ^{
            NSArray *locationNames = [appDelegate namesOfLocations:locations];
            
            expect(locationNames[0]).to.equal(empireStateName);
            expect(locationNames[1]).to.equal(location1[@"name"]);
            expect(locationNames[2]).to.equal(location2[@"name"]);
        });
    });
    
    describe(@"dictionaryIsValidLocation:", ^{
        it(@"returns YES for a correct location", ^{
            expect([appDelegate dictionaryIsValidLocation:empireState]).to.beTruthy();
        });
        
        it(@"Should return NO for a location with incorrect keys", ^{
            NSDictionary *locationWithBadKeys = @{ @"n4m3"     : @"Atlantis" ,
                                                   @"l0c4710n" : @1          ,
                                                   @"l471700d" : @1          };
            expect([appDelegate dictionaryIsValidLocation:locationWithBadKeys]).to.beFalsy();
        });
        
        it(@"Should return NO for a location with not enough keys", ^{
            NSDictionary *locationWithNotEnoughKeys = @{ @"name"    : @"Atlantis" ,
                                                         @"latitude": @1          };
            
            expect([appDelegate dictionaryIsValidLocation:locationWithNotEnoughKeys]).to.beFalsy();
        });
        
        it(@"Should return NO for a location with extra keys", ^{
            NSDictionary *locationWithTooManyKeys = @{ @"name"       : @"Atlantis"    ,
                                                       @"latitude"   : @1             ,
                                                       @"longitude"  : @1             ,
                                                       @"trivia"     : @[ @"legend" ] };
            expect([appDelegate dictionaryIsValidLocation:locationWithTooManyKeys]).to.beFalsy();
        });
    });
    
    describe(@"locationNamed:inLocations:", ^{
        it(@"returns an NSDictionary object", ^{
            expect([appDelegate locationNamed:@"The Flatiron School" inLocations:locations]).to.beKindOf([NSDictionary class]);
        });
        
        it(@"returns the correct NSDictionary Location", ^{
            expect([appDelegate locationNamed:empireStateName inLocations:locations]).to.equal(empireState);
        });
        
        it(@"returns 'nil' if no location is found with that name", ^{
            expect([appDelegate locationNamed:@"Atlantis" inLocations:locations]).to.beNil();
        });
    });
    
});

SpecEnd
