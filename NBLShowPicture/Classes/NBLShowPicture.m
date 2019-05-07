//
//  NBLShowPicture.m
//  Pods
//
//  Created by HTJT-yangjh on 2019/1/23.
//

#import "NBLShowPicture.h"
#import "NBLShowPicVC.h"

@implementation NBLShowPicture

+ (void)presentPicture:(UIImage *)picture on:(UIViewController *)viewController
{
    [NBLShowPicture presentPicturesOrPicUrls:@[picture] on:viewController];
}
+ (void)presentWithPicUrl:(NSString *)picUrl on:(UIViewController *)viewController
{
    [NBLShowPicture presentPicturesOrPicUrls:@[picUrl] on:viewController];
}

+ (void)presentPicturesOrPicUrls:(NSArray *)pics on:(UIViewController *)viewController
{
    // 获取视图控制器
    NBLShowPicVC *showPicVC = [NBLShowPicVC loadViewController];
    showPicVC.pictures = pics;
    [viewController presentViewController:showPicVC animated:YES completion:nil];
}

@end
