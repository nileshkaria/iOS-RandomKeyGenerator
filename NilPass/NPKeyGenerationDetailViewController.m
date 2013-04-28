//
//  NPKeyGenerationDetailViewController.m
//  NilPass
//
//  Created by 0 to ∞ on Apr/27/13.
//  Copyright (c) 2013 0 to ∞. All rights reserved.
//

#import "NPKeyGenerationDetailViewController.h"

@interface NPKeyGenerationDetailViewController ()
@property (nonatomic, weak) IBOutlet UILabel *displayedKeyLabel;
@end

@implementation NPKeyGenerationDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view.
    self.displayedKeyLabel.text = self.displayedKey;
}

- (IBAction)dismissButtonPressed:(UIButton *)sender
{
    [self.delegate userDidDismissDetailViewController:self];
}

/*
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
*/

@end
