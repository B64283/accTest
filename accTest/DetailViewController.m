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

@property(nonatomic, weak)IBOutlet UILabel *DTDateLable;
@property(nonatomic, weak)IBOutlet UILabel *DTUserName;
@property(nonatomic, weak)IBOutlet UILabel *DTtextLabel;



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
    //label then string
    self.DTDateLable.text = self.DTDate;
    self.DTtextLabel.text = self.DTtext;
    self.DTUserName.text = self.DTUserNm;
    

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
