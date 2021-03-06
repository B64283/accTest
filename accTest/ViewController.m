//
//  ViewController.m
//  accTest
//
//  Created by Matthew Darke on 6/2/14.
//  Copyright (c) 2014 Matthew Darke. All rights reserved.
//

#import "ViewController.h"
#import <Accounts/accounts.h>
#import <Social/Social.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
   //call refreshTwitter for later use has own method
    [self refreshTwitter];
    
    
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)refreshTwitter
{
    ACAccountStore *accountStore = [[ACAccountStore alloc]init];
    if (accountStore != nil)
    {
        ACAccountType *accountType = [accountStore accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTwitter];
        if (accountType != nil)
        {
            //ask twitter for accsess
            [accountStore requestAccessToAccountsWithType:accountType options:nil completion:^(BOOL granted, NSError *error) {
                if (granted)
                {
                    //sucsess we have access
                    NSArray *twitterAccts = [accountStore accountsWithAccountType:accountType];
                    if (twitterAccts != nil)
                    {
                        ACAccount *currentAccount = [twitterAccts objectAtIndex:0];
                        if (currentAccount != nil)
                        {
                            NSString *requestString = @"https://api.twitter.com/1.1/statuses/user_timeline.json";
                           
                            //create request user timeline
                            SLRequest *request = [SLRequest requestForServiceType:SLServiceTypeTwitter requestMethod:SLRequestMethodGET URL:[NSURL URLWithString:requestString] parameters:nil];
                            
                            //call set account to authenticate request
                            [request setAccount:currentAccount];
                         //uses CodeBlock
                            [request performRequestWithHandler:^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error) {
                                
                                                                    //google search statusCode for info. 200 == ALL is Good!!
                                if ((error == nil) && ([urlResponse statusCode] == 200))
                                {
                                   
                                    NSArray *twitterFeed = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:nil];
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                                    
            //create a custom object for a tableView, info can be found from dictionary twitterfeed
                                    // NSDIctionary grabs what ever you need from the account exaple: firstPost
                                    
                                    NSDictionary *firstPost = [twitterFeed objectAtIndex:0];
                                    
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                                    
                                    NSLog(@"firstPost = %@", [firstPost description]);
                                }
                            }];
                        }
                        
                        //NSLog(@"twitterAccounts=%@",twitterAccts);
                    }
                }
                //need else cause if user says no every thing will be denied
                else
                {
                    //user says NO
                    
                }
            }];
        }
    }
    
    
    
    
}




@end
