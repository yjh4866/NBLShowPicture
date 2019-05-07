//
//  NBLShowPicVC.m
//  Pods
//
//  Created by 脱离语言 on 01/21/2019.
//  Copyright (c) 2019 脱离语言. All rights reserved.
//

#import "NBLShowPicVC.h"
#import "NBLShowPicture.h"
#import "NBLPictureView.h"

@interface NBLShowPicVC () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@end

@implementation NBLShowPicVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    // Do any additional setup after loading the view from its nib.
    
    for (int i = 0; i < self.pictures.count; i++) {
        UIImage *picture = self.pictures[i];
        // 展现单张图片用的视图
        NBLPictureView *pictureView = [NBLPictureView loadPictureView];
        if ([picture isKindOfClass:[NSString class]]) {
            pictureView.picUrl = (NSString *)picture;
        } else if ([picture isKindOfClass:[UIImage class]]) {
            pictureView.picture = picture;
        }
        pictureView.frame = CGRectMake(i*self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height);
        [self.scrollView addSubview:pictureView];
    }
    // 滚动范围
    self.scrollView.contentSize = CGSizeMake(self.pictures.count * self.view.bounds.size.width, self.view.bounds.size.height);
    self.scrollView.scrollEnabled = self.pictures.count > 1;
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

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
