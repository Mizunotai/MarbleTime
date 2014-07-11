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
    // 画面の大きさを取得
    CGRect main = [[UIScreen mainScreen] applicationFrame];

    
    UIImage *image1 =[UIImage imageNamed:@"机.jpg"];
    [desk setImage:image1];
    
    
    
    UIImage *img = [UIImage imageNamed:@"ball.png"];
    UIImageView *mainBidama = [[UIImageView alloc] initWithImage:img];
    mainBidama.frame = [[UIScreen mainScreen]  bounds];
    CGRect rect = CGRectMake(self.view.frame.size.width/2 - 15,self.view.frame.size.height-100, 30,  30);
    mainBidama.frame = rect;
    [self.view addSubview:mainBidama];
    
    //壁との当たり判定
    if(mainBidama.center.x - mainBidama.bounds.size.width / 2 < 0) moveX = - moveX;
    if(mainBidama.center.x + mainBidama.bounds.size.width / 2 > main.size.width) moveX = - moveX;
    



}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
