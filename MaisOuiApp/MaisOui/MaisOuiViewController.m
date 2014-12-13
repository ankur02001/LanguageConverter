/////////////////////////////////////////////////////////////////////////////////
//                                                                             //
//  MaisOuiApp-  MaisOuiAppViewController.m                                    //
//               A source file containing MaisOuiViewController Implemenatation//
//                                                                             //
//  Language:         Objective-C 2.0                                          //
//  Platform:         Mac OS X                                                 //
//  Course No.:       CIS-651                                                  //
//  Assignment No.:   hw2                                                      //
//  Author:           Ankur Pandey , SUID:408067486 , Syracuse University      //
//                    (315) 572-2879 , apandey@syr.edu                         //
//                                                                             //
/////////////////////////////////////////////////////////////////////////////////

#import "MaisOuiViewController.h"
#import "MaisOuiDictionary.h"

@interface MaisOuiViewController ()

@property (strong,nonatomic) MaisOuiDictionary *dictionary;
@property (weak, nonatomic) IBOutlet UITextField *inWord;
@property (weak, nonatomic) IBOutlet UILabel *outWord;
@property (strong, nonatomic) IBOutlet UIPickerView *sourceLanguage;
@property (strong,nonatomic) NSArray *sourceArray;
@property (strong, nonatomic) IBOutlet UIPickerView *destinationLanguage;
@property (strong,nonatomic) NSArray *destinationArray;
- (IBAction)translate:(UIButton *)sender;

@end


//-----------------------------------------------------------------------------
// Mais Oui View controller Implementation
//-----------------------------------------------------------------------------
@implementation MaisOuiViewController

@synthesize inWord = _inWord;
@synthesize outWord = _outWord;
@synthesize dictionary = _dictionary;
@synthesize sourceLanguage = _sourceLanguage;
@synthesize sourceArray = _sourceArray;
@synthesize destinationLanguage = _destinationLanguage;
@synthesize destinationArray = _destinationArray;


//-----------------------------------------------------------------------------
// viewDidLoad method
//-----------------------------------------------------------------------------
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.inWord.delegate = self;
    
    //Load our Source NSArray and destination NSArray
    
    _destinationArray = [[NSArray alloc] initWithObjects:@"English",@"Nepali",@"Hindi",nil];
    _sourceArray = [[NSArray alloc] initWithObjects:@"English",@"Nepali",@"Hindi",nil];
    
    _sourceLanguage.showsSelectionIndicator = TRUE;
    _sourceLanguage.dataSource =self;
    _sourceLanguage.delegate =self;
    [self.view addSubview:self.sourceLanguage];
    
    //selection of middle row
    [self.sourceLanguage selectRow:1 inComponent:0 animated:YES];
    
    _destinationLanguage.showsSelectionIndicator = TRUE;
    _destinationLanguage.dataSource =self;
    _destinationLanguage.delegate =self;
    [self.view addSubview:self.destinationLanguage];
    
    //selection of middle row
    [self.destinationLanguage selectRow:1 inComponent:0 animated:YES];
}

//-----------------------------------------------------------------------------
// calling Dictionary init
//-----------------------------------------------------------------------------
- (MaisOuiDictionary *) dictionary
{
    if (!_dictionary)
        _dictionary = [[MaisOuiDictionary alloc] init];
    return _dictionary;
}

