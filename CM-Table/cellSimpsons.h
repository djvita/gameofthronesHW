//
//  cellSimpsons.h
//  CM-Table
//
//  Created by Walter Gonzalez Domenzain on 13/06/15.
//  Copyright (c) 2015 Smartplace. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface cellSimpsons : UITableViewCell

//Images
@property (strong, nonatomic) IBOutlet UIImageView *imgUser;

//Labels
@property (strong, nonatomic) IBOutlet UILabel *lblName;
@property (strong, nonatomic) IBOutlet UILabel *lblAge;
@property (strong, nonatomic) IBOutlet UILabel *lblAlias;

@end
