//
//  CommentsView.h
//  zhiHuDailyProgram
//
//  Created by zzy on 2022/11/13.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol commentButtonDelegate <NSObject>

- (void)chuButton:(UIButton *)button;

@end
@interface CommentsView : UIView<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UIButton* backButton;
@property (nonatomic, strong) UILabel* titleLabel;
@property (assign, nonatomic) id<commentButtonDelegate> delegate;
@property (nonatomic, strong) UITableView* tableView;
@property (nonatomic, strong) NSDictionary* longDictionary;
@property (nonatomic, strong) NSDictionary* shortDictionary;
- (void)viewInit;

@end

NS_ASSUME_NONNULL_END
