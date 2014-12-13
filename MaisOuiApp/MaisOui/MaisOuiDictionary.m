/////////////////////////////////////////////////////////////////////////////////
//                                                                             //
//  MaisOuiApp-   MaisOuiDictionary.m                                          //
//                A source file containing MaisOuiApp Dictionary Implementation//
//                                                                             //
//  Language:         Objective-C 2.0                                          //
//  Platform:         Mac OS X                                                 //
//  Course No.:       CIS-651                                                  //
//  Assignment No.:   hw2                                                      //
//  Author:           Ankur Pandey , SUID:408067486 , Syracuse University      //
//                    (315) 572-2879 , apandey@syr.edu                         //
//                                                                             //
/////////////////////////////////////////////////////////////////////////////////

#import "MaisOuiDictionary.h"

@interface MaisOuiDictionary ()

@property (strong,nonatomic,readonly) NSDictionary *englishToNepali;
@property (strong,nonatomic,readonly) NSDictionary *englishToHindi;
@property (strong,nonatomic,readonly) NSDictionary *nepaliToEnglish;
@property (strong,nonatomic,readonly) NSDictionary *nepaliToHindi;
@property (strong,nonatomic,readonly) NSDictionary *hindiToEnglish;
@property (strong,nonatomic,readonly) NSDictionary *hindiToNepali;

@end

//-----------------------------------------------------------------------------
// Mais Oui Dictionary Implementation
//-----------------------------------------------------------------------------

@implementation MaisOuiDictionary

@synthesize englishToNepali = _englishToNepali;
@synthesize englishToHindi = _englishToHindi;
@synthesize nepaliToEnglish = _nepaliToEnglish;
@synthesize nepaliToHindi = _nepaliToHindi;
@synthesize hindiToEnglish = _hindiToEnglish;
@synthesize hindiToNepali = _hindiToNepali;


//-----------------------------------------------------------------------------
// NS Dictionary Methods
//-----------------------------------------------------------------------------

- (NSDictionary *) englishToNepali
{
    if (!_englishToNepali) {
                _englishToNepali = [NSDictionary dictionaryWithObjects:
                [NSArray arrayWithObjects: @"kalopati", @"thateriki", @"kukur", @"dukhi", @"khusi", nil]
                                                   forKeys:
                [NSArray arrayWithObjects: @"blackboard", @"damn", @"dog", @"sad", @"happy", nil]];
    }
    return _englishToNepali;
}

- (NSDictionary *) englishToHindi
{
    if (!_englishToHindi) {
        _englishToHindi = [NSDictionary dictionaryWithObjects:
                            [NSArray arrayWithObjects: @"kalaboard", @"otrika", @"kuta", @"niras", @"khus", nil]
                                                       forKeys:
                            [NSArray arrayWithObjects: @"blackboard", @"damn", @"dog", @"sad", @"happy", nil]];
    }
    return _englishToHindi;
}

- (NSDictionary *) nepaliToEnglish
{
    if (!_nepaliToEnglish) {
        _nepaliToEnglish = [NSDictionary dictionaryWithObjects:
                            [NSArray arrayWithObjects: @"blackboard", @"damn", @"dog", @"sad", @"happy", nil]
                                                       forKeys:
                            [NSArray arrayWithObjects: @"kalopati", @"thateriki", @"kukur", @"dukhi", @"khusi", nil]];
    }
    return _nepaliToEnglish;
}

- (NSDictionary *) nepaliToHindi
{
    if (!_nepaliToHindi) {
        _nepaliToHindi = [NSDictionary dictionaryWithObjects:
                            [NSArray arrayWithObjects: @"kalaboard", @"otrika", @"kuta", @"niras", @"khus", nil]
                                                       forKeys:
                            [NSArray arrayWithObjects: @"kalopati", @"thateriki", @"kukur", @"dukhi", @"khusi", nil]];
    }
    return _nepaliToHindi;
}

- (NSDictionary *) hindiToEnglish
{
    if (!_hindiToEnglish) {
        _hindiToEnglish = [NSDictionary dictionaryWithObjects:
                            [NSArray arrayWithObjects: @"blackboard", @"damn", @"dog", @"sad", @"happy", nil]
                                                       forKeys:
                            [NSArray arrayWithObjects: @"kalaboard", @"otrika", @"kuta", @"niras", @"khus", nil]];
    }
    return _hindiToEnglish;
}

- (NSDictionary *) hindiToNepali
{
    if (!_hindiToNepali) {
        _hindiToNepali = [NSDictionary dictionaryWithObjects:
                            [NSArray arrayWithObjects: @"kalopati", @"thateriki", @"kukur", @"dukhi", @"khusi", nil]
                                                       forKeys:
                            [NSArray arrayWithObjects: @"kalaboard", @"otrika", @"kuta", @"niras", @"khus", nil]];
    }
    return _hindiToNepali;
}

//-----------------------------------------------------------------------------
// lookup in specific dictionary
//-----------------------------------------------------------------------------
- (NSString *) lookup: (NSString *)in  dictionaryList:(int) dictionaryListValue
{
    NSString *rv;
    if(dictionaryListValue == ENGLISHTONEPALI){
    
        // Making case sensitive while searching for specific words
        
        for(NSString *keySearch in self.englishToNepali){
            if([keySearch compare:in options:NSCaseInsensitiveSearch] == NSOrderedSame){
                rv = [self.englishToNepali objectForKey:keySearch];
            }
        }
    }else if(dictionaryListValue == ENGLISHTOHINDI){
        for(NSString *keySearch in self.englishToHindi){
            if([keySearch compare:in options:NSCaseInsensitiveSearch] == NSOrderedSame){
                rv = [self.englishToHindi objectForKey:keySearch];
            }
        }
    }else if(dictionaryListValue == NEPALITOENGLISH){
        for(NSString *keySearch in self.nepaliToEnglish){
            if([keySearch compare:in options:NSCaseInsensitiveSearch] == NSOrderedSame){
                rv = [self.nepaliToEnglish objectForKey:keySearch];
            }
        }
    }else if(dictionaryListValue == NEPALITOHINDI){
        for(NSString *keySearch in self.nepaliToHindi){
            if([keySearch compare:in options:NSCaseInsensitiveSearch] == NSOrderedSame){
                rv = [self.nepaliToHindi objectForKey:keySearch];
            }
        }
    }else if(dictionaryListValue == HINDITOENGLISH){
        for(NSString *keySearch in self.hindiToEnglish){
            if([keySearch compare:in options:NSCaseInsensitiveSearch] == NSOrderedSame){
                rv = [self.hindiToEnglish objectForKey:keySearch];
            }
        }
    }else if(dictionaryListValue == HINDITONEPALI){
        for(NSString *keySearch in self.hindiToNepali){
            if([keySearch compare:in options:NSCaseInsensitiveSearch] == NSOrderedSame){
                rv = [self.hindiToNepali objectForKey:keySearch];
            }
        }
    }else{
        
        // Clearing output text if dictionaryList value is out of list
        return @"";
    }
    
    if ( !rv )
        return @"*** no translation ***";
    return rv;
}

@end
