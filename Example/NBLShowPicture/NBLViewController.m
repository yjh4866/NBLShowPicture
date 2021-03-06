//
//  NBLViewController.m
//  NBLShowPicture
//
//  Created by 杨建红 on 01/21/2019.
//  Copyright (c) 2019 杨建红. All rights reserved.
//

#import "NBLViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import <NBLShowPicture/NBLShowPicture.h>

@interface NBLViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation NBLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:@"http://bpic.588ku.com//back_water_img/19/01/09/1029e92caac45f6e0d51afed1ff6ea194e.jpg"]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tapImageView:(id)sender
{
    [NBLShowPicture presentPicture:self.imageView.image on:self];
}
- (IBAction)clickShowPicture:(id)sender
{
    NBLShowPicVC *picVC = [NBLShowPicture presentPicsOrPicUrls:@[@"http://bpic.588ku.com/element_water_img/19/01/06/ff168e0e84240ac09c01c25458bef541.jpg", self.imageView.image] withCurrentIndex:1 on:self];
    picVC.blockShowPicture = ^(NSUInteger page, NBLPictureView * _Nonnull pictureView) {
        if (page == 0) {
            pictureView.labelPictureIntro.text = @"将任务追加到对应队列中，考虑到队列阻塞等情况，所以这个任务从加入队列到真正执行的时间是不准确的";
        }
        else {
            pictureView.picture = [UIImage imageNamed:@"30"];
        }
    };
}

@end
