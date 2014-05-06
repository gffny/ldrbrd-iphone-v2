//
//  LBUpcomingRoundsTableVC.h
//  ldrbrd-iphone-v2
//
//  Created by John D. Gaffney on 4/3/14.
//  Copyright (c) 2014 gffny.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "lbMainVC.h"

@interface LBUpcomingRoundsTableVC : UITableViewController

@property (strong, nonatomic) lbMainVC *parentVC;

@property (strong, nonatomic) IBOutlet UITableView *upcomingRoundTable;

@end
