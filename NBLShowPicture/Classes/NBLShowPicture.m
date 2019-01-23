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
    // 加载Bundle
    NSBundle *bundle = [NSBundle bundleForClass:NBLShowPicture.class];
    // 获取视图控制器
    NBLShowPicVC *showPicVC = [[UIStoryboard storyboardWithName:@"NBLShowPicture.bundle/NBLShowPicVC" bundle:bundle] instantiateInitialViewController];
    showPicVC.picture = picture;
    [viewController presentViewController:showPicVC animated:YES completion:nil];
}
+ (void)presentWithPicUrl:(NSString *)picUrl on:(UIViewController *)viewController
{
    // 加载Bundle
    NSBundle *bundle = [NSBundle bundleForClass:NBLShowPicture.class];
    // 获取视图控制器
    NBLShowPicVC *showPicVC = [[UIStoryboard storyboardWithName:@"NBLShowPicture.bundle/NBLShowPicVC" bundle:bundle] instantiateInitialViewController];
    showPicVC.picUrl = picUrl;
    [viewController presentViewController:showPicVC animated:YES completion:nil];
}

@end
