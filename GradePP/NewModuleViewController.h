//
//  NewModuleViewController.h
//  GradePP
//
//  Created by Damir Okic on 17/05/2013.
//  Copyright (c) 2013 OkicDowejko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewModuleViewController : UIViewController 

@property (strong, nonatomic) IBOutlet UITextField *textModuleCode;
@property (strong, nonatomic) IBOutlet UITextField *textModuelTitle;


@property (strong, nonatomic) IBOutlet UIStepper *stepperModuleCredit;
@property (weak, nonatomic) IBOutlet UILabel *labelModuleCredit;
@property (weak, nonatomic) IBOutlet UISlider *sliderAssement1;
@property (weak, nonatomic) IBOutlet UILabel *labelAssesment1;
@property (weak, nonatomic) IBOutlet UISlider *sliderAssesment2;
@property (weak, nonatomic) IBOutlet UILabel *labelAssesment2;
@property (weak, nonatomic) IBOutlet UISlider *sliderAssesment3;
@property (weak, nonatomic) IBOutlet UILabel *labelAssesment3;
@property (weak, nonatomic) IBOutlet UISlider *sliderAssesment4;
@property (weak, nonatomic) IBOutlet UILabel *labelAssesment4;
@property (weak, nonatomic) IBOutlet UITextField *textAssement1Name;
@property (weak, nonatomic) IBOutlet UITextField *textAssesment2Name;
@property (weak, nonatomic) IBOutlet UITextField *textAssesment3Name;
@property (weak, nonatomic) IBOutlet UITextField *textAssesment4Name;

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControlModuleYear;
@property (weak, nonatomic) IBOutlet UILabel *labelAssesmentValueWarning;

- (IBAction)deleteModule:(id)sender;

- (IBAction)sliderAssementAction1:(id)sender;
- (IBAction)sliderAssesmentAction2:(id)sender;
- (IBAction)sliderAssesmentAction3:(id)sender;
- (IBAction)sliderAssesmentAction4:(id)sender;
- (IBAction)AddModule:(id)sender;
- (IBAction)stepperValueChangeModuleCredit:(id)sender;
- (IBAction)find:(id)sender;

@end
