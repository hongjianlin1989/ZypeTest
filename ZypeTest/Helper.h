//
//  FitmooHelper.h
//  fitmoo
//
//  Created by hongjian lin on 4/7/15.
//  Copyright (c) 2015 com.fitmoo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Helper.h"
#define UA_rgba(r,g,b,a)				[UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define UA_rgb(r,g,b)					UA_rgba(r, g, b, 1.0f)


#define SCREEN_WIDTH ((([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait) || ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown)) ? [[UIScreen mainScreen] bounds].size.width : [[UIScreen mainScreen] bounds].size.height)
#define SCREEN_HEIGHT ((([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait) || ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown)) ? [[UIScreen mainScreen] bounds].size.height : [[UIScreen mainScreen] bounds].size.width)

#define SCREEN_WIDTH_RATIO ((([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait) || ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown)) ? [[UIScreen mainScreen] bounds].size.width : [[UIScreen mainScreen] bounds].size.height)/320

#define LOCAL_NOTE(name,obj) [[NSNotificationCenter defaultCenter] postNotificationName:name object:obj];



@interface Helper : NSObject{
    
}
+ (Helper*) sharedInstance;

- (UIView *) addActivityIndicatorView: (UIView *)indicatorView and:(UIView *) selfView text:(NSString *) text;
- (CGRect) resizeFrameWithFrame:(UIView *) view;


@end