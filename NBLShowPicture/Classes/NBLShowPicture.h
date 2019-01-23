//
//  NBLShowPicture.h
//  Pods
//
//  Created by HTJT-yangjh on 2019/1/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NBLShowPicture : NSObject

+ (void)presentPicture:(UIImage *)picture on:(UIViewController *)viewController;
+ (void)presentWithPicUrl:(NSString *)picUrl on:(UIViewController *)viewController;

@end

NS_ASSUME_NONNULL_END
