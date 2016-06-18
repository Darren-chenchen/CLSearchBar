//
//  CLSeachBar.m
//  搜索框的样式汇总
//
//  Created by Darren on 16/6/18.
//  Copyright © 2016年 darren. All rights reserved.
//

#import "CLSeachBar.h"

@implementation CLSeachBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

// 重写这个方法设置placeholder的位置
- (void)drawPlaceholderInRect:(CGRect)rect{
    
    CGSize size = [self getRectWith:self.placeholder and:14 andMaxSize:CGSizeMake(MAXFLOAT, MAXFLOAT)];
    
    UIColor *placeholderColor = [UIColor whiteColor];//设置颜色
    [placeholderColor setFill];
    
    CGRect placeholderRect = CGRectMake((rect.size.width-size.width)*0.5, 8, size.width, rect.size.height);//设置距离
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.lineBreakMode = NSLineBreakByTruncatingTail;
    style.alignment = self.textAlignment;
    NSDictionary *attr = [NSDictionary dictionaryWithObjectsAndKeys:style,NSParagraphStyleAttributeName, self.font, NSFontAttributeName, placeholderColor, NSForegroundColorAttributeName, nil];
    
    [self.placeholder drawInRect:placeholderRect withAttributes:attr];
}

// 重写这个方法，设置光标的位置
- (CGRect)editingRectForBounds:(CGRect)bounds
{
    return CGRectMake(10, 0, bounds.size.width, bounds.size.height);
}
// 重写这个方法，设置文本的尺寸
- (CGRect)textRectForBounds:(CGRect)bounds
{
    return CGRectMake(10, 0, bounds.size.width, bounds.size.height);
}
// 重写这个方法，设置搜索图片的位置
- (CGRect)leftViewRectForBounds:(CGRect)bounds
{
    CGSize size = [self getRectWith:self.placeholder and:14 andMaxSize:CGSizeMake(MAXFLOAT, MAXFLOAT)];
    return CGRectMake((self.frame.size.width-size.width)*0.5-10, (self.frame.size.height-15)*0.5,15, 15);
}
/**调用这个方法可以获得文字所在矩形框的尺寸*/
- (CGSize)getRectWith:(NSString *)str and:(int)fontSize andMaxSize:(CGSize)maxSize
{
    NSDictionary *dic = @{NSFontAttributeName : [UIFont systemFontOfSize:fontSize]};
    return  [str boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
}
@end
