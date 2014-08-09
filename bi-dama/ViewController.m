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
   
    
    
    UIImage *image1 =[UIImage imageNamed:@"机.jpg"];
    [desk setImage:image1];
    
    moving = NO;
    UIImage *img2 =[UIImage imageNamed:@"ball.png"];
    ball = [[UIImageView alloc] initWithImage:img2];
    ball.frame = [[UIScreen mainScreen]  bounds];
    CGRect rect = CGRectMake(self.view.frame.size.width/2 - 15,self.view.frame.size.height-200, 30,  30);
    ball.frame = rect;
    [self.view addSubview:ball];
    
    // メインのビー玉を追加
    UIImage *img = [UIImage imageNamed:@"main_bidama.png"];
    mainBidama = [[UIImageView alloc] initWithImage:img];
    mainBidama.frame = [[UIScreen mainScreen]  bounds];
    CGRect rect1= CGRectMake(self.view.frame.size.width/2 - 15,self.view.frame.size.height-100, 30,  30);
    mainBidama.frame = rect1;
    [self.view addSubview:mainBidama];
    
    
    //PanGestureの導入
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc]
                                          initWithTarget:self action:@selector(panAction:)];
    panGesture.maximumNumberOfTouches = 1;  //指は最大1本まで反応
    [mainBidama addGestureRecognizer:panGesture];   //ビー玉にPanGesture追加
    
    
    //ビー玉を触れるように
    mainBidama.userInteractionEnabled = YES;

    
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//ビー玉動かす用のTimerメソッド
- (void)ballMove:(NSTimer *)_timer {
    
    CGRect main = [[UIScreen mainScreen] applicationFrame];
    
    mainBidama.center = CGPointMake(mainBidama.center.x + ballMoveX/speed, mainBidama.center.y + ballMoveY/speed);
    
    
    // ballと横壁の当たり判定
    if(mainBidama.center.x - mainBidama.bounds.size.width / 2 < 0){
        ballMoveX = - ballMoveX;
        //    speed += 0.01;
    }
    if(mainBidama.center.x +mainBidama.bounds.size.width / 2 > main.size.width){
        ballMoveX = - ballMoveX;
        //    speed += 0.01;
    }
    // ballと縦壁の当たり判定
    if(mainBidama.center.y - mainBidama.bounds.size.height / 2 < 0){
        ballMoveY = - ballMoveY;
        //    speed += 0.01;
    }       
    if(mainBidama.center.y +mainBidama.bounds.size.height / 2 > main.size.height){
        ballMoveY = - ballMoveY;
        //    speed += 0.01;
    }
//    //ballとballのあたり判tei
    float kyori = (mainBidama.center.x - ball.center.x)*(mainBidama.center.x - ball.center.x)
    +(mainBidama.center.y - ball.center.y)*(mainBidama.center.y- ball.center.y);
    if (kyori<40*40) {
        ballMoveX=-ballMoveX;
        ballMoveY=-ballMoveY;
        NSLog(@"ATARI:%.1f", kyori);
    }else {
        ballMoveX=+ballMoveX;
        ballMoveY=+ballMoveY;
        NSLog(@"HAZURE:%.1f", kyori);
        
    }
    speed += 0.003;
    
    if(speed >= 0.7){
        
        [timer invalidate];
        moving = NO;
    }
    
}

- (void)speedCount:(NSTimer *)_timer {
    speed = speed += 0.01;
}


- (void)panAction:(UIPanGestureRecognizer *)sender {
    
    if(moving == NO){
        //座標習得
        CGPoint currentPoint = [sender translationInView:self.view];
        
        //ドラッグ始め
        if(sender.state == UIGestureRecognizerStateBegan){
            startPoint = currentPoint;
            //ドラッグ始めの座標を習得
            
            speed = 0.01;
            //ビー玉を動かすタイマー
        }
        
        
        //ドラッグ終わり
        if (sender.state == UIGestureRecognizerStateEnded){
            [speedTimer invalidate];
            
            endPoint = currentPoint;
            //ドラッグ終わりの座標を習得
            
            //始めと終わりの距離の差を習得
            moveX = endPoint.x - startPoint.x;
            moveY = endPoint.y - startPoint.y;
            
            //角度の設定
            degree = atan(moveY/moveX);
            //tan^-1で角度習得
            
            if(degree < 0){ //第一象限角度のみ習得
                //向きは動かす時に設定
                degree *= -1;
            }
            NSLog(@"%f",degree);
            
            
            if(moveX >= 0){
                ballMoveX = cos(degree) *0.3;
            }else{
                ballMoveX = -cos(degree) *0.3;
            }
            
            // y方向(縦)の向き
            if(moveY >= 0){
                ballMoveY = sin(degree) *0.3;
            }else{
                ballMoveY = -sin(degree) *0.3;
            }
            
            
            
            //ビー玉を動かすタイマー
            timer = [NSTimer scheduledTimerWithTimeInterval:0.01
                                                     target:self
                                                   selector:@selector(ballMove:)
                                                   userInfo:nil
                                                    repeats:YES];
            moving= YES;
        }
        
    }
    
}


//   if ( powf((mainBidama.center.x - ball.center.x),2)+ powf((mainBidama.center.y -ball.center.y), 2)
//       powf((mainBidama.bounds.size.height && mainBidama.bounds.size.width + ball.bounds.size.height && ball.bounds.size.width /2), 2) ){
//    ballMoveY=-ballMoveY;
//   }
//

/*見えない斜め壁ができる
//    if (powf(mainBidama.center.y - mainBidama.bounds.size.height/2 ,2) <
//        powf(mainBidama.center.x-mainBidama.bounds.size.width/2, 2)) {
//        ballMoveY=+ballMoveY;
//        ballMoveX=+ballMoveX;
//    }
//*/







@end
