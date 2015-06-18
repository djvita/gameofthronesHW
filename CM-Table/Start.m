//
//  ViewController.m
//  CM-Table
//
//  Created by Walter Gonzalez Domenzain on 13/06/15.
//  Copyright (c) 2015 Smartplace. All rights reserved.
//

#import "Start.h"
#import "cellSimpsons.h"
#import "CharacterDetails.h"
#import "AddCharacter.h"
#import "Declarations.h"

@interface Start ()

@end

@implementation Start
/**********************************************************************************************/
#pragma mark - Initialization methods
/**********************************************************************************************/
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initController];
    //background image
    UIImage *backgroundImage = [UIImage imageNamed:@"wallpaper.jpg"];
    UIImageView *backgroundImageView=[[UIImageView alloc]initWithFrame:self.view.frame];
    backgroundImageView.image=backgroundImage;
    [self.view insertSubview:backgroundImageView atIndex:0];
}
//-------------------------------------------------------------------------------
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated // new
{
    NSLog(@"viewDidAppear");
    [super viewDidAppear:animated];
    
    [self.tabla reloadData]; // <------------- Prettier way to do this?
    //[self.tabla refreshRows];

}
//-------------------------------------------------------------------------------
-(void)initController {
    //Initialize arrays
    maNames         = [[NSMutableArray alloc] initWithObjects:
                       @"Daenerys Targaryen",
                       @"Jon Snow",
                       @"Tyrion Lannister",
                       @"Joffrey Baratheon",
                       @"Khal Drogo",
                       nil];
    maAges          = [[NSMutableArray alloc] initWithObjects:
                       @"17",
                       @"18",
                       @"35",
                       @"14",
                       @"25",
                       nil];
    maImgs          = [[NSMutableArray alloc] initWithObjects:
                       @"dany.jpg",
                       @"jonsnow.jpeg",
                       @"tyrion.png",
                       @"joffrey.png",
                       @"drogo.png",
                       nil];
    maAliases       = [[NSMutableArray alloc] initWithObjects:
                       @"Dany",
                       @"You know Nothing",
                       @"Small",
                       @"Puppet King",
                       @"Drogo",
                       nil];
    maDescriptions = [[NSMutableArray alloc] initWithObjects:
                      @"Daenerys is the only daughter and youngest child of King Aerys II Targaryen, the Mad King, and his sister-wife Rhaella.",
                      @"Jon is the bastard son of Lord Eddard Stark of Winterfell, the head of House Stark and Lord Paramount of the North.", @"He is a dwarf, causing him probems and persecution. His size has led him to being referred to derisively by various names, such as the Imp and The Halfman. This is mitigated by his intellect and his family's wealth and power. ",
                      @"Joffrey is believed to be the oldest son and heir of King Robert Baratheon and Queen Cersei Lannister, both of whom entered into a political marriage alliance after Robert took the throne by force from the Mad King Aerys II Targaryen. In reality, his father is Jaime Lannister, the queen's brother and the Lord Commander of the Kingsguard.",
                      @"Drogo is a powerful warlord and feared warrior. He marries Daenerys Targaryen and subsequently grows to love her. He promises to retake the Seven Kingdoms for her after she survives an assassination attempt. ",
                      nil];
}
/**********************************************************************************************/
#pragma mark - Table source and delegate methods
/**********************************************************************************************/
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
//-------------------------------------------------------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return maNames.count;
}
//-------------------------------------------------------------------------------
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 64;
}
//-------------------------------------------------------------------------------
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //Initialize cells
    cellSimpsons *cell = (cellSimpsons *)[tableView dequeueReusableCellWithIdentifier:@"cellSimpsons"];
    
    if (cell == nil) {
        [tableView registerNib:[UINib nibWithNibName:@"cellSimpsons" bundle:nil] forCellReuseIdentifier:@"cellSimpsons"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"cellSimpsons"];
    }
    //Fill cell with info from arrays
    cell.lblName.text   = maNames[indexPath.row];
    cell.lblAlias.text  = maAliases[indexPath.row];
    cell.lblAge.text    = maAges[indexPath.row];
    cell.imgUser.image  = [UIImage imageNamed:maImgs[indexPath.row]];
    cell.clipsToBounds  = YES;
    [cell.contentView.superview setClipsToBounds:YES];
    return cell;
    return cell;
}
//-------------------------------------------------------------------------------
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    miCharacterIndex = (int)indexPath.row;
    CharacterDetails *viewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"CharacterDetails"];
    
    [self presentViewController:viewController animated:YES completion:nil];

}


- (IBAction)btnStartPressed:(id)sender {
    AddCharacter *addChar= [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"AddCharacter"];
    
    [self presentViewController:addChar animated:YES completion:nil];

}
@end
