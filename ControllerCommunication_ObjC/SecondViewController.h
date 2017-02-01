//
//  SecondViewController.h
//  ControllerCommunication_ObjC
//
//  Created by Torrey Betts on 5/29/14.
//  Copyright (c) 2014 Infragistics. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SecondViewControllerDelegate <NSObject>

@required
- (void)dataFromController:(NSString *)data;

@end

@interface SecondViewController : UIViewController

@property (nonatomic, retain) NSString *data;
@property (nonatomic, weak) id<SecondViewControllerDelegate> delegate;

@end
