//
//  ProfileViewController.h
//  accTest
//
//  Created by Matthew Darke on 6/4/14.
//  Copyright (c) 2014 Matthew Darke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TwitterUserPost.h"
@interface ProfileViewController : UIViewController
{
    NSDictionary *tweet;    NSArray *twitterFeed;
  IBOutlet UILabel *profileUserNameLable;
 IBOutlet    UILabel *profileFollowingLable;
   IBOutlet  UILabel *profileFollowedLable;
   IBOutlet  UILabel *profileDetailsLable;
    
    }
//made up strings
@property(nonatomic, strong) NSString *PROname;
@property(nonatomic, strong) NSNumber *PROFollow;
@property(nonatomic, strong) NSString *PROdesc;
@property(nonatomic, strong) NSNumber *PROfollowing;


@end
