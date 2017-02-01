//
//  SecondViewController.m
//  ControllerCommunication_ObjC
//
//  Created by Torrey Betts on 5/29/14.
//  Copyright (c) 2014 Infragistics. All rights reserved.
//

#import "SecondViewController.h"

@implementation SecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = @"2nd Controller";
    self.view.backgroundColor = [UIColor whiteColor];
    [self createViews];
}

- (void)createViews
{
    CGRect top, bottom;
    CGRectDivide(self.view.bounds, &top, &bottom, self.view.bounds.size.height / 2, CGRectMinYEdge);

    UILabel *label = [[UILabel alloc] initWithFrame:CGRectInset(top, 5, 5)];
    label.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth|
            UIViewAutoresizingFlexibleBottomMargin;
    label.textAlignment = NSTextAlignmentCenter;
    label.text = [NSString stringWithFormat:@"Your data: %@", _data];
    [self.view addSubview:label];

    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(0, 0, 300, 100);
    button.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight|
            UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleLeftMargin|
            UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleTopMargin;
    [button setTitle:@"Send Data Back" forState:UIControlStateNormal];
    button.center = CGPointMake(CGRectGetMidX(bottom), CGRectGetMidY(bottom));
    [self.view addSubview:button];

    [button addTarget:self action:@selector(passDataBack) forControlEvents:UIControlEventTouchUpInside];
}

- (void)passDataBack
{
    if ([_delegate respondsToSelector:@selector(dataFromController:)])
    {
        [_delegate dataFromController:@"This data is from the second view controller."];
    }

    [self.navigationController popViewControllerAnimated:YES];
}

@end
