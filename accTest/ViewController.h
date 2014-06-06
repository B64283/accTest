//
//  ViewController.h
//  accTest
//
//  Created by Matthew Darke on 6/2/14.
//  Copyright (c) 2014 Matthew Darke. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    
    // *twitterFeed;
    
    NSMutableArray *twitterFeed;
    IBOutlet UITableView *MyTableView;
    
}
-(IBAction)Reload:(id)sender;

-(IBAction)onClick:(id)sender;
-(IBAction)profile:(id)sender;
-(IBAction)refresh:(id)sender;

@end
