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
    IBOutlet UILabel *profileUserNameLable;
    
    IBOutlet UILabel *profileFollowingLable;
    IBOutlet UILabel *profileFollowedLable;
    IBOutlet UILabel *profileDetailsLable;
    
    
    
    
}

@property (nonatomic,strong)TwitterUserPost *currentProfile;


@end
