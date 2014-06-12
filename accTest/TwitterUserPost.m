//
//  TwitterUserPost.m
//  accTest
//
//  Created by Matthew Darke on 6/3/14.
//  Copyright (c) 2014 Matthew Darke. All rights reserved.
//

#import "TwitterUserPost.h"

@implementation TwitterUserPost
@synthesize timeDate, tweetText, userIcon, name, followers,following;



-(id)initWithPostInfo:(NSString*)UsertimeDate text:(NSString*)text icon:(UIImage*)icon userFollowers:(NSString*)userFollowers userFollowing:(NSString*)userFollowing userName:(NSString*)userName


{
   if((self = [super init]))
   {
       
              
   
   }
    
    return self;
    
}




@end
