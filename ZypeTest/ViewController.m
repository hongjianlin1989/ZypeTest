//
//  ViewController.m
//  ZypeTest
//
//  Created by hongjian lin on 1/26/16.
//  Copyright © 2016 com.zype. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"

#define BASE_URL @"http://api.stg-jkay.zype.com/videos/?api_key=D5BkNoOibALG3frYyyLH8Q"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView = ({
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
        tableView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleWidth;
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.opaque = NO;
        tableView.backgroundColor = [UIColor whiteColor];
        tableView.backgroundView = nil;
        tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        tableView.bounces = NO;
        tableView.scrollsToTop = NO;
        tableView;
    });
    [self.view addSubview:self.tableView];
    [self initValues];
    [self getMoviesFromUrl];

}


- (void) initValues
{
    _movieArray= [[NSMutableArray alloc] init];
}


- (void) parseMovie:(NSDictionary *) dic
{
    
    NSArray *response= [dic objectForKey:@"response"];
    
    for (NSDictionary *res in response) {
        Movie *movie= [[Movie alloc] init];
        movie.movie_id=[res objectForKey:@"_id"];
        movie.title= [res objectForKey:@"title"];
        NSArray *thumbnails=[res objectForKey:@"thumbnails"];
        if ([thumbnails count]>0) {
            NSDictionary *firstThum= [thumbnails objectAtIndex:0];
            movie.poster_path= [firstThum objectForKey:@"url"];
        }
        
        [_movieArray addObject:movie];
    }
    [self.tableView reloadData];
    
}

- (void) getMoviesFromUrl
{
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    NSString *url= [NSString stringWithFormat:@"%@",BASE_URL];
    
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject){
        NSDictionary * responseDic= responseObject;
        [self parseMovie:responseDic];
    } // success callback block
         failure:^(AFHTTPRequestOperation *operation, NSError *error){
             NSLog(@"Error: %@", error);} // failure callback block
     ];
    
}


#pragma mark - UITableViewDelegate

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 45.0f*SCREEN_WIDTH_RATIO;
}


-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 45*SCREEN_WIDTH_RATIO)];
    [view setBackgroundColor:[UIColor whiteColor]];
    
    UIFont *font= [UIFont fontWithName:@"System" size:(CGFloat)(12)];
    UILabel *nameLabel=[[UILabel alloc] init];
    nameLabel.frame= CGRectMake(80, 25, 160, 21);
    nameLabel.frame= [[Helper sharedInstance] resizeFrameWithFrame:nameLabel];
    nameLabel.font=font;
    nameLabel.textColor=[UIColor lightGrayColor];
    nameLabel.text=@"Movie List";
    nameLabel.textAlignment=NSTextAlignmentCenter;
    
    [view addSubview:nameLabel];
    return view;
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return [_movieArray count];
}



- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    MovieCell *cell =(MovieCell *) [tableView cellForRowAtIndexPath:indexPath];
    
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"MovieCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
        cell.movie=[_movieArray objectAtIndex:indexPath.row];
        [cell builtCell];
    }

    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView
estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120*SCREEN_WIDTH_RATIO;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    return 120*SCREEN_WIDTH_RATIO;
}



- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    // Get visible cells on table view.
    NSArray *visibleCells = [self.tableView visibleCells];
    
    for (MovieCell *cell in visibleCells) {
        [cell cellOnTableView:self.tableView didScrollOnView:self.view];
    }
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
