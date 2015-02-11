//
//  ViewController.h
//  GiphyApp
//
//  Created by Phanidhar Mothukuri on 2/9/15.
//  Copyright (c) 2015 PHAMOT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource>

@property (strong, nonatomic) NSArray *googlePlacesArrayFromAFNetworking;
@property (strong, nonatomic) NSArray *finishedGooglePlacesArray;

@end

