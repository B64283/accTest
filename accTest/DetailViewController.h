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
    
    NSDictionary *tweet;
        
}


@property(nonatomic, strong) NSString *DTDate;
@property(nonatomic, strong) NSString *DTtext;
@property(nonatomic, strong) NSString *DTUserNm;







@end
