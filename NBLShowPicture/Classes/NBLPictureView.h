//
//  NBLPictureView.h
//  NBLShowPicture
//
//  Created by HTJT-yangjh on 2019/5/6.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NBLPictureView : UIView

@property (nonatomic, strong) UIImage *picture;
@property (nonatomic, strong) NSString *picUrl;

+ (NBLPictureView *)loadPictureView;

@end

NS_ASSUME_NONNULL_END
