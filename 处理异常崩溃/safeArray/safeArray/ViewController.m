//
//  ViewController.m
//  safeArray
//
//  Created by Alexander on 2021/2/23.
//  Copyright © 2021 alexander. All rights reserved.
//

#import "ViewController.h"
#import "NSArray+SafeFliter.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view.
	
	NSArray *arr1 = @[@"2",@"5",@"8"];
	
	NSLog(@"%@",arr1[8]);
	
}


@end
