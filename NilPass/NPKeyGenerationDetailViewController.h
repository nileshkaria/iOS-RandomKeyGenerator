//
//  NPKeyGenerationDetailViewController.h
//  NilPass
//
//  Created by 0 to ∞ on Apr/27/13.
//  Copyright (c) 2013 0 to ∞. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NPKeyGenerationDetailViewControllerDelegate;

@interface NPKeyGenerationDetailViewController : UIViewController

@property (nonatomic, strong)   NSString * displayedKey;
@property (nonatomic, weak)     id<NPKeyGenerationDetailViewControllerDelegate> delegate;

@end


@protocol NPKeyGenerationDetailViewControllerDelegate <NSObject>

- (void) userDidDismissDetailViewController:(NPKeyGenerationDetailViewController *) detailVC;

@end