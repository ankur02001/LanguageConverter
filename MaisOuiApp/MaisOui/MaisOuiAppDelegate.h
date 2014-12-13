/////////////////////////////////////////////////////////////////////////////////
//                                                                             //
//  MaisOuiApp-   MaisOuiAppDelegate.h                                         //
//                A source file containing MaisOuiAppDelegate Interface        //
//                                                                             //
//  Language:         Objective-C 2.0                                          //
//  Platform:         Mac OS X                                                 //
//  Course No.:       CIS-651                                                  //
//  Assignment No.:   hw2                                                      //
//  Author:           Ankur Pandey , SUID:408067486 , Syracuse University      //
//                    (315) 572-2879 , apandey@syr.edu                         //
//                                                                             //
/////////////////////////////////////////////////////////////////////////////////

#import <UIKit/UIKit.h>

@class MaisOuiViewController;

//-----------------------------------------------------------------------------
// MaisOuiAppDelegate interface
//-----------------------------------------------------------------------------

@interface MaisOuiAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) MaisOuiViewController *viewController;

@end
