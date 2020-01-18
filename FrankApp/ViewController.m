//
//  ViewController.m
//  FrankApp
//
//  Created by Henrik Frank on 2020-01-09.
//  Copyright © 2020 Henrik Frank. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITabBarControllerDelegate>

@end

@implementation ViewController

NSDictionary *colors;

NSUserDefaults *settings;
NSInteger darkModeSettings;

UITabBarController *tabBarController;
UITabBar *tabBar;

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self setColorValues];
    
    tabBarController = self.tabBarController;
    tabBar = tabBarController.tabBar;
    
    settings = [NSUserDefaults standardUserDefaults];
    
    [self loadDarkModeSettings];
}
- (void)viewWillAppear:(BOOL)animated {
    
    [self loadDarkModeSettings];
}
- (UIStatusBarStyle)preferredStatusBarStyle {
    
    if(self.view.backgroundColor == colors[@"darkModeBackground"]) {
        return UIStatusBarStyleLightContent;
    }
    
    return UIStatusBarStyleDarkContent;
}
- (IBAction)darkModeSwitch:(id)sender {
    
    [self toggleDarkMode];
}
- (void)toggleDarkMode {
    if(self.view.backgroundColor == colors[@"darkModeBackground"]) {
        
        [self.darkModeSwitch setOn:NO];
        
        [self setStandardColors];
        
        [settings setInteger:0 forKey:@"darkModeSettings"];
        
        [settings synchronize];
        
    } else {
        
        [self.darkModeSwitch setOn:YES];
        
        [self setDarkModeColors];
        
        [settings setInteger:1 forKey:@"darkModeSettings"];
        
        [settings synchronize];
        
    }
    
    [self setNeedsStatusBarAppearanceUpdate];
}
- (void)loadDarkModeSettings {
    
    darkModeSettings = [settings integerForKey:@"darkModeSettings"];
    
    if(darkModeSettings == 1) {
        
        [self.darkModeSwitch setOn:YES];
        
        [self setDarkModeColors];
        
    } else {
        
        [self.darkModeSwitch setOn:NO];
        
        [self setStandardColors];
        
    }
    
    [self setNeedsStatusBarAppearanceUpdate];
    
}
- (void)setStandardColors {
    
    self.view.backgroundColor = colors[@"standardBackground"];
    self.frankLabel.textColor = colors[@"standardText"];
    self.darkModeLabel.textColor = colors[@"standardText"];
    self.descriptionText.textColor = colors[@"standardText"];
    self.descriptionText.backgroundColor = colors[@"standardBackground"];
    self.resumeText.textColor = colors[@"standardText"];
    self.resumeText.backgroundColor = colors[@"standardBackground"];
    self.resumeText.tintColor = colors[@"standardLink"];
    
    tabBar.barTintColor = colors[@"standardTabBar"];
    tabBar.tintColor = colors[@"standardTabBarItem"];
    
}
- (void)setDarkModeColors {
    
    self.view.backgroundColor = colors[@"darkModeBackground"];
    self.frankLabel.textColor = colors[@"darkModeText"];
    self.darkModeLabel.textColor = colors[@"darkModeText"];
    self.descriptionText.textColor = colors[@"darkModeText"];
    self.descriptionText.backgroundColor = colors[@"darkModeBackground"];
    self.resumeText.textColor = colors[@"darkModeText"];
    self.resumeText.backgroundColor = colors[@"darkModeBackground"];
    self.resumeText.tintColor = colors[@"darkModeTabBarItem"];
    
    tabBar.barTintColor = colors[@"darkModeTabBar"];
    tabBar.tintColor = colors[@"darkModeTabBarItem"];
    
}
- (void)setColorValues {
    colors = @{@"standardBackground": [UIColor whiteColor], @"standardText": [UIColor blackColor],
               @"standardTabBar": [UIColor blackColor], @"standardTabBarItem": [UIColor whiteColor],
               @"standardLink": [UIColor blueColor],
               @"darkModeBackground": [UIColor darkGrayColor], @"darkModeText": [UIColor whiteColor],
               @"darkModeTabBar": [UIColor blackColor], @"darkModeTabBarItem": [UIColor systemOrangeColor]
               
    };
}
@end
