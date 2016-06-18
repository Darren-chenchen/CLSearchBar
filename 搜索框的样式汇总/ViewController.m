//
//  ViewController.m
//  搜索框的样式汇总
//
//  Created by Darren on 16/6/18.
//  Copyright © 2016年 darren. All rights reserved.
//

#import "ViewController.h"
#import "CLSeachBar.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CLSeachBar *search = [[CLSeachBar alloc] initWithFrame: CGRectMake(50, 80, self.view.frame.size.width-100, 30)];
    // 以下为个性化设置，根据要求设定
    [self styleOne:search];
    [self.view addSubview:search];
}

// 样式1
- (void)styleOne:(CLSeachBar*)search
{
    search.placeholder = @"搜索商品或商户";
    search.backgroundColor = [UIColor blueColor];
    search.returnKeyType = UIReturnKeySearch;
    search.font = [UIFont systemFontOfSize:12];
    search.textColor = [UIColor whiteColor];
    [search setValue:[UIFont boldSystemFontOfSize:14] forKeyPath:@"_placeholderLabel.font"];
    //修改为圆角
    search.layer.masksToBounds = YES;
    search.layer.cornerRadius = search.frame.size.height*0.5;
    search.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = [UIImage imageNamed:@"search"];
    search.leftView = imageView;
    // 设置左边的view永远显示
    search.leftViewMode = UITextFieldViewModeUnlessEditing;
    // 设置右边永远显示清除按钮
    search.clearButtonMode = UITextFieldViewModeWhileEditing;
}

@end
