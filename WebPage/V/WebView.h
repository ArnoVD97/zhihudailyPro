//
//  WebView.h
//  zhiHuDailyProgram
//
//  Created by zzy on 2022/11/4.
//

#import <UIKit/UIKit.h>
#import "WebKit/WebKit.h"


@protocol wkWebButtonDelegate <NSObject>

- (void)chuButton:(UIButton *)button;

@end

@protocol extraDelegate <NSObject>

- (void)getId:(id)extraId and:(NSString *)mainLabel and:(NSString *)imageUrl;

@end

@protocol AgainDelegate <NSObject>

- (void)againAllArray:(int)continueNum;

@end
@interface WebView : UIView <UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIButton *backButton;
@property (nonatomic, strong) UIButton *commentButton;
@property (nonatomic, strong) UILabel *commentLabel;
@property (nonatomic, strong) UIButton *goodButton;
@property (nonatomic, strong) UILabel *goodLabel;
@property (nonatomic, strong) UIButton *collectButton;
@property (nonatomic, strong) UIButton *shareButton;
@property (nonatomic, assign) int clickNumber;
@property (nonatomic, strong) NSMutableArray *allArray;
@property (nonatomic, strong) WKWebView *wkWebView;
@property (nonatomic, strong) NSDictionary *extraDictionary;
@property (nonatomic, strong) NSMutableString *urlString;


//判断从哪个界面跳转过来的
@property (nonatomic, assign) int pushViewController;

@property (assign, nonatomic) id<wkWebButtonDelegate> delegate;
@property (assign, nonatomic) id<extraDelegate> secondDelegate;
@property (assign, nonatomic) id<AgainDelegate> againDelegate;
- (void)viewInit;
- (void)scrollViewLocation;
- (void)scrollViewNextReload;
@end
