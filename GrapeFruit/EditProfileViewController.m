//
//  EditProfileViewController.m
//  GrapeFruit
//
//  Created by Aileen Taboy on 1/10/16.
//  Copyright © 2016 Mike. All rights reserved.
//

#import "EditProfileViewController.h"
#import <Parse/Parse.h>


@interface EditProfileViewController ()


@property (nonatomic, weak)NSString *fullName;
@property (nonatomic, weak)NSString *firstName;
@property (nonatomic, weak)NSString *LastName;
@property (nonatomic, weak)NSString *userName;
@property (nonatomic, weak)NSString *birthDate;

@end

@implementation EditProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    PFObject *userData = [PFUser currentUser];
    
    NSLog(@"user data is %@", userData); 
    
    
}


-(void)viewDidAppear:(BOOL)animated {
    
    
    
    
    
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

- (IBAction)editPhotoButton:(id)sender {
}

- (IBAction)saveButton:(id)sender {
}
@end
