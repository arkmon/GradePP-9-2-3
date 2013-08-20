//
//  level4DetailController.m
//  GradePP
//
//  Created by Damir Okic on 17/05/2013.
//  Copyright (c) 2013 OkicDowejko. All rights reserved.
//

#import "level4DetailController.h"
#import "level4MasterController.h"
#import "AppDelegate.h"

@interface level4DetailController ()

@end

@implementation level4DetailController


#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }    
}


- (void)configureView
{
    // Update the user interface for the detail item.
    
    float avrege = 0;
    
    if (self.detailItem) {
        
        
        self.titleLevel4.text = [self.detailItem valueForKey:@"name"];
        self.codeLevel4.text = [self.detailItem valueForKey:@"code"];
        self.year4.selectedSegmentIndex = 0;
        self.creditValueLevel4.text = [NSString stringWithFormat:@"%@", [self.detailItem valueForKey:@"credit"]];
        
        self.assName1text.text = [self.detailItem valueForKey:@"assName1"];
        self.assName2text.text = [self.detailItem valueForKey:@"assName2"];
        self.assName3Text.text = [self.detailItem valueForKey:@"assName3"];
        self.assName4text.text = [self.detailItem valueForKey:@"assName4"];
        
        self.assValue1.text=[NSString stringWithFormat:@"%@", [self.detailItem valueForKey:@"assValue1"]];
        self.assValue2.text=[NSString stringWithFormat:@"%@", [self.detailItem valueForKey:@"assValue2"]];
        self.assValue3.text=[NSString stringWithFormat:@"%@", [self.detailItem valueForKey:@"assValue3"]];
        self.assValue4.text=[NSString stringWithFormat:@"%@", [self.detailItem valueForKey:@"assValue4"]];
        
        
        
        if ([self.detailItem valueForKey:@"assScore1"])
        {
            self.assMark1.text =[NSString stringWithFormat:@"%@", [self.detailItem valueForKey:@"assScore1"]];
           
            NSInteger score = [[self.detailItem valueForKey:@"assScore1"] integerValue];
            NSInteger assval =[[self.detailItem valueForKey:@"assValue1"] integerValue];
           float temp = (100 * score)/ assval ;
            avrege = avrege+temp;
                                        
        }
         if ([self.detailItem valueForKey:@"assScore2"]) {
    self.assMark2.text =[NSString stringWithFormat:@"%@", [self.detailItem valueForKey:@"assScore2"]];
           
            /* NSInteger score = [[self.detailItem valueForKey:@"assScore1"] integerValue];
             NSInteger assval =[[self.detailItem valueForKey:@"assValue1"] integerValue];
             float temp = (100 * score)/ assval ;
             avrege = avrege+temp;*/

        }
      if ([self.detailItem valueForKey:@"assScore3"]) {    
        self.assMark3.text =[NSString stringWithFormat:@"%@", [self.detailItem valueForKey:@"assScore3"]];
         /* NSInteger score = [[self.detailItem valueForKey:@"assScore1"] integerValue];
          NSInteger assval =[[self.detailItem valueForKey:@"assValue1"] integerValue];
          float temp = (100 * score)/ assval ;
          avrege = avrege+temp;*/
          
     }
          if ([self.detailItem valueForKey:@"assScore4"]) {
        self.assMark4.text =[NSString stringWithFormat:@"%@", [self.detailItem valueForKey:@"assScore4"]];
            /*
              NSInteger score = [[self.detailItem valueForKey:@"assScore1"] integerValue];
              NSInteger assval =[[self.detailItem valueForKey:@"assValue1"] integerValue];
              float temp = (100 * score)/ assval ;
              avrege = avrege+temp;*/
         }
    }
    
    self.scoreLevelAvrege.text = [NSString stringWithFormat:@"%ld",(long)avrege];
    
    
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
    
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)assMarkChnage1:(id)sender {
    
    NSUInteger value = self.assMarkSlider1.value;
    
    self.assMark1.text = [NSString stringWithFormat:@"%2d", value];
}

- (IBAction)assMarkChange2:(id)sender {
    
    NSUInteger value = self.assMarkSlider2.value;
    
    self.assMark2.text = [NSString stringWithFormat:@"%2d", value];
}

- (IBAction)assMarkChange3:(id)sender {
    
    NSUInteger value = self.assMarkSlider3.value;
    
    self.assMark3.text = [NSString stringWithFormat:@"%2d", value];
}

- (IBAction)assMarkChange4:(id)sender {
    
    NSUInteger value = self.assMarkSlider4.value;
    
    self.assMark4.text = [NSString stringWithFormat:@"%2d", value];
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
     self.titleLevel4.text];
    [request setPredicate:pred];
    
    NSManagedObject *matches = nil;
    NSError *error;
    NSArray *objects = [context executeFetchRequest:request
                                              error:&error];
    
    if ([objects count] == 0) {
        self.lavelWarning.text = @"No matches";
    } else {
        matches = [objects objectAtIndex:0];
        [context deleteObject:matches];
        [context save:&error];
        //self.textModuleCode.text = [matches valueForKey:@"code"];
        
        self.lavelWarning.text = [NSString stringWithFormat:
                                                @"%d Module Deleted", [objects count]];
    
    }
}

- (IBAction)updateModule:(id)sender {
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    
    NSManagedObjectContext *context =
    [appDelegate managedObjectContext];
    
    NSEntityDescription *entityDesc =
    [NSEntityDescription entityForName:@"Module"
                inManagedObjectContext:context];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDesc];
    
    NSPredicate *pred =
    [NSPredicate predicateWithFormat:@"(code = %@)",
     self.codeLevel4.text];
    [request setPredicate:pred];
    
    NSManagedObject *matches = nil;
    NSError *error;
    NSArray *objects = [context executeFetchRequest:request
                                              error:&error];
    
   // NSLog(@"array: %@", objects);
    
    if ([objects count] == 0) {
    } else {
        matches = [objects objectAtIndex:0];
        
       // [NSNumber numberWithInt:[_labelModuleCredit.text integerValue]] forKey:@"credit"]
        
        NSNumber *num = [NSNumber numberWithInt:[_assMark1.text integerValue]];
        NSNumber *num2 = [NSNumber numberWithInt:[_assMark2.text integerValue]];
        NSNumber *num3 = [NSNumber numberWithInt:[_assMark3.text integerValue]];
        NSNumber *num4 = [NSNumber numberWithInt:[_assMark4.text integerValue]];
        [matches setValue:num forKey:@"assScore1"];
        [matches setValue:num2 forKey:@"assScore2"];
        [matches setValue:num3 forKey:@"assScore3"];
        [matches setValue:num4 forKey:@"assScore4"];
        
        
            [context save:&error];                                        }
}
@end
