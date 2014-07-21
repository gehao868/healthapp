//
//  FirstViewController.m
//  SamsungHealth
//
//  Created by Hao Ge on 7/5/14.
//  Copyright (c) 2014 Hao Ge. All rights reserved.
//

#import <OAuthiOS/OAuthiOS.h>
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
//    [PFCloud callFunctionInBackground:@"hello"
//                       withParameters:@{}
//                                block:^(NSString *result, NSError *error) {
//                                    if (!error) {
//                                        self.stepLabel.text = result;
//                                    }
//                                }];
    
    // OAuth with FitBit and deal with data
    OAuthIOModal *oauthioModal =
        [[OAuthIOModal alloc] initWithKey:@"s0ROr_j8tXMhlAfwlPQ4SXKQWQM" delegate:self];
    [oauthioModal showWithProvider:@"fitbit"];
}

- (void)didReceiveOAuthIOResponse:(OAuthIORequest *)request {
    NSDictionary *credentials = [request getCredentials];
    NSLog(@"get Token: %@", credentials[@"oauth_token"]);
    NSLog(@"get Secret: %@", credentials[@"oauth_token_secret"]);
    
    // params example
    // NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    // [params setObject:@"hello" forKey:@"message"];
    
    [self getUserInfo:request];
    [self getSteps:request];
}

- (void)didFailWithOAuthIOError:(NSError *)error {
    // ignore
    NSLog(@"error: %@", error.description);
}

- (void)getUserInfo:(OAuthIORequest *)request {

    [request get:@"https://api.fitbit.com/1/user/-/profile.json" success:^(NSDictionary *output, NSString *body, NSHTTPURLResponse *httpResponse)
     {
         //NSLog(@"status code:%i\n\n", httpResponse.statusCode);
         NSData *data = [body dataUsingEncoding:NSUTF8StringEncoding];
         id json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
         id info = [json valueForKeyPath:@"user.displayName"];
     }];
}

- (void)getSteps:(OAuthIORequest *)request {
    
    [request get:@"https://api.fitbit.com/1/user/-/activities/date/2014-07-20.json" success:^(NSDictionary *output, NSString *body, NSHTTPURLResponse *httpResponse)
     {
         //NSLog(@"status code:%i\n\n", httpResponse.statusCode);
         NSData *data = [body dataUsingEncoding:NSUTF8StringEncoding];
         id json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
         NSString* step = [[json valueForKeyPath:@"summary.steps"] stringValue];
         [self showStepsCallback:step];
     }];
}

- (void)showStepsCallback:(NSString *) input {
    self.stepLabel.text = input;
}

@end
