/////////////////////////////////////////////////////////////////////////////////
//                                                                             //
//  MaisOuiApp-   MaisOuiDictionary.h                                          //
//                A source file containing MaisOuiApp Dictionary interface     //
//                                                                             //
//  Language:         Objective-C 2.0                                          //
//  Platform:         Mac OS X                                                 //
//  Course No.:       CIS-651                                                  //
//  Assignment No.:   hw2                                                      //
//  Author:           Ankur Pandey , SUID:408067486 , Syracuse University      //
//                    (315) 572-2879 , apandey@syr.edu                         //
//                                                                             //
/////////////////////////////////////////////////////////////////////////////////

#import <Foundation/Foundation.h>

//-----------------------------------------------------------------------------
// Macro for searching specific dictioanry list
//-----------------------------------------------------------------------------
#define ENGLISHTONEPALI   1
#define ENGLISHTOHINDI    2
#define NEPALITOENGLISH   3
#define NEPALITOHINDI     4
#define HINDITOENGLISH    5
#define HINDITONEPALI     6
#define NONE              7


//-----------------------------------------------------------------------------
// Mais Oui Dictionary Interface
//-----------------------------------------------------------------------------
@interface MaisOuiDictionary : NSObject

- (NSString *) lookup: (NSString *) in dictionaryList:(int) dictionaryListValue;

@end

