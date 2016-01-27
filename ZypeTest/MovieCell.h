//
//  MovieCell.h
//  SwitchMovieGrid
//
//  Created by hongjian lin on 1/20/16.
//  Copyright © 2016 com.switch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movie.h"
#import "AsyncImageView.h"
#import "Helper.h"
#import "RTLabel.h"
@interface MovieCell : UITableViewCell


@property (nonatomic, retain) Movie * movie;
@property (nonatomic, retain) AsyncImageView *parallaxImage;
@property (nonatomic, retain) RTLabel *title;
@property (nonatomic, retain) UIView *baseView;

- (void)cellOnTableView:(UITableView *)tableView didScrollOnView:(UIView *)view;
- (void) builtCell;

@end
