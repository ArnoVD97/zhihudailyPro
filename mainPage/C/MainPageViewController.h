//
//  viewControllerMainPage.h
//  zhiHuDailyProgram
//
//  Created by zzy on 2022/10/18.
//

#import <UIKit/UIKit.h>
#import "MainPageView.h"
NS_ASSUME_NONNULL_BEGIN
//@protocol webDataDelegate <NSObject>
//
//- (void) webDataToDictionary:(NSDictionary*) webDataDictionary;
//
//@end
@interface MainPageViewController : UIViewController <BeforeDelegate, WKWebDelegate>
@property (nonatomic, strong) NSDictionary* modelDictionary;
@property (nonatomic, strong) NSDictionary* modelBeforeDictionary;
@property (nonatomic, strong) NSMutableArray* topUrlArray;
@property (nonatomic, strong) NSMutableArray* topTextArray;
@property (nonatomic, strong) NSMutableArray* topMsgArray;
@property (nonatomic, strong) NSMutableArray* topImageArray;
@property (nonatomic, strong) NSMutableArray* viewArray;
@property (nonatomic, strong) NSMutableArray* viewBeforeArray;
@property (nonatomic, strong) NSMutableArray* beforeDataMonth;
@property (nonatomic, strong) NSMutableArray* beforeDataDay;
@property (nonatomic, strong) NSMutableArray* oldNewsArray;
@property (nonatomic, assign) int beforeDay;
- (void)getBeforeDay;
@end

NS_ASSUME_NONNULL_END
