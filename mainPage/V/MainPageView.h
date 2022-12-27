//
//  viewMainPage.h
//  zhiHuDailyProgram
//
//  Created by zzy on 2022/10/18.
//

#import <UIKit/UIKit.h>
//#import "MainPageViewController.h"

@protocol BeforeDelegate <NSObject>

-(void)getBefore;

@end
@protocol WKWebDelegate <NSObject>

- (void)getClickNumber:(int)clickNumber;

@end

NS_ASSUME_NONNULL_BEGIN

@interface MainPageView : UIView<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UIView* topView;
@property (nonatomic, strong) UIButton* headButton;
@property (nonatomic, strong) UILabel* titleLabel;
@property (nonatomic, strong) UITableView* mainTableView;
@property (nonatomic, strong) NSMutableArray* viewArray;
@property (nonatomic, strong) NSMutableArray* viewBeforeArray;
@property (nonatomic, strong) NSMutableArray* viewModelBeforeTimeArray;
@property (nonatomic, strong) NSMutableArray *oldNewsArray;
@property (nonatomic, assign) NSInteger j;
@property (nonatomic, assign) NSInteger beforeCellNumber;
@property (nonatomic, copy) NSDictionary* viewDictionary;
@property (nonatomic, copy) NSDictionary* viewBeforeDictionary;
@property (nonatomic, assign) NSInteger viewMonth;
@property (nonatomic, assign) NSInteger viewDay;
@property (nonatomic, assign) int beforeDay;

@property (nonatomic, strong) UIActivityIndicatorView* activityIndicatorView;
@property (assign, nonatomic) id<BeforeDelegate> delegate;
@property (assign, nonatomic) id<WKWebDelegate> thirdDelegate;
- (void)viewInit;
@end

NS_ASSUME_NONNULL_END
