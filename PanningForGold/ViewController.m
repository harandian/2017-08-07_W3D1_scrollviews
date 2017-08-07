//
//  ViewController.m
//  PanningForGold
//
//  Created by Sam Meech-Ward on 2017-08-07.
//  Copyright © 2017 Sam Meech-Ward. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (nonatomic, strong) UIImageView *birthday2ImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIImage *image = [UIImage imageNamed:@"birthday2"];
    self.birthday2ImageView = [[UIImageView alloc] initWithImage:image];
    
    self.birthday2ImageView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.scrollView addSubview:self.birthday2ImageView];
    
    [self.birthday2ImageView.topAnchor constraintEqualToAnchor:self.scrollView.topAnchor].active = YES;
    [self.birthday2ImageView.bottomAnchor constraintEqualToAnchor:self.scrollView.bottomAnchor].active = YES;
    [self.birthday2ImageView.leadingAnchor constraintEqualToAnchor:self.scrollView.leadingAnchor                                                                                                                                                                                                                                                                                       ].active = YES;
    [self.birthday2ImageView.trailingAnchor constraintEqualToAnchor:self.scrollView.trailingAnchor].active = YES;
    
    self.scrollView.minimumZoomScale = 0.3;
    self.scrollView.maximumZoomScale = 2.0;
}



- (void)notUsingAutoLayout {
    UIImage *image = [UIImage imageNamed:@"birthday2"];
    self.birthday2ImageView = [[UIImageView alloc] initWithImage:image];
    
    [self.scrollView addSubview:self.birthday2ImageView];
    
        self.scrollView.contentSize = image.size;
    
    self.scrollView.minimumZoomScale = 0.3;
    self.scrollView.maximumZoomScale = 2.0;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Scroll View Delegate

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.birthday2ImageView;
}


@end
