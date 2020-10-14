//
//  NBLShowPicVC.h
//  Pods
//
//  Created by 脱离语言 on 01/21/2019.
//  Copyright (c) 2019 脱离语言. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NBLPictureView.h"

NS_ASSUME_NONNULL_BEGIN

@interface NBLShowPicVC : UIViewController

@property (nonatomic, copy) void (^blockFirstShow)(NSUInteger page, NBLPictureView *pictureView);
@property (nonatomic, copy) void (^blockPictureChanged)(NSUInteger page, NBLPictureView *pictureView);

+ (NBLShowPicVC *)presentPicsOrPicUrls:(NSArray<UIImage *> *)pictures
                      withCurrentIndex:(NSInteger)index
                                    on:(UIViewController *)viewController;

@end

NS_ASSUME_NONNULL_END
