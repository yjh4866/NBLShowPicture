//
//  NBLViewController.m
//  NBLShowPicture
//
//  Created by 杨建红 on 01/21/2019.
//  Copyright (c) 2019 杨建红. All rights reserved.
//

#import "NBLViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import <NBLShowPicture/NBLShowPicVC.h>

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
    [NBLShowPicVC presentPicture:self.imageView.image on:self];
}
- (IBAction)clickShowPicture:(id)sender
{
    [NBLShowPicVC presentWithPicUrl:@"http://bpic.588ku.com/element_water_img/19/01/06/ff168e0e84240ac09c01c25458bef541.jpg" on:self];
}

@end
