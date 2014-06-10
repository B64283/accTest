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
    IBOutlet UILabel *firstLabel;
    IBOutlet UILabel *secondLabel;
    IBOutlet UIImageView *cellIconImage;
    
        
    
}

@property (nonatomic, strong)NSString *timeDate;
@property (nonatomic, strong)NSString *tweetText;
@property (nonatomic, strong)UIImage *userIcon;

-(void)refreshCell;
@end
