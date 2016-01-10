//
//  ProfileViewController.m
//  GrapeFruit
//
//  Created by Aileen Taboy on 1/9/16.
//  Copyright © 2016 Mike. All rights reserved.
//

#import "ProfileViewController.h"
#import <Parse/Parse.h>

@interface ProfileViewController ()

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
  
    
    
}



-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    //Check for logged in user
    PFUser *currentUser = [PFUser currentUser];
    
    if (currentUser) {
        
        NSLog(@"The Current User is %@",currentUser.username);
        
    }else {
        
        
        
        
        [self performSegueWithIdentifier:@"signUp" sender:self];
        
        
        
    }
    
    
    
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

#pragma mark - unwind segue
- (IBAction)unwindToMainMenu:(UIStoryboardSegue*)sender
{
}

- (IBAction)deleteButton:(id)sender {
    
    [[PFUser currentUser] deleteInBackground];
    

    
}

- (IBAction)logOutButton:(id)sender {
    
    [PFUser logOutInBackground];
    
    [self performSegueWithIdentifier:@"signUp" sender:self];
    
    
}
@end
