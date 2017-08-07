//
//  TurnAPageViewController.m
//  PanningForGold
//
//  Created by Sam Meech-Ward on 2017-08-07.
//  Copyright © 2017 Sam Meech-Ward. All rights reserved.
//

#import "TurnAPageViewController.h"

@interface TurnAPageViewController () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@end

@implementation TurnAPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSArray<UIImageView *> *imageViews = @[[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"birthday1"]],
                                   [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"birthday2"]],
                                   [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"birthday3"]],
                                           [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"birthday1"]],
                                           [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"birthday2"]],
                                           [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"birthday3"]],
                                           [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"birthday1"]],
                                           [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"birthday2"]],
                                           [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"birthday3"]]];
    
    for (UIImageView *imageView in imageViews) {
        imageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    
    UIStackView *stackView = [[UIStackView alloc] initWithArrangedSubviews:imageViews];
    stackView.axis = UILayoutConstraintAxisVertical;
    stackView.distribution = UIStackViewDistributionFillEqually;
    
    [self.scrollView addSubview:stackView];
    
    stackView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [stackView.heightAnchor constraintEqualToAnchor:self.scrollView.heightAnchor multiplier:imageViews.count].active = YES;
    [stackView.widthAnchor constraintEqualToAnchor:self.scrollView.widthAnchor multiplier:1].active = YES;
    
    [stackView.topAnchor constraintEqualToAnchor:self.scrollView.topAnchor].active = YES;
    [stackView.bottomAnchor constraintEqualToAnchor:self.scrollView.bottomAnchor].active = YES;
    [stackView.leadingAnchor constraintEqualToAnchor:self.scrollView.leadingAnchor                                                                                                                                                                                                                                                                                       ].active = YES;
    [stackView.trailingAnchor constraintEqualToAnchor:self.scrollView.trailingAnchor].active = YES;
}

//- (void)viewDidAppear:(BOOL)animated {
//    [super viewDidAppear:animated];
//      [self notUsingAutoLayout];
//
//}

- (void)notUsingAutoLayout {
    NSArray<UIImage *> *images = @[[UIImage imageNamed:@"birthday1"],
                                   [UIImage imageNamed:@"birthday2"],
                                   [UIImage imageNamed:@"birthday3"]];
    
    self.pageControl.numberOfPages = images.count;
    
    int i = 0;
    for (UIImage *image in images) {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        
        imageView.frame = CGRectMake(i*self.scrollView.frame.size.width, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height);
        
        imageView.backgroundColor = [UIColor magentaColor];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        
        [self.scrollView addSubview:imageView];
        
        i++;
    }
    
    self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width*images.count, self.scrollView.frame.size.height);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Scroll View Delegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat pageWidth = self.scrollView.frame.size.width;
    float fractionalPage = self.scrollView.contentOffset.x / pageWidth;
    NSInteger page = lround(fractionalPage);
    self.pageControl.currentPage = page;
}

@end
