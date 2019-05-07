//
//  NBLPictureView.m
//  NBLShowPicture
//
//  Created by HTJT-yangjh on 2019/5/6.
//

#import "NBLPictureView.h"
#import "NBLShowPicture.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface NBLPictureView () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (strong, nonatomic) UIView *imageContainer;
@property (strong, nonatomic) UIImageView *imageView;
@end

@implementation NBLPictureView

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        // KVO
        [self addObserver:self forKeyPath:@"picture"
                  options:NSKeyValueObservingOptionNew context:nil];
        [self addObserver:self forKeyPath:@"picUrl"
                  options:NSKeyValueObservingOptionNew context:nil];
    }
    return self;
}

- (void)dealloc
{
    [self removeObserver:self forKeyPath:@"picture"];
    [self removeObserver:self forKeyPath:@"picUrl"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"picture"]) {
        self.imageView.image = self.picture;
        [self resetScroll];
    } else if ([keyPath isEqualToString:@"picUrl"]) {
        __weak typeof(self) weakSelf = self;
        [self.imageView sd_setImageWithURL:[NSURL URLWithString:self.picUrl] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
            if (image) {
                [weakSelf resetScroll];
            }
        }];
    }
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
    if (nil == self.imageContainer) {
        // 滚动图片用的容器
        self.imageContainer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
        [self.scrollView addSubview:self.imageContainer];
        // 显示图片
        self.imageView = [[UIImageView alloc] initWithFrame:self.imageContainer.bounds];
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self.imageContainer addSubview:self.imageView];
    }
}

+ (NBLPictureView *)loadPictureView
{
    // 加载Bundle
    NSBundle *bundle = [NSBundle bundleForClass:NBLShowPicture.class];
    // 获取视图控制器
    NBLPictureView *pictureView = [bundle loadNibNamed:@"NBLShowPicture.bundle/NBLPictureView" owner:nil options:nil][0];
    return pictureView;
}


#pragma mark - Private

- (void)resetScroll
{
    if (self.imageView.image.size.width < 1 ||
        self.imageView.image.size.height < 1) {
        return;
    }
    // 计算合适的显示比例
    CGFloat imageScaleH = self.bounds.size.width / self.imageView.image.size.width;
    CGFloat imageScaleV = self.bounds.size.height / self.imageView.image.size.height;
    CGFloat imageScale = imageScaleH < imageScaleV ? imageScaleH : imageScaleV;
    CGSize sizeImage = CGSizeMake(self.imageView.image.size.width * imageScale, self.imageView.image.size.height * imageScale);
    // 计算缩放空间
    self.scrollView.contentSize = sizeImage;
    self.imageContainer.frame = CGRectMake(0, 0, sizeImage.width, sizeImage.height);
    self.imageView.frame = self.imageContainer.bounds;
    self.scrollView.contentInset = UIEdgeInsetsMake((self.bounds.size.height-sizeImage.height)/2, (self.bounds.size.width-sizeImage.width)/2, (self.bounds.size.height-sizeImage.height)/2, (self.bounds.size.width-sizeImage.width)/2);
}


#pragma mark - UIScrollViewDelegate

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imageContainer;
}

@end
