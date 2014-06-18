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
            //set UIalertView
            alert = [[UIAlertView alloc]initWithTitle:@"fetching Tweets" message:nil delegate:nil cancelButtonTitle:nil otherButtonTitles:nil, nil];
            
            //set indicator
            indicate = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
            indicate.hidesWhenStopped = YES;
            indicate.center = CGPointMake(390, 590);
            [self.view addSubview:indicate];
            [indicate startAnimating];
            [alert show];
            
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
                                        //codeBlock tells to send data to the tabelView faster
                                        dispatch_async(dispatch_get_main_queue(),^{
                                            
                                            //reloads data to table view
                                            [MyTableView reloadData];
                                            
                                            
                                        });
                                        
                                    }
                                }
                            }];
                        }
                        
                        
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



- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCustomCell"];
    if (cell != nil)
    {
        NSDictionary *tweetDictionary = [twitterFeed objectAtIndex:indexPath.row];
        
        cell.postText = [tweetDictionary valueForKey:@"text"];
        
        NSDictionary *userDictionary = [tweetDictionary objectForKey:@"user"];
        if (userDictionary != nil)
        {
        Image = [[NSData alloc]initWithContentsOfURL:[NSURL URLWithString:[userDictionary valueForKey:@"profile_image_url_https"]]];
        
        
            NameString = [NSString stringWithFormat:@"%@", [userDictionary valueForKey:@"name"]];
        
            UserString = [NSString stringWithFormat:@"%@",[userDictionary valueForKey:@"screen_name"]];
            detailString = [NSString stringWithFormat:@"%@", [userDictionary valueForKey:@"description"]];
            followersString = [NSString stringWithFormat:@"%@",[userDictionary valueForKey:@"followers_count"]];
            followingString = [NSString stringWithFormat:@"%@",[userDictionary valueForKey:@"friends_count"]];
            
            NSDateFormatter *format = [[NSDateFormatter alloc]init];
            [format setDateFormat:@"eee MMM dd HH:mm:ss ZZZZ yyyy"];
            
            NSDate *date = [format dateFromString:[tweetDictionary valueForKey:@"created_at"]];
            [format setDateFormat:@"eee, MMM dd yyyy h:mm a"];
            
            dateString = [format stringFromDate:date];
            
            cell.IconPict = [[UIImage alloc]initWithData:Image];
            cell.fullNameText = NameString;
            cell.userNameText = UserString;
            cell.DateTimeText = dateString;
           [alert dismissWithClickedButtonIndex:0 animated:YES]; 
            
        }
        
        [cell refreshCell];
        [indicate stopAnimating];
        return cell;
    
    
    }
    return nil;
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
    
    [self performSegueWithIdentifier: @"toProfile" sender:self];
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


-(NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *tweetDictionary = [twitterFeed objectAtIndex:indexPath.row];
    
    
    NSDateFormatter *format = [[NSDateFormatter alloc]init];
    [format setDateFormat:@"eee MMM dd HH:mm:ss ZZZZ yyyy"];
    
    NSDate *date = [format dateFromString:[tweetDictionary valueForKey:@"created_at"]];
    [format setDateFormat:@"eee, MMM dd yyyy h:mm a"];
    
    dateString = [format stringFromDate:date];
    
  
    detailPost = [tweetDictionary valueForKey:@"text"];
    dateString = [tweetDictionary valueForKey:@"created_at"];
    
    [self performSegueWithIdentifier:@"ToDetailViewController" sender:self];

    return nil;
}






//split segue sends info to the different views
// take the info and turn it into a string and put the string into the lable
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
   if ([segue.identifier isEqualToString:@"ToDetailViewController"])
   {
     
       DetailViewController *destView = segue.destinationViewController;
      
       destView.twitterPost = detailPost;
       destView.twitterIconPict = [[UIImage alloc]initWithData:Image];
       destView.twitterFullName = NameString;
       destView.twitterUserName = UserString;
       destView.twitterDateTime = dateString;
       
       
}
    else if ([segue.identifier isEqualToString:@"toProfile"])
        
    {
        ProfileViewController *ProfView = segue.destinationViewController;
        
        ProfView.twitterIconPict = [[UIImage alloc]initWithData:Image];
        ProfView.twitterFullName = NameString;
        ProfView.twitterUserName = UserString;
        ProfView.twitterDetail = detailString;
        ProfView.twitterFollowing = followersString;
        ProfView.twitterFollow = followingString;
        
    }
    
    
    
}







@end
