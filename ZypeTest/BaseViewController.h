//
//  BaseViewController.h
//  ZypeTest
//
//  Created by hongjian lin on 1/27/16.
//  Copyright © 2016 com.zype. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieCell.h"
#import "Helper.h"
@interface BaseViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) UILabel *titleLabel;
@end
