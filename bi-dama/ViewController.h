//
//  ViewController.h
//  bi-dama
//
//  Created by 大氣 on 2014/06/27.
//  Copyright (c) 2014年 大氣. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
@interface ViewController : UIViewController<UIGestureRecognizerDelegate>
{
    
    IBOutlet   UIImageView *desk;
     UIImageView *ball[10];
    UIImageView  *GameOver;

    UIImageView *mainBidama;
    IBOutlet NSTimer *timer; //ビー玉動かす用のTimer
    bool moving;
    NSTimer *speedTimer;
   
    int Playtime;
    NSTimer *PlayTimers; //Play時間用のTimer
    IBOutlet UILabel *TimeLabel;
    
    float speed;  //speedを取りたい

    float ballMoveX ,ballMoveY;

    double degree;  //ビー玉の進行方向用角度
    CGPoint startPoint,endPoint;    //タップ初めと終わりの座標習得
    CGFloat moveX,moveY;
    
    AVAudioPlayer *audio;
    AVAudioPlayer *audio2;
    
    int count;
    int count2;
    int count3;
    int count4;
    int count5;
}
-(IBAction)Back;
