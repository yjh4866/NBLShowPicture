//
//  NBLShowPicVC.h
//  Pods
//
//  Created by 脱离语言 on 01/21/2019.
//  Copyright (c) 2019 脱离语言. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NBLShowPicVC : UIViewController

+ (NBLShowPicVC *)presentPicsOrPicUrls:(NSArray *)pictures
                      withCurrentIndex:(NSInteger)index
                                    on:(UIViewController *)viewController;

@end

NS_ASSUME_NONNULL_END
