//
//  NBLShowPicture.h
//  Pods
//
//  Created by HTJT-yangjh on 2019/1/23.
//

#import <Foundation/Foundation.h>
#import "NBLShowPicVC.h"

NS_ASSUME_NONNULL_BEGIN

@interface NBLShowPicture : NSObject

+ (NBLShowPicVC *)presentPicture:(UIImage *)picture on:(UIViewController *)viewController;
+ (NBLShowPicVC *)presentWithPicUrl:(NSString *)picUrl on:(UIViewController *)viewController;

+ (NBLShowPicVC *)presentPicsOrPicUrls:(NSArray *)pics
                      withCurrentIndex:(NSInteger)index
                                    on:(UIViewController *)viewController;

@end

NS_ASSUME_NONNULL_END
