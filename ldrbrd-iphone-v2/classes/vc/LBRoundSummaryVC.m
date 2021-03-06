//
//  LBRoundSummaryViewController.m
//  ldrbrd-iphone-v2
//
//  Created by John D. Gaffney on 5/12/14.
//  Copyright (c) 2014 gffny.com. All rights reserved.
//

#import "LBRoundSummaryVC.h"
#import "LBScorecardUtils.h"
#import "LBDataManager.h"
#import "LBRestManager.h"
#import "LBRestFacade.h"

@interface LBRoundSummaryVC ()

//score
@property (strong, nonatomic) IBOutlet UILabel *par;
@property (strong, nonatomic) IBOutlet UILabel *score;
@property (strong, nonatomic) IBOutlet UILabel *toParValue;

//hole result count
@property (strong, nonatomic) IBOutlet UILabel *belowParCountValue;
@property (strong, nonatomic) IBOutlet UILabel *parCountValue;
@property (strong, nonatomic) IBOutlet UILabel *bogeyCountValue;
@property (strong, nonatomic) IBOutlet UILabel *bogeyPlusCountValue;
@end


@implementation LBRoundSummaryVC

LBRestFacade *restFacade;

@synthesize submitScorecardBtn;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {

    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {

    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self loadViewWithScoreArray: [[LBDataManager sharedInstance] currentScoreArray] andCourse: [[LBDataManager sharedInstance] courseInPlay]];
    [self.submitScorecardBtn addTarget:self action:@selector(sbmtScrcrdBtnClckd:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)sbmtScrcrdBtnClckd:(UIButton *)sender {

    NSLog(@"submit scorecard button clicked");
    [restFacade asynchSubmitScorecard: [[LBDataManager sharedInstance] currentScoreArray] andScorecardId:[[LBDataManager sharedInstance] scorecardId] withSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"Scorecard Submit Success");
        // move to new screen
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Scorecard Submit Failure");
        
    }];

}

- (void) loadViewWithScoreArray: (NSArray*) scoreArray andCourse: (LBCourseDto*) course {

    int coursePar = course.par;
    int score = [LBScorecardUtils countScore: scoreArray];
    self.par.text = [NSString stringWithFormat:@"%i", coursePar];
    self.score.text = [NSString stringWithFormat:@"%i", score];
    if(score - coursePar > 0) {
        self.toParValue.text = [NSString stringWithFormat:@"+%i", (score-coursePar)];
    } else {
        self.toParValue.text = [NSString stringWithFormat:@"%i", (score-coursePar)];
    }
    self.parCountValue.text = [NSString stringWithFormat:@"%i", [LBScorecardUtils countPar:scoreArray onCourse: course]];
    self.bogeyCountValue.text = [NSString stringWithFormat:@"%i", [LBScorecardUtils countBogey:scoreArray onCourse: course]];
    self.bogeyPlusCountValue.text = [NSString stringWithFormat:@"%i", [LBScorecardUtils countBogeyPlus:scoreArray onCourse: course]];
    self.belowParCountValue.text = [NSString stringWithFormat:@"%i", [LBScorecardUtils countBelowPar:scoreArray onCourse: course]];
    
}

- (void)didReceiveMemoryWarning {

    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

@interface LBRoundSummaryHoleTableVC ()

@end

@implementation LBRoundSummaryHoleTableVC

@synthesize holeScoreArray;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {

    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {

    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.dataManager = [LBDataManager sharedInstance];
    self.holeScoreArray = self.dataManager.currentScoreArray;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.bounces = NO;
}

- (void)didReceiveMemoryWarning {

    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    #warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    #warning Incomplete method implementation.
    // Return the number of rows in the section.
    return self.holeScoreArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *cellIdentifier = @"LBRoundSummaryHoleCell";
    
    LBRoundSummaryHoleCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"LBRoundSummaryHoleCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    NSLog([NSString stringWithFormat:@" index path row %ld", [[NSNumber numberWithInteger: indexPath.row] longValue]]);
    LBCourseDto *course = [self.dataManager.courseInPlay courseHoleWithNumber:indexPath.row];
    cell.holeLabel.text = [NSString stringWithFormat:@"%li", (indexPath.row+1)];
    cell.scoreLabel.text = [NSString stringWithFormat:@"%i", [[self.holeScoreArray objectAtIndex:indexPath.row] integerValue]];
    cell.parLabel.text = [NSString stringWithFormat:@"%i", course.par];
    cell.indexLabel.text = [NSString stringWithFormat:@"%i", course.index];

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return 30;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    LBRoundSummaryHoleCell *cell = (LBRoundSummaryHoleCell*)[tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
}

@end

@interface LBRoundSummaryHoleCell()

@end

@implementation LBRoundSummaryHoleCell

@synthesize holeLabel;
@synthesize parLabel;
@synthesize indexLabel;
@synthesize scoreLabel;

@end
