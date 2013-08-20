//
//  level4DetailController.h
//  GradePP
//
//  Created by Damir Okic on 17/05/2013.
//  Copyright (c) 2013 OkicDowejko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface level4DetailController : UIViewController <UISplitViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UILabel *labelModuleNameLevel4;
@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UITextField *codeLevel4;
@property (weak, nonatomic) IBOutlet UITextField *titleLevel4;
@property (weak, nonatomic) IBOutlet UISegmentedControl *year4;
@property (weak, nonatomic) IBOutlet UILabel *creditValueLevel4;

@property (weak, nonatomic) IBOutlet UITextField *assName1text;
@property (weak, nonatomic) IBOutlet UITextField *assName2text;
@property (weak, nonatomic) IBOutlet UITextField *assName3Text;
@property (weak, nonatomic) IBOutlet UITextField *assName4text;

@property (weak, nonatomic) IBOutlet UILabel *assValue1;
@property (weak, nonatomic) IBOutlet UILabel *assValue2;
@property (weak, nonatomic) IBOutlet UILabel *assValue3;
@property (weak, nonatomic) IBOutlet UILabel *assValue4;

@property (weak, nonatomic) IBOutlet UISlider *assMarkSlider1;
@property (weak, nonatomic) IBOutlet UISlider *assMarkSlider2;
@property (weak, nonatomic) IBOutlet UISlider *assMarkSlider3;
@property (weak, nonatomic) IBOutlet UISlider *assMarkSlider4;

@property (weak, nonatomic) IBOutlet UILabel *assMark1;
@property (weak, nonatomic) IBOutlet UILabel *assMark2;
@property (weak, nonatomic) IBOutlet UILabel *assMark3;
@property (weak, nonatomic) IBOutlet UILabel *assMark4;

- (IBAction)assMarkChnage1:(id)sender;
- (IBAction)assMarkChange2:(id)sender;
- (IBAction)assMarkChange3:(id)sender;
- (IBAction)assMarkChange4:(id)sender;

- (IBAction)deleteModule:(id)sender;
- (IBAction)updateModule:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *lavelWarning;
@property (weak, nonatomic) IBOutlet UILabel *scoreLevelAvrege;

@end
