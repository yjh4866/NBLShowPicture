//
//  NBLShowPicVC.m
//  Pods
//
//  Created by 脱离语言 on 01/21/2019.
//  Copyright (c) 2019 脱离语言. All rights reserved.
//

#import "NBLShowPicVC.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface NBLShowPicVC () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (strong, nonatomic) UIView *imageContainer;
@property (strong, nonatomic) UIImageView *imageView;

@property (nonatomic, strong) UIImage *picture;
@property (nonatomic, strong) NSString *picUrl;
@end

@implementation NBLShowPicVC

+ (void)presentPicture:(UIImage *)picture on:(UIViewController *)viewController
{
    // 加载Bundle
    NSBundle *bundle = [NSBundle bundleWithIdentifier:@"org.cocoapods.NBLShowPicture"];
    // 获取视图控制器
    NBLShowPicVC *showPicVC = [[UIStoryboard storyboardWithName:@"NBLShowPicture.bundle/NBLShowPicVC" bundle:bundle] instantiateInitialViewController];
    showPicVC.picture = picture;
    [viewController presentViewController:showPicVC animated:YES completion:nil];
}
+ (void)presentWithPicUrl:(NSString *)picUrl on:(UIViewController *)viewController
{
    // 加载Bundle
    NSBundle *bundle = [NSBundle bundleWithIdentifier:@"org.cocoapods.NBLShowPicture"];
    // 获取视图控制器
    NBLShowPicVC *showPicVC = [[UIStoryboard storyboardWithName:@"NBLShowPicture.bundle/NBLShowPicVC" bundle:bundle] instantiateInitialViewController];
    showPicVC.picUrl = picUrl;
    [viewController presentViewController:showPicVC animated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    // Do any additional setup after loading the view from its nib.
    // 滚动图片用的容器
    self.imageContainer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    [self.scrollView addSubview:self.imageContainer];
    // 显示图片
    self.imageView = [[UIImageView alloc] initWithFrame:self.imageContainer.bounds];
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    if (self.picture) {
        self.imageView.image = self.picture;
        [self resetScroll];
    } else {
        __weak typeof(self) weakSelf = self;
        [self.imageView sd_setImageWithURL:[NSURL URLWithString:self.picUrl] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
            if (image) {
                [weakSelf resetScroll];
            }
        }];
    }
    [self.imageContainer addSubview:self.imageView];
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}


#pragma mark - Private

- (void)resetScroll
{
    if (self.imageView.image.size.width < 1 ||
        self.imageView.image.size.height < 1) {
        return;
    }
    // 计算合适的显示比例
    CGFloat imageScaleH = self.view.bounds.size.width / self.imageView.image.size.width;
    CGFloat imageScaleV = self.view.bounds.size.height / self.imageView.image.size.height;
    CGFloat imageScale = imageScaleH < imageScaleV ? imageScaleH : imageScaleV;
    CGSize sizeImage = CGSizeMake(self.imageView.image.size.width * imageScale, self.imageView.image.size.height * imageScale);
    // 计算缩放空间
    self.scrollView.contentSize = sizeImage;
    self.imageContainer.frame = CGRectMake(0, 0, sizeImage.width, sizeImage.height);
    self.imageView.frame = self.imageContainer.bounds;
    self.scrollView.contentInset = UIEdgeInsetsMake((self.view.bounds.size.height-sizeImage.height)/2, (self.view.bounds.size.width-sizeImage.width)/2, (self.view.bounds.size.height-sizeImage.height)/2, (self.view.bounds.size.width-sizeImage.width)/2);
}


#pragma mark - Event

- (IBAction)tapView:(id)sender
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - UIScrollViewDelegate

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imageContainer;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
