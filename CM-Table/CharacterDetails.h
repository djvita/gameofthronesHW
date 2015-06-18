//
//  CharacterDetails.h
//  CM-Table
//
//  Created by Walter Gonzalez Domenzain on 13/06/15.
//  Copyright (c) 2015 Smartplace. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CharacterDetails : UIViewController

//Images
@property (strong, nonatomic) IBOutlet UIImageView *imgUser;
//Labels
@property (strong, nonatomic) IBOutlet UILabel *lblName;
@property (strong, nonatomic) IBOutlet UILabel *lblDescription;
//Actions
- (IBAction)btnBackPressed:(id)sender;

@end
