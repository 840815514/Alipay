//
//  ViewController.m
//  aaaa
//
//  Created by china on 2017/6/17.
//  Copyright © 2017年 china. All rights reserved.
//

#import "ViewController.h"
#import "HWPopTool.h"
@interface ViewController ()
@property (strong, nonatomic) UIView *contentView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    _contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 300)];
    _contentView.backgroundColor = [UIColor clearColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 100, 50);
    btn.center=self.view.center;
    btn.backgroundColor = [UIColor blueColor];
    [btn setTitle:@"红包" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(popViewShow) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)popViewShow {
    UIImageView *imageV = [[UIImageView alloc]initWithFrame:_contentView.bounds];
    imageV.image = [UIImage imageNamed:@"aa"];
    [_contentView addSubview:imageV];
    
    
    
    UIImageView *slipeView=[[UIImageView alloc]initWithFrame:CGRectMake(70, 190, 60, 60)];
    slipeView.image=[UIImage imageNamed:@"bb"];
    CABasicAnimation *animation =  [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    
    //默认是顺时针效果，若将fromValue和toValue的值互换，则为逆时针效果
    
    animation.fromValue = [NSNumber numberWithFloat:0.0]; // 起始角度
    animation.toValue = [NSNumber numberWithFloat:M_SQRT2]; // 终止角度
    
    animation.removedOnCompletion = NO;
    //  animation.fillMode = kCAFillModeForwards;
    animation.duration  = 0.4;
    
    animation.autoreverses = NO;
    
    //  animation.fillMode =kCAFillModeForwards;
    
    animation.repeatCount = MAXFLOAT; //如果这里想设置成一直自旋转，可以设置为MAXFLOAT，否则设置具体的数值则代表执行多少次
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [slipeView.layer addAnimation:animation forKey:nil];
    [imageV addSubview:slipeView];
    
    [HWPopTool sharedInstance].shadeBackgroundType = ShadeBackgroundTypeSolid;
    [HWPopTool sharedInstance].closeButtonType = ButtonPositionTypeRight;
    [[HWPopTool sharedInstance] showWithPresentView:_contentView animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
