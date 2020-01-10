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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}
-(UIStatusBarStyle)preferredStatusBarStyle {
    
    if(self.view.backgroundColor == [UIColor grayColor]) {
        return UIStatusBarStyleLightContent;
    }
    
    return UIStatusBarStyleDarkContent;
}
- (IBAction)darkModeSlider:(id)sender {
    if(self.view.backgroundColor == [UIColor grayColor]) {
        self.view.backgroundColor = [UIColor whiteColor];
        
        [self setNeedsStatusBarAppearanceUpdate];
        
        self.frankLabel.textColor = [UIColor blackColor];
    } else {
        self.view.backgroundColor = [UIColor grayColor];
        
        [self setNeedsStatusBarAppearanceUpdate];
        
        self.frankLabel.textColor = [UIColor whiteColor];
    }
}
@end
