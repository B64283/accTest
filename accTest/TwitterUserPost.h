//
//  TwitterUserPost.h
//  accTest
//
//  Created by Matthew Darke on 6/3/14.
//  Copyright (c) 2014 Matthew Darke. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TwitterUserPost : NSObject
{
    NSString *timeDate;
    NSString *tweetText;
    
    UIImage *userIcon;
    
    
}
@property (nonatomic, readonly)NSString *timeDate;
@property (nonatomic, readonly)NSString *tweetText;

@property (nonatomic, readonly)UIImage *userIcon;

-(id)initWithPostInfo:(NSString*)timeDateInfo userIconInfo:(UIImage*)userIconInfo text:(NSString*)text;


@end
