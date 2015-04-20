//
//  ZYCTabBarButton.m
//  weibo
//
//  Created by qianfeng on 15-4-13.
//  Copyright (c) 2015年 zyc. All rights reserved.
//

//图标的比例
#define ZYCTabBarButtonImageRatio 0.6
#import "ZYCBadgeButton.h"
#import "ZYCTabBarButton.h"

@interface ZYCTabBarButton()

@property (nonatomic,weak) ZYCBadgeButton * badgeButton;

@end

@implementation ZYCTabBarButton

//注意，使用KVO需要在dealloc中移除
-(void)dealloc
{
    [self.item removeObserver:self forKeyPath:@"badgeValue"];
}
-(instancetype)init
{
    if (self =[super init]) {
        
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
        if (!iOS7) {
            
            [self setBackgroundImage:[UIImage imageNamed:@"tabbar_slider"] forState:UIControlStateSelected];
        }
        

        self.imageView.contentMode=UIViewContentModeCenter;
        self.titleLabel.textAlignment=NSTextAlignmentCenter;
        self.titleLabel.font=[UIFont systemFontOfSize:11];
        
        
        
        ZYCBadgeButton * badgeButton =[[ZYCBadgeButton alloc] initWithPoint:CGPointMake(50, 0)];
        
        self.badgeButton=badgeButton;
        
      //  badgeButton.autoresizingMask=UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleBottomMargin;
        
        [self addSubview:_badgeButton];
//        static int i=0;
//        if (i++==0) {
//            self.backgroundColor=[UIColor redColor];
//        }
    }
    return self;
}

-(void)setHighlighted:(BOOL)highlighted
{
    
}


-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageW=contentRect.size.width;
    CGFloat imageH =contentRect.size.height* ZYCTabBarButtonImageRatio;
    return CGRectMake(0, 0, imageW, imageH);
}

-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleY =contentRect.size.height* ZYCTabBarButtonImageRatio;
    CGFloat titleW=contentRect.size.width;
    CGFloat titleH =contentRect.size.height- titleY;

    return CGRectMake(0, titleY, titleW, titleH);
}

-(void)setItem:(UITabBarItem *)item
{
    
    _item=item;
    [self setTitle:item.title forState:UIControlStateNormal];
    [self setImage:item.image forState:UIControlStateNormal];
    [self setImage:item.selectedImage forState:UIControlStateSelected];
  
    
    //KVO
        //观察self的badgeValue属性
    [item addObserver:self forKeyPath:@"badgeValue" options:0 context:nil];
    
    [self observeValueForKeyPath:nil ofObject:nil change:nil context:nil];
}

//属性改变时调用
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    self.badgeButton.badgeValue = self.item.badgeValue;
    NSLog(@"%lf,%lf",self.badgeButton.frame.origin.x,self.badgeButton.frame.origin.y);
}


@end
