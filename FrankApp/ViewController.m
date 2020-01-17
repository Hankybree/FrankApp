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
        
        self.view.backgroundColor = colors[@"standardBackground"];
        self.frankLabel.textColor = colors[@"standardText"];
        self.darkModeLabel.textColor = colors[@"standardText"];
        self.descriptionText.textColor = colors[@"standardText"];
        self.descriptionText.backgroundColor = colors[@"standardBackground"];
        
        tabBar.barTintColor = colors[@"standardTabBar"];
        tabBar.tintColor = colors[@"standardTabBarItem"];
        
        [settings setInteger:0 forKey:@"darkModeSettings"];
        
        [settings synchronize];
        
    } else {
        
        [self.darkModeSwitch setOn:YES];
        
        self.view.backgroundColor = colors[@"darkModeBackground"];
        self.frankLabel.textColor = colors[@"darkModeText"];
        self.darkModeLabel.textColor = colors[@"darkModeText"];
        self.descriptionText.textColor = colors[@"darkModeText"];
        self.descriptionText.backgroundColor = colors[@"darkModeBackground"];
        
        tabBar.barTintColor = colors[@"darkModeTabBar"];
        tabBar.tintColor = colors[@"darkModeTabBarItem"];
        
        [settings setInteger:1 forKey:@"darkModeSettings"];
        
        [settings synchronize];
        
    }
    
    [self setNeedsStatusBarAppearanceUpdate];
}
- (void)loadDarkModeSettings {
    
    darkModeSettings = [settings integerForKey:@"darkModeSettings"];
    
    if(darkModeSettings == 1) {
        
        [self.darkModeSwitch setOn:YES];
        
        self.view.backgroundColor = colors[@"darkModeBackground"];
        self.frankLabel.textColor = colors[@"darkModeText"];
        self.darkModeLabel.textColor = colors[@"darkModeText"];
        self.descriptionText.textColor = colors[@"darkModeText"];
        self.descriptionText.backgroundColor = colors[@"darkModeBackground"];
        
        tabBar.barTintColor = colors[@"darkModeTabBar"];
        tabBar.tintColor = colors[@"darkModeTabBarItem"];
        
    } else {
        
        [self.darkModeSwitch setOn:NO];
        
        self.view.backgroundColor = colors[@"standardBackground"];
        self.frankLabel.textColor = colors[@"standardText"];
        self.darkModeLabel.textColor = colors[@"standardText"];
        self.descriptionText.textColor = colors[@"standardText"];
        self.descriptionText.backgroundColor = colors[@"standardBackground"];
        
        tabBar.barTintColor = colors[@"standardTabBar"];
        tabBar.tintColor = colors[@"standardTabBarItem"];
        
    }
    
    [self setNeedsStatusBarAppearanceUpdate];
    
}
- (void)setColorValues {
    colors = @{@"standardBackground": [UIColor whiteColor], @"standardText": [UIColor blackColor],
               @"standardTabBar": [UIColor blackColor], @"standardTabBarItem": [UIColor whiteColor],
               @"darkModeBackground": [UIColor darkGrayColor], @"darkModeText": [UIColor whiteColor],
               @"darkModeTabBar": [UIColor blackColor], @"darkModeTabBarItem": [UIColor systemOrangeColor]
               
    };
}
@end
