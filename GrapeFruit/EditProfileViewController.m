//
//  EditProfileViewController.m
//  GrapeFruit
//
//  Created by Aileen Taboy on 1/10/16.
//  Copyright © 2016 Mike. All rights reserved.
//

#import "EditProfileViewController.h"
#import "ProfilePhotoViewController.h"
#import <Parse/Parse.h>


@interface EditProfileViewController ()<UIPopoverPresentationControllerDelegate>



@property (nonatomic, weak)NSString *fullName;
@property (nonatomic, weak)NSString *firstName;
@property (nonatomic, weak)NSString *LastName;
@property (nonatomic, weak)NSString *userName;
@property (nonatomic, weak)NSString *birthDate;
@property (nonatomic, weak)NSString *aboutMe;

@property (nonatomic, strong) PFObject *userData;

@property(nonatomic,strong)ProfilePhotoViewController *popOVer;


@end

@implementation EditProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self loadUserData];

    
    
    
}


-(void)viewDidAppear:(BOOL)animated {
    
    
    NSLog(@"loading");
    
    
}


#pragma Mark - present photo popover

- (IBAction)photoButton:(id)sender {
    

    [self performSegueWithIdentifier:@"popOver" sender:self];
    
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"popOver"]) {
        ProfilePhotoViewController *vc = segue.destinationViewController;
        vc.popoverPresentationController.sourceView = sender;
        
        vc.popoverPresentationController.delegate = self;
        
        
    }
    
}


-(UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller {
    
    return UIModalPresentationNone;
}


#pragma mark - load user data 

-(void)loadUserData {
    
    
    //Create PFObject for current user
    self.userData = [PFUser currentUser];
    
    //organize data into strings
    self.firstName = [self.userData objectForKey:@"FirstName"];
    self.LastName = [self.userData objectForKey:@"LastName"];
    self.userName = [self.userData objectForKey:@"username"];
    self.birthDate = [self.userData objectForKey:@"Birthday"];
    self.aboutMe = [self.userData objectForKey:@"AboutMe"];
    
    //set the labels
    self.fullNameLabel.text = [NSString stringWithFormat:@"%@ %@", self.firstName, self.LastName];
    self.firstNameLabel.text = self.firstName;
    self.lastNameLabel.text = self.LastName;
    self.DobLabel.text = self.birthDate;
    self.userNameLabel.text = self.userName;
    
    
    //set about me label
    
    self.aboutMeLabel.text = self.aboutMe;
    
    
    
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


- (IBAction)saveButton:(id)sender {
    
    
    
    
    //Set object for key
    
    [self.userData setObject:self.firstNameLabel.text forKey:@"FirstName"];
    
    [self.userData setObject:self.lastNameLabel.text forKey:@"LastName"];
    
    [self.userData setObject:self.DobLabel.text forKey:@"Birthday"];
    [self.userData setObject:self.userNameLabel.text forKey:@"username"];
    
    [self.userData setObject:self.aboutMeLabel.text forKey:@"AboutMe"];
    
    [self.userData saveInBackground];
    
    
    [self.navigationController popViewControllerAnimated:YES];  
    
    
    
}
@end
