//
//  NewModuleViewController.m
//  GradePP
//
//  Created by Damir Okic on 17/05/2013.
//  Copyright (c) 2013 OkicDowejko. All rights reserved.
//

#import "NewModuleViewController.h"
#import "AppDelegate.h"

@interface NewModuleViewController ()

@end


@implementation NewModuleViewController
@synthesize textModuleCode, textModuelTitle;

- (IBAction)AddModule:(id)sender {
    
    NSUInteger value1 = self.sliderAssement1.value;
    NSUInteger value12 = self.sliderAssesment2.value;
    NSUInteger value13 = self.sliderAssesment3.value;
    NSUInteger value14 = self.sliderAssesment4.value;
    
    NSUInteger total = value1+value12+value13+value14;
    
       
    if ([self.textModuleCode.text isEqualToString:@""]) {
        
        self.labelAssesmentValueWarning.text = [ NSString stringWithFormat:@"Please fill out code field \n"];
        
        
    }
    
   else if ([self.textModuelTitle.text isEqualToString:@""]) {
        
        self.labelAssesmentValueWarning.text = [ self.labelAssesmentValueWarning.text stringByAppendingString:@"Please fill out title field \n"];
        
    }
    
  else if (total>100) {
        self.labelAssesmentValueWarning.text = [ self.labelAssesmentValueWarning.text stringByAppendingString:@"Value of all assesments may not exceed 100% \n"];    }
    
    else  {
    
AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];

NSManagedObjectContext *context = [appDelegate managedObjectContext];
    
    
    NSNumber  *value = [NSNumber numberWithFloat: self.sliderAssement1.value];
    NSNumber  *value2 = [NSNumber numberWithFloat: self.sliderAssesment2.value];
     NSNumber  *value3 = [NSNumber numberWithFloat: self.sliderAssesment3.value];
     NSNumber  *value4 = [NSNumber numberWithFloat: self.sliderAssesment4.value];
    
    NSString *assName1 = _textAssement1Name.text;
     NSString *assName2 = _textAssesment2Name.text;
     NSString *assName3 = _textAssesment3Name.text;
     NSString *assName4 = _textAssesment4Name.text;
    
        
//set the year
    
     int theInteger;
    theInteger = [_segmentedControlModuleYear selectedSegmentIndex];
    NSNumber  *year;
    
    if (theInteger==0){
       year = [NSNumber numberWithFloat: 4];
    }
    if (theInteger==1){
        year = [NSNumber numberWithFloat: 5];
    }
    if (theInteger==2){
        year = [NSNumber numberWithFloat: 6];
    }

    
// MODULE
NSManagedObject *newModule;
newModule = [NSEntityDescription
              insertNewObjectForEntityForName:@"Module"
              inManagedObjectContext:context];

[newModule setValue:textModuelTitle.text forKey:@"name"];
[newModule setValue:textModuleCode.text forKey:@"code"];
[newModule setValue:[NSNumber numberWithInt:[_labelModuleCredit.text integerValue]] forKey:@"credit"];
    [newModule setValue:year forKey:@"level"];
[newModule setValue:assName1 forKey:@"assName1"];
[newModule setValue:assName2 forKey:@"assName2"];
[newModule setValue:assName3 forKey:@"assName3"];
[newModule setValue:assName4 forKey:@"assName4"];
  [newModule setValue:value forKey:@"assValue1"];
    [newModule setValue:value2 forKey:@"assValue2"];
    [newModule setValue:value3 forKey:@"assValue3"];
    [newModule setValue:value4 forKey:@"assValue4"];

    
  /*
 //ASSESMENT 1
    
   NSManagedObject *newAssesment;
    newAssesment = [NSEntityDescription
                 insertNewObjectForEntityForName:@"Assesment"
                 inManagedObjectContext:context];
    
    [newAssesment setValue:textModuelTitle.text forKey:@"name"];
       [newAssesment setValue:value forKey:@"value"];
    
    //ASSESMENT 2
    
    NSManagedObject *newAssesment2;
    newAssesment2 = [NSEntityDescription
                    insertNewObjectForEntityForName:@"Assesment"
                    inManagedObjectContext:context];
    
    [newAssesment2 setValue:textModuelTitle.text forKey:@"name"];
    [newAssesment2 setValue:value2 forKey:@"value"];
   
    //ASSESMENT 3
    
    NSManagedObject *newAssesment;
    newAssesment = [NSEntityDescription
                    insertNewObjectForEntityForName:@"Assesment"
                    inManagedObjectContext:context];
    
    [newAssesment setValue:textModuelTitle.text forKey:@"name"];
    [newAssesment setValue:value forKey:@"value"];
    
    
    //ASSESMENT 4
    
    NSManagedObject *newAssesment;
    newAssesment = [NSEntityDescription
                    insertNewObjectForEntityForName:@"Assesment"
                    inManagedObjectContext:context];
    
    [newAssesment setValue:textModuelTitle.text forKey:@"name"];
    [newAssesment setValue:value forKey:@"value"];
 
    
 
//LEVEL
   NSManagedObject *newLevel;
    newLevel = [NSEntityDescription
                 insertNewObjectForEntityForName:@"Level"
                 inManagedObjectContext:context];
    
       [newLevel setValue:year forKey:@"value"];

    [[newLevel mutableSetValueForKey:@"modules"] addObject:newModule];
    
    [[newModule mutableSetValueForKey:@"assesment"] addObject:newAssesment];
   [[newModule mutableSetValueForKey:@"assesment"] addObject:newAssesment2];
    
    ///////////////////////////////////*/

    textModuelTitle.text = @"";
    textModuleCode.text = @"";

 
 NSError *error;
[context save:&error];
self.labelAssesmentValueWarning.text = @"Module is saved";
 
 
//self.labelAssesmentValueWarning.text = [NSString stringWithFormat:@"%2d", theInteger];
    }
}


