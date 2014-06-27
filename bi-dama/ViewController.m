//
//  ViewController.m
//  bi-dama
//
//  Created by 大氣 on 2014/06/27.
//  Copyright (c) 2014年 大氣. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UIImage  *image =[UIImage imageNamed:@"ball.png"];
    [ball setImage:image];
    UIImage *image1 =[UIImage imageNamed:@"机.jpg"];
    [desk setImage:image1];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
