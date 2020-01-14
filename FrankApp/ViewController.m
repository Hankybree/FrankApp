//
//  ViewController.m
//  FrankApp
//
//  Created by Henrik Frank on 2020-01-09.
//  Copyright © 2020 Henrik Frank. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

UIColor *standardBackgroundColor;
UIColor *darkModeBackgroundColor;
UIColor *standardTextColor;
UIColor *darkModeTextColor;

NSUserDefaults *settings;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setColorValues];
    
    settings = [NSUserDefaults standardUserDefaults];
    
    NSInteger darkModeSettings = [settings integerForKey:@"darkModeSettings"];
    
    if(darkModeSettings == 1) {
        [self.darkModeSwitch setOn:YES];
        [self toggleDarkMode];
    }
}
-(UIStatusBarStyle)preferredStatusBarStyle {
    
    if(self.view.backgroundColor == darkModeBackgroundColor) {
        return UIStatusBarStyleLightContent;
    }
    
    return UIStatusBarStyleDarkContent;
}
- (IBAction)darkModeSwitch:(id)sender {
    [self toggleDarkMode];
}
-(void)toggleDarkMode {
    if(self.view.backgroundColor == darkModeBackgroundColor) {
        
        self.view.backgroundColor = standardBackgroundColor;
        self.frankLabel.textColor = standardTextColor;
        self.darkModeLabel.textColor = standardTextColor;
        self.descriptionText.textColor = standardTextColor;
        self.descriptionText.backgroundColor = standardBackgroundColor;
        
        [settings setInteger:0 forKey:@"darkModeSettings"];
        
        [settings synchronize];
        
        [self setNeedsStatusBarAppearanceUpdate];
        
    } else {
        
        self.view.backgroundColor = darkModeBackgroundColor;
        self.frankLabel.textColor = darkModeTextColor;
        self.darkModeLabel.textColor = darkModeTextColor;
        self.descriptionText.textColor = darkModeTextColor;
        self.descriptionText.backgroundColor = darkModeBackgroundColor;
        
        [settings setInteger:1 forKey:@"darkModeSettings"];
        
        [settings synchronize];
        
        [self setNeedsStatusBarAppearanceUpdate];
        
    }
}
-(void)setColorValues {
    standardBackgroundColor = [UIColor whiteColor];
    darkModeBackgroundColor = [UIColor darkGrayColor];
    standardTextColor = [UIColor blackColor];
    darkModeTextColor = [UIColor whiteColor];
}
@end
