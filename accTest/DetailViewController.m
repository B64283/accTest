//
//  DetailViewController.m
//  accTest
//
//  Created by Matthew Darke on 6/4/14.
//  Copyright (c) 2014 Matthew Darke. All rights reserved.
//

#import "DetailViewController.h"
#import "TwitterUserPost.h"
#import "ViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    
[super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    DTDateLable.text = self.currentTweet.timeDate;
    DTtextLabel.text = self.currentTweet.tweetText;
    DTUserName.text = self.currentTweet.name;
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
