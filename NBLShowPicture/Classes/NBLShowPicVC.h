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

@property (nonatomic, strong) NSArray *pictures;

+ (NBLShowPicVC *)loadViewController;

@end

NS_ASSUME_NONNULL_END