//-----------------------------------------------------------------------------
// Called by translate button
//-----------------------------------------------------------------------------
- (IBAction)translate:(UIButton *)sender
{
    
    [self.inWord resignFirstResponder];
    NSString *sourceSelect = [_sourceArray objectAtIndexedSubscript:[_sourceLanguage selectedRowInComponent:0]];
    
    NSString *destinationSelect = [_destinationArray objectAtIndexedSubscript:[_destinationLanguage selectedRowInComponent:0]];
    NSString *title = (@" Not allowed to transalate to same Language");
    
    // returning if source language and destination language are same
    
    if( sourceSelect == destinationSelect) {
        // Clearing output text
        self.outWord.text = [self.dictionary lookup: self.inWord.text dictionaryList:NONE];
        // Alerting to user
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:@"" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        return;
    }
    
    // Searching for specific word in dictionary
    
    if([sourceSelect  isEqual: @"English"] && [destinationSelect  isEqual: @"Nepali"]){
        self.outWord.text = [self.dictionary lookup: self.inWord.text dictionaryList:ENGLISHTONEPALI];
    }else if([sourceSelect  isEqual: @"English"] && [destinationSelect  isEqual: @"Hindi"]){
        self.outWord.text = [self.dictionary lookup: self.inWord.text dictionaryList:ENGLISHTOHINDI];
    }else if([sourceSelect  isEqual: @"Nepali"] && [destinationSelect  isEqual: @"English"]){
        self.outWord.text = [self.dictionary lookup: self.inWord.text dictionaryList:NEPALITOENGLISH];
    }else if([sourceSelect  isEqual: @"Nepali"] && [destinationSelect  isEqual: @"Hindi"]){
        self.outWord.text = [self.dictionary lookup: self.inWord.text dictionaryList:NEPALITOHINDI];
    }else if([sourceSelect  isEqual: @"Hindi"] && [destinationSelect  isEqual: @"English"]){
        self.outWord.text = [self.dictionary lookup: self.inWord.text dictionaryList:HINDITOENGLISH];
    }else{
        self.outWord.text = [self.dictionary lookup: self.inWord.text dictionaryList:HINDITONEPALI];
    }

}


//-----------------------------------------------------------------------------
// implements UITextFieldDelegate protocol method
//-----------------------------------------------------------------------------
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
   
    NSString *sourceSelect = [_sourceArray objectAtIndexedSubscript:[_sourceLanguage selectedRowInComponent:0]];
    
    NSString *destinationSelect = [_destinationArray objectAtIndexedSubscript:[_destinationLanguage selectedRowInComponent:0]];
    
    if (textField == self.inWord ) {
        [textField resignFirstResponder];
        if([sourceSelect  isEqual: @"English"] && [destinationSelect  isEqual: @"Nepali"]){
            self.outWord.text = [self.dictionary lookup: self.inWord.text dictionaryList:ENGLISHTONEPALI];
        }else if([sourceSelect  isEqual: @"English"] && [destinationSelect  isEqual: @"Hindi"]){
            self.outWord.text = [self.dictionary lookup: self.inWord.text dictionaryList:ENGLISHTOHINDI];
        }else if([sourceSelect  isEqual: @"Nepali"] && [destinationSelect  isEqual: @"English"]){
            self.outWord.text = [self.dictionary lookup: self.inWord.text dictionaryList:NEPALITOENGLISH];
        }else if([sourceSelect  isEqual: @"Nepali"] && [destinationSelect  isEqual: @"Hindi"]){
            self.outWord.text = [self.dictionary lookup: self.inWord.text dictionaryList:NEPALITOHINDI];
        }else if([sourceSelect  isEqual: @"Hindi"] && [destinationSelect  isEqual: @"English"]){
            self.outWord.text = [self.dictionary lookup: self.inWord.text dictionaryList:HINDITOENGLISH];
        }else{
            self.outWord.text = [self.dictionary lookup: self.inWord.text dictionaryList:HINDITONEPALI];
        }
        return NO;
    }
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -UIPickerView Methods

//-----------------------------------------------------------------------------
// UIPickerView Methods
//-----------------------------------------------------------------------------
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
        return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if(pickerView.self == _sourceLanguage)
        return [_sourceArray count];
    else
        return [_destinationArray count];
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if(pickerView.self == _sourceLanguage)
        return [_sourceArray objectAtIndex:row];
    else
        return [_destinationArray objectAtIndex:row];
}

@end
