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
    twitterFeed = [[NSMutableArray alloc]init];
    
    
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
                                    
                                    twitterFeed = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:nil];
                                    
                                    
                                    if (twitterFeed.count != 0)
                                    {
                                        //codeBlock tells to send data to the tabelView
                                        dispatch_async(dispatch_get_main_queue(),^{
                                            
                                            //reloads data to table view
                                            [MyTableView reloadData];
                                            
                                            
                                        });
                                        
                                    }
                                    
                                    
                                    //return twitterFeed;
                                    //create a custom object for a tableView, info can be found from dictionary twitterfeed
                                    // NSDIctionary grabs what ever you need from the account exaple: firstPost
                                    
                                    
                                    ///loop through all posts returned from twitterfeed
                                    /*for (NSInteger i=0; i<[twitterFeed count]; i++)
                                     {
                                     TwitterUserPost *userPostInfo = [self createPostInfoFromDictionary:[twitterFeed objectAtIndex:i]];
                                     
                                     if (userPostInfo != nil)
                                     {
                                     [twitterPosts addObject:userPostInfo];
                                     }
                                     }*/
                                    
                                   // NSDictionary *firstPost = [twitterFeed objectAtIndex:0];
                                    
                                    
                                    
                                    //NSLog(@"firstPost = %@", [firstPost description]);
                                }
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


/*-(TwitterUserPost*)createPostInfoFromDictionary:(NSDictionary*)postDictionary
 {
 //TwitterUserPost *postInfo = [[TwitterUserPost alloc]init];
 
 
 NSString *timeDate = [postDictionary valueForKey:@"created_at"];
 NSString *userDictionary = [postDictionary objectForKey:@"user"];
 NSString *tweetText = [postDictionary valueForKey:@"text"];
 NSString *following = [userDictionary valueForKey:@"following"];
 NSString *followers = [userDictionary valueForKey:@"followed"];
 NSString *name = [userDictionary valueForKeyPath:@"name"];
 NSData *userIcon = [userDictionary valueForKey:@"profile_image_url_https"];
 
 TwitterUserPost *userPostInfo = [[TwitterUserPost alloc]initWithPostInfo:timeDate text:tweetText icon:userIcon userFollowers:followers userFollowing:following userName:name];
 
 return userPostInfo;
 }*/


- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCustomCell"];
    if (cell != nil)
    {
        
        tweet = twitterFeed[indexPath.row];
        
        timeDate = [tweet valueForKey:@"created_at"];
        NSString *userDictionary = [tweet objectForKey:@"user"];
        tweetText = [userDictionary valueForKey:@"text"];
        following = [userDictionary valueForKey:@"following"];
        followers = [userDictionary valueForKey:@"followed"];
        name = [userDictionary valueForKeyPath:@"name"];
        userIcon = [userDictionary valueForKey:@"profile_image_url_https"];
        
        UIImage *Icon = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:userIcon ]]];
        cell.secondLabel.text = tweet[@"text"];
        cell.firstLabel.text = timeDate;
        cell.cellIconImage.image = Icon;
        
        cell.detailTextLabel.text = twitterFeed.description;
        
    }
    return cell;
}


// counts data iN array and sets number of rows and section //returns array for count number of rows
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [twitterFeed count];
    
}



-(IBAction)exit:(UIStoryboardSegue*)segue
{
    
}

//sends to profo=ile
-(IBAction)profile:(id)sender
{
    
    [self performSegueWithIdentifier: @"toProfile" sender: self];
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
    //get path for selected row
    NSIndexPath *Path = [MyTableView indexPathForSelectedRow];
    //get data from the tweet selected
    tweet = [twitterFeed objectAtIndex:Path.row];
    NSDictionary *userDictionary = [tweet objectForKey:@"user"];
if ([segue.identifier isEqualToString:@"ToDetailViewController"])
        
    {
       
        // update variables with selected tweet/cell values
        tweetText = [tweet valueForKey:@"text"];
        timeDate = [tweet valueForKey:@"created_at"];
        name = [userDictionary valueForKeyPath:@"name"];
        
        //grabs the selected viewcontroller
        DetailViewController *detVC = segue.destinationViewController;
       
        //place objects into lables
        detVC.DTUserNm = name;
        detVC.DTDate = timeDate;
        detVC.DTtext = tweetText;
        
    }
    else if ([segue.identifier isEqualToString:@"toProfile"])
        
    {
        
        description = [userDictionary valueForKey:@"description"];
        name = [userDictionary valueForKeyPath:@"name"];
        followers = [userDictionary valueForKey:@"followers_count"];
        following = [userDictionary valueForKey:@"friends_count"];
        
        ProfileViewController *proVC = segue.destinationViewController;
        NSString *followersString = [followers stringValue];
        NSString *followingString = [following stringValue];
        proVC.PROname = name;
        proVC.PROdesc = description;
        proVC.PROFollow = following;
        proVC.PROfollowing = followers;
    }
    
    
    
}







@end
