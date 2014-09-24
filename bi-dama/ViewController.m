//
//  ViewController.m
//  bi-dama
//
//  Created by 大氣 on 2014/06/27.
//  Copyright (c) 2014年 大氣. All rights reserved.
//

#import "ViewController.h"
#import "LevelViewController.h"

@interface ViewController ()
{

}
//@property (nonatomic, retain) AVAudioPlayer *player;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //クリアのint
    count =0;
    count2=0;
    count3=0;
    count4 =0;
    count5 = 0 ;
    
    // 画面の大きさを取得
   
    UIImage *image1 =[UIImage imageNamed:@"机.png"];
    [desk setImage:image1];
    //Play用のタイマー
    Playtime = 30;
    TimeLabel.text = [NSString stringWithFormat:@"%d",Playtime];
    PlayTimers = [NSTimer scheduledTimerWithTimeInterval:1
                                             target:self
                                           selector:@selector(playtime:)
                                           userInfo:nil
                                           repeats:YES];

    
    // メインのビー玉を追加
    UIImage *MainBidamaimg = [UIImage imageNamed:@"main_bidama.png"];
    mainBidama = [[UIImageView alloc] initWithImage:MainBidamaimg];
    mainBidama.frame = [[UIScreen mainScreen]  bounds];
    CGRect rect= CGRectMake(self.view.frame.size.width/2 - 15,self.view.frame.size.height-100, 35,  35);
    mainBidama.frame = rect;
    [self.view addSubview:mainBidama];
    
    
    //固定
    //1
    UIImage *ballimg1 = [UIImage imageNamed:@"ball.png"];
    ball[0]= [[UIImageView alloc] initWithImage:ballimg1];
    ball[0].frame = [[UIScreen mainScreen]  bounds];
    CGRect rect1= CGRectMake(400,400, 35,  35);
    ball[0].frame = rect1;
   
    //2
    UIImage *ballimg2 = [UIImage imageNamed:@"ball.png"];
    ball[1]= [[UIImageView alloc] initWithImage:ballimg2];
    ball[1].frame = [[UIScreen mainScreen]  bounds];
    CGRect rect2= CGRectMake(400,400, 35,  35);
    ball[1].frame = rect2;
    
    //3
    UIImage *balling3 =[UIImage imageNamed:@"ball.png"];
    ball[2]=[[UIImageView alloc] initWithImage:balling3];
    ball[2].frame = [[UIScreen mainScreen] bounds];
    CGRect rect3 = CGRectMake(400,400, 35, 35);
    ball[2].frame =rect3;
    
    //4
    UIImage *balling4 =[UIImage imageNamed:@"ball.png"];
    ball[3]=[[UIImageView alloc] initWithImage:balling4];
    ball[3].frame = [[UIScreen mainScreen] bounds];
    CGRect rect4 = CGRectMake(400, 400, 35, 35);
    ball[3].frame =rect4;
    
    //5
    UIImage *balling5 =[UIImage imageNamed:@"ball.png"];
    ball[4]=[[UIImageView alloc] initWithImage:balling5];
    ball[4].frame = [[UIScreen mainScreen] bounds];
    CGRect rect5= CGRectMake(400,400, 35, 35);
    ball[4].frame =rect5;
    
    

        if (number == 1) {
            
            
            //1個目の座標
            ball[0].center = CGPointMake(50, 40);
            [self.view addSubview:ball[0]];
            
            //2個目の座標
            ball[1].center = CGPointMake(299, 47);
            [self.view addSubview:ball[1]];
            //3個目の座標
            ball[2].center = CGPointMake(300, 300);
            [self.view addSubview:ball[2]];
            
        }

        
        
     if(number ==2) {
      
        //1個目の座標
        ball[0].center = CGPointMake(165, 88);
        [self.view addSubview:ball[0]];
        //２個目の座票
        ball[1].center = CGPointMake(300, 333);
        [self.view addSubview:ball[1]];
        //3個目の座標
        ball[2].center = CGPointMake(19, 222);
        [self.view addSubview:ball[2]];
        //4個目の座標
        ball[3].center = CGPointMake(45, 14);
        [self.view addSubview:ball[3]];
        
    }else if (number == 3){
        
        //1個目の座表
        ball[0].center = CGPointMake(33, 188);
        [self.view addSubview:ball[0]];
        //２個目の座票
        ball[1].center = CGPointMake(156, 150);
        [self.view addSubview:ball[1]];
        //3個目の座標
        ball[2].center = CGPointMake(99, 278);
        [self.view addSubview:ball[2]];
        //4個目の座標
        ball[3].center = CGPointMake(204, 33);
        [self.view addSubview:ball[3]];
        //５個目の座標
        ball[4].center = CGPointMake(243,333);
        [self.view addSubview:ball[4]];
        
        
    }
    
    
    
    //PanGestureの導入
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc]
                                          initWithTarget:self action:@selector(panAction:)];
    panGesture.maximumNumberOfTouches = 5;  //指は最大1本まで反応
    [mainBidama addGestureRecognizer:panGesture];   //ビー玉にPanGesture追加
    
    
    //ビー玉を触れるように
    mainBidama.userInteractionEnabled = YES;

   //効果音の設定
    NSString *soundFilePath =
    [[NSBundle mainBundle] pathForResource: @"audio"
                                    ofType: @"mp3"];
    NSURL *fileURL =
    [[NSURL alloc] initFileURLWithPath: soundFilePath];
    
    audio =
    [[AVAudioPlayer alloc] initWithContentsOfURL: fileURL
                                           error: nil];
    [audio prepareToPlay];
    [audio play];
    
    NSString *sound =
    [[NSBundle mainBundle] pathForResource:@"かっち"
                                    ofType:@"mp3"];
    NSURL *soundURL =
    [[NSURL alloc]initFileURLWithPath:sound ];
    audio2 =
    [[AVAudioPlayer alloc] initWithContentsOfURL:soundURL error:nil];
    [audio2 prepareToPlay];
    
 
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)playtime:(NSTimer *)time{
    Playtime -=1;
    if (Playtime ==0){

        UIButton *Endbtn = [[UIButton alloc]
                         initWithFrame:CGRectMake(71, 181, 178, 123)] ;  // ボタンのサイズを指定する

        UIImage *img = [UIImage imageNamed:@"GameOverBtn.png"];  // ボタンにする画像を生成する
                [Endbtn setBackgroundImage:img forState:UIControlStateNormal];  // 画像をセットする
        // ボタンが押された時にHomeメソッドを呼び出す
       [Endbtn addTarget:self
                action:@selector(Home:) forControlEvents:UIControlEventTouchUpInside];

        //[desk insertSubview:btn atIndex:0];
        [self.view addSubview:Endbtn];
        [time invalidate];
   
    }else if(count ==1 && count2 ==1 &&count3 ==1) {
        UIButton *clearbtn = [[UIButton alloc]
                         initWithFrame:CGRectMake(71, 181, 178, 123)] ;  // ボタンのサイズを指定する
        
        UIImage *img = [UIImage imageNamed:@"ClearBtn.png"];  // ボタンにする画像を生成する
        [clearbtn setBackgroundImage:img forState:UIControlStateNormal];  // 画像をセットする
        // ボタンが押された時にHomeメソッドを呼び出す
        [clearbtn addTarget:self
                action:@selector(Home:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:clearbtn];
        [time invalidate];
    } else if (count ==1 && count2 ==1 &&count3 ==1 && count4 == 1 ){
        UIButton *clearbtn = [[UIButton alloc]
                              initWithFrame:CGRectMake(71, 181, 178, 123)] ;  // ボタンのサイズを指定する
        
        UIImage *img = [UIImage imageNamed:@"ClearBtn.png"];  // ボタンにする画像を生成する
        [clearbtn setBackgroundImage:img forState:UIControlStateNormal];  // 画像をセットする
        // ボタンが押された時にHomeメソッドを呼び出す
        [clearbtn addTarget:self
                     action:@selector(Home:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:clearbtn];
        [time invalidate];

    } else if (count ==1 && count2 ==1 &&count3 ==1 && count4 == 1 && count5 ==1){
        UIButton *clearbtn = [[UIButton alloc]
                              initWithFrame:CGRectMake(71, 181, 178, 123)] ;  // ボタンのサイズを指定する
        
        UIImage *img = [UIImage imageNamed:@"ClearBtn.png"];  // ボタンにする画像を生成する
        [clearbtn setBackgroundImage:img forState:UIControlStateNormal];  // 画像をセットする
        // ボタンが押された時にHomeメソッドを呼び出す
        [clearbtn addTarget:self
                     action:@selector(Home:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:clearbtn];
        [time invalidate];

        
    }
    
    
    TimeLabel.text = [NSString stringWithFormat:@"%d",Playtime];
 }
//
-(void)Home:(UIButton *)button {
    UIViewController *view = [self.storyboard instantiateViewControllerWithIdentifier:@"Home"];
    [self presentViewController: view animated:YES completion: nil];

}

//ビー玉動かす用のTimerメソッド

- (void)ballMove:(NSTimer *)_timer {
    
    
    
    
    CGRect main = [[UIScreen mainScreen] applicationFrame];
    
    mainBidama.center = CGPointMake(mainBidama.center.x + ballMoveX/speed, mainBidama.center.y + ballMoveY/speed);
    
    
    //ビー玉と横壁の当たり判定
    if(mainBidama.center.x - mainBidama.bounds.size.width / 2 < 0){
        ballMoveX = - ballMoveX;
        //    speed += 0.01;
    }
    if(mainBidama.center.x +mainBidama.bounds.size.width / 2 > main.size.width){
        ballMoveX = - ballMoveX;
        //    speed += 0.01;
    }
    // ビー玉と縦壁の当たり判定
    if(mainBidama.center.y - mainBidama.bounds.size.height / 2 < 0){
        ballMoveY = - ballMoveY;
        //    speed += 0.01;
    }       
    if(mainBidama.center.y +mainBidama.bounds.size.height / 2 > main.size.height){
        ballMoveY = - ballMoveY;
        //    speed += 0.01;
    }
    
    
//    ビー玉と止まってるボールのあたり判定
    float distance = (mainBidama.center.x - ball[0].center.x)*(mainBidama.center.x - ball[0].center.x)
    +(mainBidama.center.y - ball[0].center.y)*(mainBidama.center.y- ball[0].center.y);
    
    float distance2 = (mainBidama.center.x - ball[1].center.x)*(mainBidama.center.x - ball[1].center.x)
    +(mainBidama.center.y - ball[1].center.y)*(mainBidama.center.y- ball[1].center.y);
    
    float distance3 = (mainBidama.center.x - ball[2].center.x)*(mainBidama.center.x - ball[2].center.x)
    +(mainBidama.center.y - ball[2].center.y)*(mainBidama.center.y- ball[2].center.y);
    
    float distance4 = (mainBidama.center.x - ball[3].center.x)*(mainBidama.center.x - ball[3].center.x)
    +(mainBidama.center.y - ball[3].center.y)*(mainBidama.center.y- ball[3].center.y);
    
    float distance5 = (mainBidama.center.x - ball[4].center.x)*(mainBidama.center.x - ball[4].center.x)
    +(mainBidama.center.y - ball[4].center.y)*(mainBidama.center.y- ball[4].center.y);
    


    if (distance<40*40) {
        ballMoveX=-ballMoveX;
        ballMoveY=-ballMoveY;
        NSLog(@"ATARI:%.1f", distance);
       //ビー玉とボールが当たったあとにかわる画像
        UIImage *ballimag =[UIImage imageNamed:@"green_ball.png"];
        CGPoint point = ball[0].center;
        ball[0]=[[UIImageView alloc] initWithImage:ballimag];
        ball[0].center = point;
        [self.view addSubview:ball[0]];
        [audio2 play];
        count = 1;

    }else {
        ballMoveX=+ballMoveX;
        ballMoveY=+ballMoveY;
        NSLog(@"HAZURE:%.1f", distance);
        
    }
    
    
    if (distance2<40*40) {
        ballMoveX=-ballMoveX;
        ballMoveY=-ballMoveY;
        NSLog(@"ATARI:%.1f", distance2);
       //ビー玉とボールが当たったあとにかわる画像
        UIImage *ballimag =[UIImage imageNamed:@"green_ball.png"];
        CGPoint point = ball[1].center;
        ball[1]=[[UIImageView alloc] initWithImage:ballimag];
        ball[1].center = point;
        [self.view addSubview:ball[1]];
        [audio2 play];
        count2 = 1;
    }else {
        ballMoveX=+ballMoveX;
        ballMoveY=+ballMoveY;
        NSLog(@"HAZURE:%.1f", distance2);
       }
    
    if (distance3<40*40) {
        ballMoveX=-ballMoveX;
        ballMoveY=-ballMoveY;
        NSLog(@"ATARI:%.1f", distance3);
        //ビー玉とボールが当たったあとにかわる画像
        UIImage *ballimag =[UIImage imageNamed:@"green_ball.png"];
        CGPoint point = ball[2].center;
        ball[2]=[[UIImageView alloc] initWithImage:ballimag];
        ball[2].center = point;
        [self.view addSubview:ball[2]];
        count3 =1;
        [audio2 play];
    }else {
        ballMoveX=+ballMoveX;
        ballMoveY=+ballMoveY;
        NSLog(@"HAZURE:%.1f", distance3);
        }
    
    if (distance4<40*40) {
        ballMoveX=-ballMoveX;
        ballMoveY=-ballMoveY;
        NSLog(@"ATARI:%.1f", distance4);
        //ビー玉とボールが当たったあとにかわる画像
        UIImage *ballimag =[UIImage imageNamed:@"green_ball.png"];
        CGPoint point = ball[3].center;
        ball[3]=[[UIImageView alloc] initWithImage:ballimag];
        ball[3].center = point;
        [self.view addSubview:ball[3]];
        count4 = 1;
        [audio2 play];

        
        
    }else {
        ballMoveX=+ballMoveX;
        ballMoveY=+ballMoveY;
        NSLog(@"HAZURE:%.1f", distance4);
    }
    
    if (distance5<40*40) {
        ballMoveX=-ballMoveX;
        ballMoveY=-ballMoveY;
        NSLog(@"ATARI:%.1f", distance5);
       //ビー玉とボールが当たったあとにかわる画像
        UIImage *ballimag =[UIImage imageNamed:@"green_ball.png"];
        CGPoint point = ball[4].center;
        ball[4]=[[UIImageView alloc] initWithImage:ballimag];
        ball[4].center = point;
        [self.view addSubview:ball[4]];
        [audio2 play];
        count5 =1 ;
    }else {
        ballMoveX=+ballMoveX;
        ballMoveY=+ballMoveY;
        NSLog(@"HAZURE:%.1f", distance5);
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
-(IBAction)Back {
    [self dismissViewControllerAnimated:YES completion:nil];
}

/*見えない斜め壁ができる
//    if (powf(mainBidama.center.y - mainBidama.bounds.size.height/2 ,2) <
//        powf(mainBidama.center.x-mainBidama.bounds.size.width/2, 2)) {
//        ballMoveY=+ballMoveY;
//        ballMoveX=+ballMoveX;
//    }
//*/



@end