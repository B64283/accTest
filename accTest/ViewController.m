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
#import "TwitterUserPost.h"
#import "CustomCell.h"
#import "DetailViewController.h"
#import "ProfileViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    //call refreshTwitter for later use has own method
    
    //initialize array
    twitterPosts = [[NSMutableArray alloc]init];
    
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
                    
                    //makes array of twitter AcctStore
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
                                    
                                    for (NSInteger i=0; i<[twitterFeed count]; i++)
                                    {
                                        TwitterUserPost *userPostInfo = [self createPostInfoFromDictionary:[twitterFeed objectAtIndex:i]];
                                        
                                        if (userPostInfo != nil)
                                        {
                                            [twitterPosts addObject:userPostInfo];
                                        }
                                    }
                                }
                            
                                        dispatch_async(dispatch_get_main_queue(),^{
                                            
                                            //reloads data to table view
                                            [MyTableView reloadData];
                                            
                                            
                                        });
                                
                                    
                                    
                                    //return twitterFeed;
                                    //create a custom object for a tableView, info can be found from dictionary twitterfeed
                                    // NSDIctionary grabs what ever you need from the account exaple: firstPost
                                    
                                    
                                    ///loop through all posts returned from twitterfeed
                                        
                                    //codeBlock tells to send data to the tabelView
                                                                      //NSDictionary *firstPost = [twitterFeed objectAtIndex:0];
                                    
                                    
                                    
                                    //NSLog(@"firstPost = %@", [firstPost description]);
                                
                            }];
                        }
                        
                        //NSLog(@"twitterAccounts=%@",twitterAccts);
                    }
                }
                //need else cause if user says no every thing will be denied
                else
                {
                    //user says NO// can enter an error
                    
                }
            }];
        }
    }
    
    
    
    
}


-(TwitterUserPost*)createPostInfoFromDictionary:(NSDictionary*)postDictionary
 {
 //TwitterUserPost *postInfo = [[TwitterUserPost alloc]init];
 
 
 NSString *timeDate = [postDictionary valueForKey:@"created_at"];
 NSString *userDictionary = [postDictionary objectForKey:@"user"];
 NSString *tweetText = [postDictionary valueForKey:@"text"];
 NSString *following = [userDictionary valueForKey:@"following"];
 NSString *followers = [userDictionary valueForKey:@"followed"];
 NSString *name = [userDictionary valueForKeyPath:@"name"];
 NSString *userIcon = [userDictionary valueForKey:@"profile_image_url_https"];
 UIImage *Icon = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:userIcon ]]];
     
     TwitterUserPost *userPostInfo = [[TwitterUserPost alloc]
                                      initWithPostInfo:timeDate
                                      text:tweetText
                                      icon:userIcon
                                      userFollowers:followers
                                      userFollowing:following
                                      userName:name];
 
 return userPostInfo;
 }

//forgot this last time and that was part of the problem
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCustomCell"];
    if (cell != nil)
    {
        TwitterUserPost *userPostInfo =[twitterPosts objectAtIndex:indexPath.row];
        
        //cell.tweetText.text = [userPostInfo tweetText];
    
    
    
    
    }
    return cell;
}


// counts data iN array and sets number of rows and section //returns array for count number of rows

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [twitterPosts count];
    
}



-(IBAction)exit:(UIStoryboardSegue*)segue
{
    
}

//sends to profo=ile
-(IBAction)profile:(id)sender
{
    
    [self performSegueWithIdentifier:@"toProfile" sender:self];
}








//post tweet method
-(IBAction)onClick:(id)sender
{
    SLComposeViewController *slComposeViewController = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
    [slComposeViewController addImage:[UIImage imageNamed:@"1351606352852.jpg"]];
    [slComposeViewController setInitialText:@"Posted from Sweet Tweet"];
    [self presentViewController: slComposeViewController animated:true completion:nil];
    
}
//refresh twitter feed works

-(IBAction)Refresh:(id)sender
{
    
    [self refreshTwitter];
    
    
}



//split segue sends info to the different views
// take the info and turn it into a string and put the string into the lable
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"toProfile"])
        
    {
        
        ProfileViewController *profileViewController = segue.destinationViewController;
        
        UITableViewCell *cell = (UITableViewCell*)sender;
        NSIndexPath *indexPath = [MyTableView indexPathForCell:cell];
        
        // get the string in the array based on the item in the table view that's clicked on
        TwitterUserPost *currentProfile = [twitterPosts objectAtIndex:indexPath.row];
        
        profileViewController.currentProfile = currentProfile;///add info
        
        
    }
    else if ([segue.identifier isEqualToString:@"DetailViewController"])
        
    {
        DetailViewController *detailViewController = segue.destinationViewController;
        
        UITableViewCell *cell = (UITableViewCell*)sender;
        NSIndexPath *indexPath = [MyTableView indexPathForCell:cell];
        
        // get the string in the array based on the item in the table view that's clicked on
        TwitterUserPost *currentTweet = [twitterPosts objectAtIndex:indexPath.row];
        
        detailViewController.currentTweet = currentTweet;
        
        
    }
    
}







@end
