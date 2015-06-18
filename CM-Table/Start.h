//
//  ViewController.h
//  CM-Table
//
//  Created by Walter Gonzalez Domenzain on 13/06/15.
//  Copyright (c) 2015 Smartplace. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Start : UIViewController<UITableViewDataSource, UITableViewDelegate>

- (IBAction)btnStartPressed:(id)sender;

@property (strong, nonatomic) IBOutlet UITableView *tabla;
@end

