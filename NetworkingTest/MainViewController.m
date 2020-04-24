//
//  MainViewController.m
//  NetworkingTest
//
//  Created by ryan.huang on 2020/4/24.
//  Copyright © 2020 ryan.huang. All rights reserved.
//

#import "MainViewController.h"
#import "OriginalNetController.h"
#import "AFNetworkingController.h"

@interface MainViewController () <UITabBarControllerDelegate>

@property (strong,nonatomic) UITabBarController *tabBarController;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tabBarController = [[UITabBarController alloc] init];
    self.tabBarController.delegate = self;
    
    OriginalNetController *originalVC = [[OriginalNetController alloc] init];
    UINavigationController *originalNav = [[UINavigationController alloc] initWithRootViewController:originalVC];
    originalNav.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Original" image:[UIImage imageNamed:@"icon"] tag:0];
    
    AFNetworkingController *AFNetVC = [[AFNetworkingController alloc] init];
    UINavigationController *AFNetNav = [[UINavigationController alloc] initWithRootViewController:AFNetVC];
    AFNetVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"AFNetworking" image:[UIImage imageNamed:@"link"] tag:1];
    
    self.tabBarController.viewControllers = [NSArray arrayWithObjects:originalNav,AFNetNav, nil];
    [self.view addSubview:self.tabBarController.view];
}



@end
