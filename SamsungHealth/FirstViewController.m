//
//  FirstViewController.m
//  SamsungHealth
//
//  Created by Hao Ge on 7/5/14.
//  Copyright (c) 2014 Hao Ge. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)getStepsAction:(id)sender {
    NSString *name = self.inputSteps.text;
    
    //push object into cloud
//    PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
//    testObject[@"steps"] = name;
//    [testObject saveInBackground];
    
    //call cloud function
    [PFCloud callFunctionInBackground:@"hello"
                       withParameters:@{}
                                block:^(NSString *result, NSError *error) {
                                    if (!error) {
                                        self.stepLabel.text = result;
                                    }
                                }];
    
}
@end
