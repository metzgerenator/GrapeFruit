//
//  SuccessViewController.m
//  GrapeFruit
//
//  Created by Michael Metzger  on 1/9/16.
//  Copyright © 2016 Mike. All rights reserved.
//

#import "SuccessViewController.h"
#import <Parse/Parse.h>


@interface SuccessViewController ()

@end

@implementation SuccessViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)deleteAccount:(id)sender {
    
    [[PFUser currentUser] deleteInBackground];  
    
    
    
}
@end
