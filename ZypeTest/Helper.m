//
//  FitmooHelper.m
//  fitmoo
//
//  Created by hongjian lin on 4/7/15.
//  Copyright (c) 2015 com.fitmoo. All rights reserved.
//

#import "Helper.h"

@implementation Helper

+ (Helper*)sharedInstance
{
    static dispatch_once_t pred;
    static Helper *settings = nil;
    
    dispatch_once(&pred, ^{ settings = [[self alloc] init]; });
    return settings;
    
}


- (CGRect) resizeFrameWithFrame:(UIView *) view
{
    view.frame= CGRectMake(view.frame.origin.x * SCREEN_WIDTH_RATIO, view.frame.origin.y * SCREEN_WIDTH_RATIO, view.frame.size.width * SCREEN_WIDTH_RATIO, view.frame.size.height*SCREEN_WIDTH_RATIO);
    
    return view.frame;
}

- (id) init;{
    
    if ((self = [super init])) {
    }
    
    
    
    
    return self;
}


@end