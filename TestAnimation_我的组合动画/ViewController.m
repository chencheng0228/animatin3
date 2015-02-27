//
//  ViewController.m
//  TestAnimation_我的组合动画
//
//  Created by admin on 15-1-16.
//  Copyright (c) 2015年 ___CC___. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated
{
    //移动的动画
    [self moveLayerPosition];
    //放缩的动画
    [self moveLayerScaole];
    //
    [self moveLayerRotate];
    [self moveLayer];
}


- (void)moveLayerPosition
{
    
    CALayer *kkLayer = [[CALayer alloc]init];
    kkLayer.backgroundColor = [[UIColor blueColor]CGColor];
    kkLayer.frame = CGRectMake(50, 65, 40, 40);
    kkLayer.cornerRadius = 5;
    [self.view.layer addSublayer:kkLayer];
    
    //移动kkLayer的position
    CABasicAnimation *animation  = [CABasicAnimation animationWithKeyPath:@"position"];
    animation.fromValue = [NSValue valueWithCGPoint:kkLayer.position];
    CGPoint toPoint = kkLayer.position;
    toPoint.x += 180;
    animation.toValue = [NSValue valueWithCGPoint:toPoint];
    animation.autoreverses = YES;
    animation.duration = 3;
    animation.repeatCount = NSNotFound;
    
    [kkLayer addAnimation:animation forKey:@"animationPosition"];
    
}

-(void)moveLayerJump
{
    //获取一个线程
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0), ^{
        
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"主线程做的事情");
        });
        
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
       dispatch_async(dispatch_get_main_queue(), ^{
           
       });
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
       
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"在主线程中执行的操作");
        });
    });
    
    //获取一个线程
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
       dispatch_async(dispatch_get_main_queue(), ^{
           
       });
    });
}

- (void)moveLayerScaole
{
    
    CALayer *kkLayer = [[CALayer alloc]init];
    kkLayer.backgroundColor = [[UIColor greenColor]CGColor];
    kkLayer.frame = CGRectMake(50, 131, 40, 40);
    kkLayer.cornerRadius = 5;
    [self.view.layer addSublayer:kkLayer];
    
    // 对kkLayer进行放大缩小
    CABasicAnimation *scaoleAnimation  = [CABasicAnimation animationWithKeyPath:@"transform.scale.x"];
    scaoleAnimation.duration = 3;
    scaoleAnimation.autoreverses = YES;
    scaoleAnimation.fromValue = [NSNumber numberWithFloat:1.0];
    scaoleAnimation.toValue = [NSNumber numberWithFloat:2.5];
    scaoleAnimation.fillMode = kCAFillModeForwards;
    scaoleAnimation.repeatCount = NSNotFound;
    
    [kkLayer addAnimation:scaoleAnimation forKey:@"animationScaole"];
    
    
}

- (void)moveLayerRotate
{
    
    CALayer *kkLayer = [[CALayer alloc]init];
    kkLayer.backgroundColor = [[UIColor grayColor]CGColor];
    kkLayer.frame = CGRectMake(50, 217, 40, 40);
    kkLayer.cornerRadius = 5;
    [self.view.layer addSublayer:kkLayer];
    
    // 以x轴进行旋转
    CABasicAnimation *rotateAnimation  = [CABasicAnimation animationWithKeyPath:@"transform.rotation.x"];
    rotateAnimation.fromValue = [NSNumber numberWithFloat:0.0];
    rotateAnimation.toValue = [NSNumber numberWithFloat:6.0 * M_PI];
    rotateAnimation.duration = 3;
    rotateAnimation.repeatCount = NSNotFound;
    
    [kkLayer addAnimation:rotateAnimation forKey:@"animationRotate"];
    
}


- (void)moveLayer
{
    
    CALayer *kkLayer = [[CALayer alloc]init];
    kkLayer.backgroundColor = [[UIColor redColor]CGColor];
    kkLayer.frame = CGRectMake(50, 295, 40, 40);
    kkLayer.cornerRadius = 5;
    [self.view.layer addSublayer:kkLayer];
    
    // 移动kkLayer的position
    CABasicAnimation *animation  = [CABasicAnimation animationWithKeyPath:@"position"];
    animation.fromValue = [NSValue valueWithCGPoint:kkLayer.position];
    CGPoint toPoint = kkLayer.position;
    toPoint.x += 180;
    animation.toValue = [NSValue valueWithCGPoint:toPoint];
    
    // 以x轴进行旋转
    CABasicAnimation *rotateAnimation  = [CABasicAnimation animationWithKeyPath:@"transform.rotation.x"];
    rotateAnimation.fromValue = [NSNumber numberWithFloat:0.0];
    rotateAnimation.toValue = [NSNumber numberWithFloat:6.0 * M_PI];
    
    // 对kkLayer进行放大缩小
    CABasicAnimation *scaoleAnimation  = [CABasicAnimation animationWithKeyPath:@"transform.scale.x"];
    scaoleAnimation.duration = 3;
    scaoleAnimation.autoreverses = YES;
    scaoleAnimation.fromValue = [NSNumber numberWithFloat:1.0];
    scaoleAnimation.toValue = [NSNumber numberWithFloat:2.5];
    scaoleAnimation.fillMode = kCAFillModeForwards;
    
    // 把上面的动画组合起来
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.autoreverses = YES;  // 完成后反向完成
    group.duration = 3.0;
    group.animations = [NSArray arrayWithObjects:animation,rotateAnimation, scaoleAnimation, nil];
    group.repeatCount = NSNotFound;
    
    group.fillMode = kCAFillModeForwards;
    
    [kkLayer addAnimation:group forKey:@"kkLayerMove"];
    
}
@end
