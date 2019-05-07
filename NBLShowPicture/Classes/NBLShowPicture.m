//
//  NBLShowPicture.m
//  Pods
//
//  Created by HTJT-yangjh on 2019/1/23.
//

#import "NBLShowPicture.h"
#import "NBLShowPicVC.h"

@implementation NBLShowPicture

+ (NBLShowPicVC *)presentPicture:(UIImage *)picture on:(UIViewController *)viewController
{
    return [NBLShowPicture presentPicsOrPicUrls:@[picture] withCurrentIndex:0 on:viewController];
}
+ (NBLShowPicVC *)presentWithPicUrl:(NSString *)picUrl on:(UIViewController *)viewController
{
    return [NBLShowPicture presentPicsOrPicUrls:@[picUrl] withCurrentIndex:0 on:viewController];
}

+ (NBLShowPicVC *)presentPicsOrPicUrls:(NSArray *)pics
                      withCurrentIndex:(NSInteger)index
                                    on:(UIViewController *)viewController
{
    return [NBLShowPicVC presentPicsOrPicUrls:pics withCurrentIndex:index on:viewController];
}

@end
