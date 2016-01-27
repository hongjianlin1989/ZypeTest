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



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
