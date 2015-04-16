//
//  ViewController.h
//  SNS
//
//  Created by Mac on 4/9/15.
//  Copyright (c) 2015 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *fetchDatalabel;
- (IBAction)doURLFetch:(id)sender;
- (IBAction)doFetchloop:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *fetchButton;
@property (weak, nonatomic) IBOutlet UIButton *loopButton;

@end

