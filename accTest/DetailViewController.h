//
//  DetailViewController.h
//  accTest
//
//  Created by Matthew Darke on 6/4/14.
//  Copyright (c) 2014 Matthew Darke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TwitterUserPost.h"
@interface DetailViewController : UIViewController
{
    
    
    IBOutlet UILabel *DTDateLable;
    IBOutlet UILabel *DTtextLabel;
    IBOutlet UILabel *DTUserName;
    
    
}

@property(nonatomic, strong)TwitterUserPost *currentTweet;









@end
