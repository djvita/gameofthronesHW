//
//  AddCharacter.m
//  GameOfThrones
//
//  Created by Elias Vltaliano Vidaurre Davila on 6/18/15.
//  Copyright (c) 2015 Smartplace. All rights reserved.
//

#import "AddCharacter.h"
#import "Declarations.h"
#import <MobileCoreServices/MobileCoreServices.h>


@interface AddCharacter ()

@end

@implementation AddCharacter

- (void)viewDidLoad {
    [super viewDidLoad];
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                              message:@"Device has no camera"
                                                             delegate:nil
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles: nil];
        
        [myAlertView show];
        
    }
    //keyboard dismiss
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
    //background image
    UIImage *backgroundImage = [UIImage imageNamed:@"wallpaper.jpg"];
    UIImageView *backgroundImageView=[[UIImageView alloc]initWithFrame:self.view.frame];
    backgroundImageView.image=backgroundImage;
    [self.view insertSubview:backgroundImageView atIndex:0];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//dismiss keyboard
-(void)dismissKeyboard {
    [_txtFName resignFirstResponder];
    [_txtFAlias resignFirstResponder];
    [_txtFAge resignFirstResponder];
    [_txtVDesc resignFirstResponder];
}

//add image
- (IBAction)btnAddImagePressed:(id)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:NULL];
    
    
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    self.imageView.image = chosenImage;
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

//text view delegates
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:

(NSRange)range replacementText:(NSString *)text{
    if ([text isEqualToString:@"\n"]) {
        
        [textView resignFirstResponder];
        
    }
    
    return YES;
    
}

-(void)textViewDidBeginEditing:(UITextView *)textView{
    
    NSLog(@"Did begin editing");
    
    _txtVDesc = textView;
}

-(void)textViewDidEndEditing:(UITextView *)textView{
    
    NSLog(@"Did End editing");
    
}

-(BOOL)textViewShouldEndEditing:(UITextView *)textView{
    
    [textView resignFirstResponder];
    
    return YES;
    
}



- (IBAction)btnSavePressed:(id)sender {
    
    
    [_txtFName resignFirstResponder];
    [_txtFAlias resignFirstResponder];
    [_txtFAge resignFirstResponder];
    [_txtVDesc resignFirstResponder];
    //extern variables
    sName   = _txtFName.text;
    sAlias  = _txtFAlias.text;
    sAge    = _txtFAge.text;
    sDesc   = _txtVDesc.text;
    if (_imageView.image != nil){
        [maImgs addObject:_imageView.image];
    }
    [maNames addObject:sName];
    [maAliases addObject:sAlias];
    [maAges addObject:sAge];
    [maDescriptions addObject:sDesc];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)btnBackPressed:(id)sender {
     [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)btnSetPressed:(id)sender {
    [_txtFName resignFirstResponder];
    [_txtFAlias resignFirstResponder];
    [_txtFAge resignFirstResponder];
    [_txtVDesc resignFirstResponder];
    _labelName.text   = _txtFName.text;
    _labelAlias.text  = _txtFAlias.text;
    _labelAge.text    = _txtFAge.text;
    _lablDesc.text    = _txtVDesc.text;
}
@end
