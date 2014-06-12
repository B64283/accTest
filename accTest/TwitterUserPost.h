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
@property (nonatomic, strong)NSString *name;
@property (nonatomic, strong)NSString *timeDate;//
@property (nonatomic, strong)NSString *tweetText;//
@property (nonatomic, strong)UIImage *userIcon;//
//@property (nonatomic, strong)UIImage *userIcon;
@property (nonatomic,strong)NSNumber *followers;//
@property (nonatomic,strong)NSNumber *following;//


-(id)initWithPostInfo:(NSString*)UsertimeDate text:(NSString*)text icon:(UIImage*)icon userFollowers:(NSNumber*)userFollowers userFollowing:(NSNumber*)userFollowing userName:(NSString*)userName;







@end