- (IBAction)deleteModule:(id)sender {
    
     AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    
    NSEntityDescription *entityDesc =
    [NSEntityDescription entityForName:@"Module"
                inManagedObjectContext:context];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDesc];
    
    NSPredicate *pred =
    [NSPredicate predicateWithFormat:@"(name = %@)",
     self.textModuelTitle.text];
    [request setPredicate:pred];
    
    NSManagedObject *matches = nil;
    NSError *error;
    NSArray *objects = [context executeFetchRequest:request
                                              error:&error];
    
    if ([objects count] == 0) {
        self.labelAssesmentValueWarning.text = @"No matches";
    } else {
        matches = [objects objectAtIndex:0];
        [context deleteObject:matches];
        [context save:&error];
        self.textModuleCode.text = [matches valueForKey:@"code"];
        
        self.labelAssesmentValueWarning.text = [NSString stringWithFormat:
                                                @"%d matches found", [objects count]];
    }

    
}
- (IBAction)find:(id)sender {
    
   AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    
    NSManagedObjectContext *context =
    [appDelegate managedObjectContext];
    
    NSEntityDescription *entityDesc =
    [NSEntityDescription entityForName:@"Module"
                inManagedObjectContext:context];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDesc];
    
    NSPredicate *pred =
    [NSPredicate predicateWithFormat:@"(name = %@)",
     self.textModuelTitle.text];
    [request setPredicate:pred];
    
    NSManagedObject *matches = nil;
    NSError *error;
    NSArray *objects = [context executeFetchRequest:request
                                              error:&error];
    
     NSLog(@"array: %@", objects);
    
    if ([objects count] == 0) {
        self.labelAssesmentValueWarning.text = @"No matches";
    } else {
        matches = [objects objectAtIndex:0];
        self.textModuleCode.text = [matches valueForKey:@"code"];
        
        self.labelAssesmentValueWarning.text = [NSString stringWithFormat:
                       @"%d matches found", [objects count]];
    }
    
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
   
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)stepperValueChangeModuleCredit:(id)sender {
   
    NSUInteger value = self.stepperModuleCredit.value;
   
    	   self.labelModuleCredit.text = [NSString stringWithFormat:@"%2d", value];
}




- (IBAction)sliderAssementAction1:(id)sender {
    
    NSUInteger value = self.sliderAssement1.value;
    
    self.labelAssesment1.text = [NSString stringWithFormat:@"%2d", value];
}

- (IBAction)sliderAssesmentAction2:(id)sender {
    
    NSUInteger value = self.sliderAssesment2.value;
    
    self.labelAssesment2.text = [NSString stringWithFormat:@"%2d", value];
}

- (IBAction)sliderAssesmentAction3:(id)sender {
    
    NSUInteger value = self.sliderAssesment3.value;
    
    self.labelAssesment3.text = [NSString stringWithFormat:@"%2d", value];
}


- (IBAction)sliderAssesmentAction4:(id)sender {
    
    NSUInteger value = self.sliderAssesment4.value;
    
    self.labelAssesment4.text = [NSString stringWithFormat:@"%2d", value];
}


@end
