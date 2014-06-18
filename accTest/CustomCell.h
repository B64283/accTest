//
//  CustomCell.h
//  accTest
//
//  Created by Matthew Darke on 6/4/14.
//  Copyright (c) 2014 Matthew Darke. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import <Foundation/Foundation.h>
//#import <Accounts/Accounts.h>
//#import <Social/Social.h>

@interface CustomCell : UITableViewCell

{
    IBOutlet UILabel *cellFullName;
    IBOutlet UILabel *cellUserName;
    IBOutlet UILabel *cellPost;
    IBOutlet UILabel *cellDateTime;
    IBOutlet UIImageView *cellUserIcon;
    
}

-(void)refreshCell;

@property(nonatomic, strong) NSString *fullNameText;
@property(nonatomic, strong) NSString *UserNameText;
@property(nonatomic, strong) NSString *postText;
@property(nonatomic, strong) NSString *DateTimeText;
@property(nonatomic, strong) UIImage *IconPict;

@end
