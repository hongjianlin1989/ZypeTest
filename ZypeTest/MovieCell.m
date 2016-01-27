//
//  MovieCell.m
//  SwitchMovieGrid
//
//  Created by hongjian lin on 1/20/16.
//  Copyright © 2016 com.switch. All rights reserved.
//

#import "MovieCell.h"

@implementation MovieCell

- (void)awakeFromNib {
    [[self.contentView subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    
   
  

}

- (void) builtCell
{
    _baseView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320*SCREEN_WIDTH_RATIO,120*SCREEN_WIDTH_RATIO)];
    _baseView.backgroundColor= [UIColor lightGrayColor];
    _baseView.clipsToBounds=YES;
    _parallaxImage= [[AsyncImageView alloc] initWithFrame:CGRectMake(0, -40, 320*SCREEN_WIDTH_RATIO,200*SCREEN_WIDTH_RATIO)];
   
    [[AsyncImageLoader sharedLoader] cancelLoadingImagesForTarget:_parallaxImage];
    _parallaxImage.imageURL =[NSURL URLWithString:_movie.poster_path];
  
    _title=[[RTLabel alloc] initWithFrame:CGRectMake(20*SCREEN_WIDTH_RATIO, 80*SCREEN_WIDTH_RATIO, 270*SCREEN_WIDTH_RATIO,100)];
    [_title setText:[NSString stringWithFormat:@"<a href=''><font face='HelveticaNeue-CondensedBold' size=14 color='#FFFFFF'><p>%@</p></font></a>",_movie.title]];
    CGSize optimumSize =[_title optimumSize];
    _title.frame=CGRectMake(_title.frame.origin.x, _title.frame.origin.y, optimumSize.width, optimumSize.height+10);

    [self.baseView addSubview:_parallaxImage];
    [self.contentView addSubview:_baseView];
    [self.contentView addSubview:_title];
}

- (void)cellOnTableView:(UITableView *)tableView didScrollOnView:(UIView *)view
{
    CGRect rectInSuperview = [tableView convertRect:self.frame toView:view];
    
    CGFloat distanceFromCenter = CGRectGetHeight(view.frame)/2 - CGRectGetMinY(rectInSuperview);
    CGFloat difference = CGRectGetHeight(self.parallaxImage.frame) - CGRectGetHeight(self.frame);
    CGFloat move = (distanceFromCenter / CGRectGetHeight(view.frame)) * difference;
    
    CGRect imageRect = self.parallaxImage.frame;
    imageRect.origin.y = -(difference/2)+move;
    self.parallaxImage.frame = imageRect;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
