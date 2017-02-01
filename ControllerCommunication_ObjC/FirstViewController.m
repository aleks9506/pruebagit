//
//  FirstViewController.m
//  ControllerCommunication_ObjC
//
//  Created by Torrey Betts on 5/29/14.
//  Copyright (c) 2014 Infragistics. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"

@interface FirstViewController () <SecondViewControllerDelegate>
{
    UILabel *_label;
    UIButton *_button;
}
@end

@implementation FirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = @"1st Controller";
    self.view.backgroundColor = [UIColor whiteColor];
    [self createViews];
}

- (void)createViews
{
    CGRect top, bottom;
    CGRectDivide(self.view.bounds, &top, &bottom, self.view.bounds.size.height / 2, CGRectMinYEdge);

    _label = [[UILabel alloc] initWithFrame:CGRectInset(top, 5, 5)];
    _label.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth|
            UIViewAutoresizingFlexibleBottomMargin;
    _label.textAlignment = NSTextAlignmentCenter;
    _label.text = @"This data is from the first view controller.";
    [self.view addSubview:_label];

    _button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _button.frame = CGRectMake(0, 0, 300, 100);
    _button.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight|
            UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleLeftMargin|
            UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleTopMargin;
    [_button setTitle:@"Send Data Forward" forState:UIControlStateNormal];
    _button.center = CGPointMake(CGRectGetMidX(bottom), CGRectGetMidY(bottom));
    [self.view addSubview:_button];

    [_button addTarget:self action:@selector(passDataForward) forControlEvents:UIControlEventTouchUpInside];
}

- (void)passDataForward
{
    SecondViewController *secondViewController = [[SecondViewController alloc] init];
    secondViewController.data = _label.text;
    secondViewController.delegate = self;
    [self.navigationController pushViewController:secondViewController animated:YES];
}

- (void)dataFromController:(NSString *)data
{
    _label.text = data;
    _button.enabled = NO;
}


@end