//
//  NBLShowPicVC.m
//  Pods
//
//  Created by 脱离语言 on 01/21/2019.
//  Copyright (c) 2019 脱离语言. All rights reserved.
//

#import "NBLShowPicVC.h"
#import "NBLShowPicture.h"

@interface NBLShowPicVC () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (nonatomic, strong) NSArray<NBLPictureView *> *pictureViewList;
@property (nonatomic, weak) NBLPictureView *pictureView;
@end

@implementation NBLShowPicVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

+ (NBLShowPicVC *)presentPicsOrPicUrls:(NSArray<UIImage *> *)pictures
                      withCurrentIndex:(NSInteger)index
                                    on:(UIViewController *)viewController
{
    NBLShowPicVC *showPicVC = [NBLShowPicVC loadViewController];
    showPicVC.modalPresentationStyle = UIModalPresentationFullScreen;
    [viewController presentViewController:showPicVC animated:YES completion:nil];
    // 显示图片
    NSMutableArray *marray = [NSMutableArray array];
    for (int i = 0; i < pictures.count; i++) {
        UIImage *picture = pictures[i];
        // 展现单张图片用的视图
        NBLPictureView *pictureView = [NBLPictureView loadPictureView];
        if ([picture isKindOfClass:[NSString class]]) {
            pictureView.picUrl = (NSString *)picture;
        } else if ([picture isKindOfClass:[UIImage class]]) {
            pictureView.picture = picture;
        }
        pictureView.labelPictureIntro.text = @"";
        pictureView.frame = CGRectMake(i*showPicVC.view.bounds.size.width, 0, showPicVC.view.bounds.size.width, showPicVC.view.bounds.size.height);
        [marray addObject:pictureView];
        [showPicVC.scrollView addSubview:pictureView];
    }
    showPicVC.pictureViewList = marray;
    // 滚动范围
    showPicVC.scrollView.frame = showPicVC.view.bounds;
    showPicVC.scrollView.contentSize = CGSizeMake(pictures.count * showPicVC.view.bounds.size.width, showPicVC.view.bounds.size.height);
    showPicVC.scrollView.scrollEnabled = pictures.count > 1;
    // 当前要显示的图片
    showPicVC.scrollView.contentOffset = CGPointMake(index*showPicVC.view.bounds.size.width, 0);
    showPicVC.pictureView = showPicVC.pictureViewList[index];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.1 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        if (showPicVC.blockShowPicture) {
            showPicVC.blockShowPicture(index, showPicVC.pictureView);
        }
    });
    //
    return showPicVC;
}


#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSUInteger page = (NSUInteger)(scrollView.contentOffset.x / scrollView.bounds.size.width);
    if (page >= self.pictureViewList.count) {
        return;
    }
    NBLPictureView *pictureView = self.pictureViewList[page];
    if (pictureView != self.pictureView) {
        self.pictureView = pictureView;
        if (self.blockShowPicture) {
            self.blockShowPicture(page, self.pictureView);
        }
    }
}


#pragma mark - Private

+ (NBLShowPicVC *)loadViewController
{
    // 加载Bundle
    NSBundle *bundle = [NSBundle bundleForClass:NBLShowPicture.class];
    // 获取视图控制器
    NBLShowPicVC *showPicVC = [[UIStoryboard storyboardWithName:@"NBLShowPicture.bundle/NBLShowPicVC" bundle:bundle] instantiateInitialViewController];
    return showPicVC;
}


#pragma mark - Event

- (IBAction)tapView:(id)sender
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
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
