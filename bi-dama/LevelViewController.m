//
//  LevelViewController.m
//  bi-dama
//
//  Created by 大氣 on 2014/08/18.
//  Copyright (c) 2014年 大氣. All rights reserved.
//

#import "LevelViewController.h"

@interface LevelViewController ()

@end

@implementation LevelViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)lavel{
    number =1;
    if (number ==1){
    UIViewController *view = [self.storyboard instantiateViewControllerWithIdentifier:@"Play"];
    [self presentViewController: view animated:YES completion: nil];
    }
    
}
-(IBAction)lavel2{
    number =2;
    if (number ==2){
        UIViewController *view = [self.storyboard instantiateViewControllerWithIdentifier:@"Play"];
        [self presentViewController: view animated:YES completion: nil];
    }
}

-(IBAction)lavel3{
        number =3;
        if (number ==3){
            UIViewController *view = [self.storyboard instantiateViewControllerWithIdentifier:@"Play"];
            [self presentViewController: view animated:YES completion: nil];
        }
        
    }






/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
