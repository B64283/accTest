//
//  ViewController.h
//  accTest
//
//  Created by Matthew Darke on 6/2/14.
//  Copyright (c) 2014 Matthew Darke. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    NSArray *twitterFeed;
    NSData *Image;
    IBOutlet UITableView *MyTableView;
    NSDictionary *tweet;
    NSString *postString;
    NSString *NameString;
    NSString *dateString;
    NSString *UserString;
    NSString *detailString;
    NSString *detailPost;
    NSString *followingString;
    NSString *followersString;
    NSString *twitterpost;
    NSString *twitterFullName;
    NSString *twitterUserName;
    NSString *twitterDetail;
    NSString *twitterFollow;
    NSString *twitterFollowing;
    NSString *twitterDateTime;
    UIImage *UserIconPict;
    
    UIAlertView *alert;
    UIActivityIndicatorView *indicate;
    
    
    
    
    
    
    NSString *tweetText;
    NSString *timeDate;
    UIImage *userIcon;
    
    NSString *name;
    
    NSString *description;
    NSData *image;


}
//-(IBAction)Reload:(id)sender;

-(IBAction)onClick:(id)sender;
-(IBAction)profile:(id)sender;
-(IBAction)Refresh:(id)sender;


@end
