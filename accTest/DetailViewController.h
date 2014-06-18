//
//  DetailViewController.h
//  accTest
//
//  Created by Matthew Darke on 6/4/14.
//  Copyright (c) 2014 Matthew Darke. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "TwitterUserPost.h"
@interface DetailViewController : UIViewController
{
    IBOutlet UILabel *DeetFullName;
    IBOutlet UILabel *DeetUserName;
    IBOutlet UILabel *DeetPost;
    IBOutlet UILabel *DeetDateTime;
    IBOutlet UIImageView *DeetUserIcon;
}


@property(nonatomic, strong) NSString *twitterFullName;
@property(nonatomic, strong) NSString *twitterUserName;
@property(nonatomic, strong) NSString *twitterPost;
@property(nonatomic, strong) NSString *twitterDateTime;
@property(nonatomic, strong) UIImage *twitterIconPict;






@end
