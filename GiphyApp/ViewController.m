//
//  ViewController.m
//  GiphyApp
//
//  Created by Phanidhar Mothukuri on 2/9/15.
//  Copyright (c) 2015 PHAMOT. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"

@interface ViewController ()

@end

@implementation ViewController
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.googlePlacesArrayFromAFNetworking count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:  (NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    NSDictionary *tempDictionary= [self.googlePlacesArrayFromAFNetworking objectAtIndex:indexPath.row];
    
    cell.imageView.image = [UIImage imageNamed:[tempDictionary objectForKey:@"image"]];
    
    
  /*  if([tempDictionary objectForKey:@"rating"] != NULL)
    {
        cell.detailTextLabel.text = [NSString stringWithFormat:@"Rating: %@ of 5",[tempDictionary   objectForKey:@"rating"]];
    }
    else
    {
        cell.detailTextLabel.text = [NSString stringWithFormat:@"Not Rated"];
    }
*/    return cell;
}
-(void)makeGifRequests
{
    NSURL *url = [NSURL URLWithString:@"http://api.giphy.com/v1/gifs/search?q=funny+cat&api_key=dc6zaTOxFJmzC"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    //AFNetworking asynchronous url request
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
                                         
    operation.responseSerializer= [AFJSONResponseSerializer serializer];

    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation,  id responseObject)
                                         {
                                            self.googlePlacesArrayFromAFNetworking = [responseObject objectForKey:@"image"];
                                         //     [self.ViewController reloadData];
                                         }
                                         failure:^(AFHTTPRequestOperation *operation, NSError *error)
                                         {
                                             NSLog(@"Request Failed: %@, %@", error, error.userInfo);
                                         }];
    
    [operation start];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.finishedGooglePlacesArray = [[NSArray alloc] init];
  [self makeGifRequests];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
