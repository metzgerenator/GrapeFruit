//
//  SignUpViewController.m
//  GrapeFruit
//
//  Created by Aileen Taboy on 1/7/16.
//  Copyright © 2016 Mike. All rights reserved.
//

#import "SignUpViewController.h"
#import <Parse/Parse.h>

@interface SignUpViewController () {
    BOOL passWordGood;
    
}

@end

@implementation SignUpViewController

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



- (IBAction)deleteUser:(id)sender {
    
    [[PFUser currentUser]delete];
    
}




- (IBAction)signup:(id)sender {
    
    // white space methods trims any excess white space
    NSString *username = [self.userNameTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    NSString *email = [self.emailTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    // make sure passwords match
    
    NSString *passWord  = [self.passWordTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    NSString *passWordMatch = [self.passWordConfirmTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if (![passWord isEqualToString:passWordMatch]) {
        [self alertMessage:@"oops!" message:@"Make sure your passwords match"];
        
        self.passWordTextField.text = @" ";
        
        self.passWordConfirmTextField.text = @" ";
        
        passWordGood = NO;
        
    }else {
        passWordGood = YES;
    }
    
    

    // Other fields for user object
    NSString *firstName =[self.firstNameTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    NSString *LastName =[self.lastNameTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    NSString *birthDate = [self.birthDateTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    NSString *phoneNumber = [self.phoneNumberTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    
    
    

    // Only create new user if the password is good
    if (passWordGood == YES) {
      
    
    if ([username length] ==0 || [passWord length] == 0 || [email length] == 0) {
        
        
       [self alertMessage:@"Oh Boy" message:@"Make sure you fill out all of the fields"];
        
    } else {
        PFUser *newUser = [PFUser user];
        newUser.username = username;
        newUser.password = passWord;
        newUser.email = email;
       
        
        
        
        [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
            if (error) {
                [self alertMessage:@"Oh Boy" message:[error.userInfo objectForKey:@"error"]];
                
            } else if (succeeded) {
                
                PFObject *newObject  = [PFUser currentUser];
                
                [newObject setObject:firstName forKey:@"FirstName"];
                [newObject setObject:LastName forKey:@"LastName"];
                [newObject setObject:birthDate forKey:@"Birthday"];
                [newObject  setObject:phoneNumber forKey:@"PhoneNumber"];
                
                [newObject saveInBackground];
                
                [self.navigationController popToRootViewControllerAnimated:YES];
                
            
            }
        }];
        
    }
    
    }
    
}


#pragma mark - alert message
-(void)alertMessage: (NSString *)title message:(NSString *)message   {
    
    
    UIAlertController *alertView = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    
    [alertView addAction:defaultAction];
    [self presentViewController:alertView animated:YES completion:nil];
    
    
}


@end
