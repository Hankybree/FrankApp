//
//  ViewController.h
//  FrankApp
//
//  Created by Henrik Frank on 2020-01-09.
//  Copyright © 2020 Henrik Frank. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *frankLabel;
@property (weak, nonatomic) IBOutlet UILabel *darkModeLabel;
@property (weak, nonatomic) IBOutlet UITextView *descriptionText;
@property (weak, nonatomic) IBOutlet UISwitch *darkModeSwitch;
@property (weak, nonatomic) IBOutlet UITextView *resumeText;
@property (weak, nonatomic) IBOutlet UIButton *jokeButtonOut;
@property (weak, nonatomic) IBOutlet UILabel *jokeLabel;

- (IBAction)darkModeSwitch:(id)sender;
- (IBAction)generateJokeButton:(id)sender;


@end

