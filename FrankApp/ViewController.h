//
//  ViewController.h
//  FrankApp
//
//  Created by Henrik Frank on 2020-01-09.
//  Copyright © 2020 Henrik Frank. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *frankLabel;
@property (weak, nonatomic) IBOutlet UILabel *darkModeLabel;
@property (weak, nonatomic) IBOutlet UITextView *descriptionText;

- (IBAction)darkModeSwitch:(id)sender;

@end

