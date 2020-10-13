//
//  NBLPictureView.h
//  NBLShowPicture
//
//  Created by HTJT-yangjh on 2019/5/6.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NBLPictureView : UIView

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UILabel *labelPictureIntro;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintLabelLeft;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintLabelRight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintLabelBottom;

@property (nonatomic, strong) UIImage *picture;
@property (nonatomic, strong) NSString *picUrl;

+ (NBLPictureView *)loadPictureView;

@end

NS_ASSUME_NONNULL_END
