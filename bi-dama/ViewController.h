//
//  ViewController.h
//  bi-dama
//
//  Created by 大氣 on 2014/06/27.
//  Copyright (c) 2014年 大氣. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIGestureRecognizerDelegate>
{
    IBOutlet   UIImageView *desk;
    IBOutlet   UIImageView *ball;
    NSTimer *timer; //ビー玉動かす用のTimer
    bool moving;
    NSTimer *speedTimer;
    UIImageView *mainBidama;
    float speed;  //speedを取りたい
    float ballMoveX ,ballMoveY;
   
    
    double degree;  //ビー玉の進行方向用角度
    CGPoint startPoint,endPoint;    //タップ初めと終わりの座標習得
    CGFloat moveX,moveY;


}
@end
