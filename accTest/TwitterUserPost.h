//
//  TwitterUserPost.h
//  accTest
//
//  Created by Matthew Darke on 6/3/14.
//  Copyright (c) 2014 Matthew Darke. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Accounts/Accounts.h>
#import <Social/Social.h>
@interface TwitterUserPost : NSObject
{
        
    
}
@property (nonatomic, strong)NSString *timeDate;
@property (nonatomic, strong)NSString *tweetText;
@property (nonatomic, strong)UIImage *userIcon;
@property (nonatomic, strong)NSString *name;
@property (nonatomic,strong)NSString *followers;
@property (nonatomic,strong)NSString *following;
@end
