//
//  LBUpcomingRoundsTableVC.m
//  ldrbrd-iphone-v2
//
//  Created by John D. Gaffney on 4/3/14.
//  Copyright (c) 2014 gffny.com. All rights reserved.
//

#import "LBUpcomingRoundsTableVC.h"

@implementation LBUpcomingRoundsTableVC

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"UpcomingRound";
    
    switch ( indexPath.row )
    {
        case 0:
            CellIdentifier = @"UpcomingRound1";
            break;
            
        case 1:
            CellIdentifier = @"UpcomingRound2";
            break;
            
        case 2:
            CellIdentifier = @"UpcomingRound3";
            break;
            
        case 3:
            CellIdentifier = @"UpcomingRound4";
            break;
            
        case 4:
            CellIdentifier = @"UpcomingRound5";
            break;
    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: CellIdentifier forIndexPath: indexPath];
    
    return cell;
}

@end
