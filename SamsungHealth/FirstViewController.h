//
//  FirstViewController.h
//  SamsungHealth
//
//  Created by Hao Ge on 7/5/14.
//  Copyright (c) 2014 Hao Ge. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface FirstViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *inputSteps;
@property (weak, nonatomic) IBOutlet UILabel *stepLabel;
@property (weak, nonatomic) IBOutlet UIButton *getStepsButton;

// Action after pressing button
- (IBAction)getStepsAction:(id)sender;

// Handles the results of a successful authentication
- (void)didReceiveOAuthIOResponse:(OAuthIORequest *)request;

// Handle errors in the case of an unsuccessful authentication
- (void)didFailWithOAuthIOError:(NSError *)error;

- (void)showStepsCallback:(NSString *) input;

- (void)getUserInfo:(OAuthIORequest *)request;

- (void)getSteps:(OAuthIORequest *)request;

@end
