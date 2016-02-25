//
//  DZSClipImageController.h
//  ClippingImage
//
//  Created by dzs on 16/1/7.
//  Copyright © 2016年 dzs. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum{
    ClipTypeSquare,          //方形裁剪
    ClipTypeCircle           //圆形裁剪，还没完善好
}ClipType;


typedef enum : NSUInteger {  //方形裁剪比例
    ScaleTypeOne,            //1比1
    ScaleTypeTwo,            //4比3
    ScaleTypeThree           //16比9
} ScaleType;

@class DZSClipImageController;
@protocol DZSClipImageControllerDelegate <NSObject>

-(void)ClipViewController:(DZSClipImageController *)clipViewController FinishClipImage:(UIImage *)editImage;

@end

@interface DZSClipImageController : UIViewController

@property (nonatomic, assign)CGFloat scaleRation;  //图片缩放的最大倍数 默认3
@property (nonatomic, assign)CGFloat radius;       //圆形裁剪框的半径  默认120
@property (nonatomic, assign)ClipType clipType;    //裁剪的形状
@property (nonatomic, assign)ScaleType scaleType;  //裁剪框比例
@property (nonatomic, strong)UIImage *image;
@property (nonatomic, weak)id<DZSClipImageControllerDelegate>delegate;


-(instancetype)initWithImage:(UIImage *)image ClipType:(ClipType)clipType ScaleType:(ScaleType)scaleType Delegate:(id<DZSClipImageControllerDelegate>)delegate;
@end

