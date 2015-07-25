//
//  ViewController.m
//  UIScrollViewTest001
//
//  Created by goudongqian on 15/7/24.
//  Copyright (c) 2015年 goudongqian. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>
{
    UIImageView *view1;
    UIView *view2;
}
@property (weak, nonatomic) IBOutlet UIScrollView *myScrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.myScrollView.delegate = self;
    self.myScrollView.contentSize = CGSizeMake(self.myScrollView.frame.size.width, 1000);
    view1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.myScrollView.frame.size.width, 200)];
    view1.backgroundColor = [UIColor redColor];
    view1.image = [UIImage imageNamed:@"安卓ios用户"];
    [self.myScrollView addSubview:view1];
    view2 = [[UIView alloc] initWithFrame:CGRectMake(0, 100, self.myScrollView.frame.size.width, self.myScrollView.frame.size.height)];
    view2.backgroundColor = [UIColor greenColor];
    [self.myScrollView addSubview:view2];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"xx:%f",scrollView.contentOffset.y);
    if (scrollView.contentOffset.y < 0)
    {
        if (scrollView.contentOffset.y >= -200)
        {
            CGRect frame = view1.frame;
            frame.origin.y = scrollView.contentOffset.y;
            view1.frame = frame;
            NSLog(@"yy:%f",scrollView.contentOffset.y);
            view1.transform = CGAffineTransformMakeScale(1 + scrollView.contentOffset.y / -300, 1 + scrollView.contentOffset.y / -300);
        }
    }
    else
    {
        CGRect frame = view1.frame;
        frame.origin.y = scrollView.contentOffset.y / 2 ;
        view1.frame = frame;
    }
}

@end
