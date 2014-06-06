//
//  CustomCell.h
//  accTest
//
//  Created by Matthew Darke on 6/4/14.
//  Copyright (c) 2014 Matthew Darke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <Accounts/Accounts.h>
#import <Social/Social.h>
@interface CustomCell : UITableViewCell

{
    IBOutlet UILabel *firstLabel;
    IBOutlet UILabel *secondLabel;
    IBOutlet UIImageView *cellIconImage;
    
        
    
}




-(void)refreshCellWithInfo:(NSString*)firstString secondString:(NSString*)secondString cellImage:(UIImage*)cellImage;

@end
