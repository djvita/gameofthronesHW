//
//  AddCharacter.h
//  GameOfThrones
//
//  Created by Elias Vltaliano Vidaurre Davila on 6/18/15.
//  Copyright (c) 2015 Smartplace. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddCharacter : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate >

@property (strong, nonatomic) IBOutlet UITextField *txtFName;
@property (strong, nonatomic) IBOutlet UITextField *txtFAlias;
@property (strong, nonatomic) IBOutlet UITextField *txtFAge;
@property (strong, nonatomic) IBOutlet UITextView *txtVDesc;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;



//hopefully temporary
@property (strong, nonatomic) IBOutlet UILabel *labelName;
@property (strong, nonatomic) IBOutlet UILabel *labelAlias;
@property (strong, nonatomic) IBOutlet UILabel *labelAge;
@property (strong, nonatomic) IBOutlet UILabel *lablDesc;



- (IBAction)btnAddImagePressed:(id)sender;

- (IBAction)btnSavePressed:(id)sender;
- (IBAction)btnBackPressed:(id)sender;
- (IBAction)btnSetPressed:(id)sender;

@end