//
//  WebViewController.h
//  zhiHuDailyProgram
//
//  Created by zzy on 2022/11/4.
//

#import <UIKit/UIKit.h>
#import "WebView.h"

NS_ASSUME_NONNULL_BEGIN

@protocol BackAndGetMoreDelegate <NSObject>

- (void)getThereNew:(int)day;

@end


@interface WebViewController : UIViewController <wkWebButtonDelegate, extraDelegate, AgainDelegate>

@property (nonatomic, strong) WebView* wkWebView;
@property (nonatomic, assign) int clickNumber;
@property (nonatomic, strong) NSMutableArray *allArray;
@property (nonatomic, assign) int beforeDay;
@property (assign, nonatomic) id<BackAndGetMoreDelegate> delegate;

//判断从哪个界面跳转过来的
@property (nonatomic, assign) int pushViewController;
@end

NS_ASSUME_NONNULL_END


