//
//  FirstViewController.h
//  SamsungHealth
//
//  Created by Hao Ge on 7/5/14.
//  Copyright (c) 2014 Hao Ge. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *inputSteps;
@property (weak, nonatomic) IBOutlet UIButton *getStepsButton;
- (IBAction)getStepsAction:(id)sender;

@end
