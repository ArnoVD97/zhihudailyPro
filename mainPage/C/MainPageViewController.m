//
//  viewControllerMainPage.m
//  zhiHuDailyProgram
//
//  Created by zzy on 2022/10/18.
//

#import "MainPageViewController.h"
#import "MainPageModel.h"
#import "Manager.h"
#import "ScrollerViewTableViewCell.h"
#import "MainPageTableViewCell.h"
#import "PersonalViewController.h"
#import "WebViewController.h"


#define Width [UIScreen mainScreen].bounds.size.width
#define Height [UIScreen mainScreen].bounds.size.height

@interface MainPageViewController ()

@property (nonatomic, strong) MainPageView* mainview;
@property (nonatomic, strong) MainPageModel* mainModel;
@property (nonatomic, strong) PersonalViewController* personalViewController;
@property (nonatomic, strong) WebViewController* webViewController;
@property (nonatomic, strong) ScrollerViewTableViewCell* cellScroller;
@property (nonatomic, strong) UITableView* tableViewMain;
@property (nonatomic, strong) UITableView* tableViewScroll;
@property (nonatomic, strong) UIScrollView* mainScrollerView;
@property (nonatomic, strong) UIScrollView* infScrollView;
@property (nonatomic, strong) MainPageTableViewCell* cellMain;
@property (nonatomic, strong) UINavigationBar* navigationTop;
@property (nonatomic, strong) NSMutableArray *allArray;


@property (nonatomic, assign) int flag;
@end

@implementation MainPageViewController
int i = 0;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _allArray = [[NSMutableArray alloc] init];
    self.navigationController.navigationBar.hidden = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    _flag = 0;
    _mainview = [[MainPageView alloc] initWithFrame:CGRectMake(0, 0, Width, Height)];
    self.mainview.delegate = self;
    self.mainview.viewBeforeArray = [[NSMutableArray alloc] init];
    _viewBeforeArray = [[NSMutableArray alloc] init];
    [self.view addSubview:_mainview];
    _modelDictionary = [[NSDictionary alloc] init];
    self-> _modelBeforeDictionary = [[NSDictionary alloc] init];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pressHead:) name:@"pressHead" object:nil];

    self.mainview.thirdDelegate = self;
    
    [self netWorkRequest];
//    [self netWorkBeforeRequest];
//    [self beforeNetworkRequest];
    
}

- (void) netWorkRequest {
    [[Manager sharedManger] NetWorkTestWithData:^(MainPageModel* _Nonnull mainViewModel) {

        self->_modelDictionary = [[NSDictionary alloc] init];
        self->_modelDictionary = [mainViewModel toDictionary];
        self.mainview.viewDictionary = self->_modelDictionary;
        self->_viewArray = [[NSMutableArray alloc] init];
        [self->_viewArray addObject:self->_modelDictionary];
        [self->_allArray addObject:[mainViewModel toDictionary]];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self netWorkBeforeRequest];
                });
        self.mainview.viewArray = self->_viewArray;
        
        } error:^(NSError* _Nonnull error) {
            NSLog(@"error");
            
        }];
}

