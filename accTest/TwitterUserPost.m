//
//  TwitterUserPost.m
//  accTest
//
//  Created by Matthew Darke on 6/3/14.
//  Copyright (c) 2014 Matthew Darke. All rights reserved.
//

#import "TwitterUserPost.h"

@implementation TwitterUserPost




@synthesize timeDate, tweetText, userIcon;




-(id)initWithPostInfo:(NSString*)timeDateInfo userIconInfo:(UIImage*)userIconInfo text:(NSString*)text
{
    if ((self = [super init]))
    {
        
    userIcon = [userIcon copy];
    
    timeDateInfo = [timeDate copy];
    
    text = [text copy];
    
    }
    return self;
}




@end
