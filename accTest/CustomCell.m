//
//  CustomCell.m
//  accTest
//
//  Created by Matthew Darke on 6/4/14.
//  Copyright (c) 2014 Matthew Darke. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell
@synthesize timeDate, tweetText,userIcon;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}





-(void)refreshCell

{
    firstLabel.text = timeDate;
    secondLabel.text = tweetText;
    cellIconImage.image = userIcon;
}
@end
