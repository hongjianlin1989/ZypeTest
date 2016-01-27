//
//  ViewController.h
//  ZypeTest
//
//  Created by hongjian lin on 1/26/16.
//  Copyright © 2016 com.zype. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Helper.h"
#import "MovieCell.h"
#import "RTLabel.h"
#import "UIScrollView+APParallaxHeader.h"
@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,APParallaxViewDelegate>

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *movieArray;
@property (assign, nonatomic)  int count;


@end

