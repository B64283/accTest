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
    IBOutlet UILabel *ProfFullName;
    IBOutlet UILabel *ProfUserName;
    IBOutlet UILabel *ProfDetail;
    IBOutlet UILabel *ProfFollow;
    IBOutlet UILabel *ProfFollowing;
    IBOutlet UIImageView *ProfUserIcon;
    
}
@property(nonatomic, strong) NSString *twitterFullName;
@property(nonatomic, strong) NSString *twitterUserName;
@property(nonatomic, strong) NSString *twitterDetail;
@property(nonatomic, strong) NSString *twitterFollow;
@property(nonatomic, strong) UIImage *twitterIconPict;
@property(nonatomic, strong) NSString *twitterFollowing;
@end