- (void)netWorkBeforeRequest {

    NSDate *senddate = [NSDate dateWithTimeIntervalSinceNow: - 24 * 3600 * (_beforeDay)];
        NSCalendar *cal = [NSCalendar  currentCalendar];
        NSUInteger unitFlags = NSCalendarUnitDay|NSCalendarUnitMonth|NSCalendarUnitYear;
        NSDateComponents *conponent = [cal components:unitFlags fromDate:senddate];
        NSInteger year = [conponent year];
        NSInteger month = [conponent month];
        NSInteger day = [conponent day];
        NSString *nowTimeString = [NSString stringWithFormat:@"%ld%02ld%02ld", year, month, day];

    _mainview.viewMonth = month;
    _mainview.viewDay = day;
    [[Manager sharedManger] NetWorkBeforeWithData:^(MainPageModel* _Nonnull mainViewModel) {
        
        self-> _modelBeforeDictionary = [mainViewModel toDictionary];
        [self->_viewBeforeArray addObject:self->_modelBeforeDictionary];
        self.mainview.viewBeforeArray = self-> _viewBeforeArray;
            self.mainview.viewBeforeDictionary = self->_modelBeforeDictionary;
        self.mainview.j = _beforeDay;
        [self->_allArray addObject:self->_modelBeforeDictionary];
        dispatch_async(dispatch_get_main_queue(), ^{
            if (self->_flag == 0) {
                [self.mainview viewInit];
                self->_flag = 1;
            }
            self.mainview.beforeDay++;
            NSDictionary *dictionary = [mainViewModel toDictionary];
            //[self->_allArray addObject:dictionary];
            if (self.mainview.activityIndicatorView.animating) {
                [self.mainview.activityIndicatorView stopAnimating];
             } else {
                self.mainview.beforeDay--;
                [self.mainview.mainTableView reloadData];
            }
                });
        
        NSLog(@"+++++++++++++++++++=%@",self->_allArray);
    } error:^(NSError* _Nonnull error) {
        
    } jsonBeforeDay:nowTimeString];
}
//- (void)beforeNetworkRequest {
//    NSDate *senddate = [NSDate dateWithTimeIntervalSinceNow: - 1.0 * 24 * 3600 * (_beforeDay - 1)];
//    NSCalendar  *cal = [NSCalendar  currentCalendar];
//    NSUInteger  unitFlags = NSCalendarUnitDay|NSCalendarUnitMonth|NSCalendarUnitYear;
//    NSDateComponents *conponent = [cal components:unitFlags fromDate:senddate];
//    NSInteger year = [conponent year];
//    NSInteger month = [conponent month];
//    NSInteger day = [conponent day];
//    NSString *nowTimeString = [NSString stringWithFormat:@"%ld%02ld%02ld", year, month, day];
//    _mainview.viewMonth = month;
//    _mainview.viewDay = day;
//
//    [[Manager sharedManger] NetOldWorkWithData:^(MainPageModel * _Nonnull mainViewModel) {
//        NSLog(@"请求成功");
//
//        // 异步执行任务创建方法
//        NSLog(@"%@",nowTimeString);
//        dispatch_async(dispatch_get_main_queue(), ^{
//
//            [self.mainview.viewBeforeArray addObject:[mainViewModel toDictionary]];
//            self.mainview.beforeDay++;
//
//            if (self.mainview.viewBeforeArray.count >= self.mainview.beforeDay) {
//                [self.mainview.mainTableView reloadData];
//            } else {
//                self.mainview.beforeDay--;
//                [self.mainview.mainTableView reloadData];
//            }
//
//            NSDictionary *dictionary = [mainViewModel toDictionary];
//
//
//            [self->_allArray addObject:dictionary];
//            if (self.mainview.activityIndicatorView.animating) {
//                [self.mainview.activityIndicatorView stopAnimating];
//            }
//        });
//
//        NSLog(@"+++++++++++++++++++=%@",self->_allArray);
//    } error:^(NSError * _Nonnull error) {
//        NSLog(@"请求失败");
//    } date:nowTimeString];
//
//}

- (void)getClickNumber:(int)clickNumber {
    _webViewController = [[WebViewController alloc] init];
    _webViewController.delegate = self;
    if (_allArray[0][@"top_stories"] == nil) {
        NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
        dictionary = _allArray[0];
        _allArray[0] = _allArray[1];
        _allArray[1] = dictionary;
    }
    _webViewController.clickNumber = clickNumber;
    _webViewController.allArray = _allArray;
    _webViewController.beforeDay = _beforeDay;
    _webViewController.pushViewController = 0;
    [self.navigationController pushViewController:_webViewController animated:YES];
}

- (void)getBefore {
    _beforeDay++;
    [self netWorkBeforeRequest];
}
- (void)pressHead:(NSNotification*)notification {
     _personalViewController = [[PersonalViewController alloc] init];
    _personalViewController.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:_personalViewController animated:YES completion:nil];
}
- (void)getThereNew:(int)day {
    _beforeDay += day;
    [self netWorkBeforeRequest];
}
@end
