//
//  PersonalView.h
//  zhiHuDailyProgram
//
//  Created by zzy on 2022/11/1.
//

#import <UIKit/UIKit.h>
@protocol secondButtonDelegate <NSObject>

- (void)chuButton:(UIButton *)button;

@end
NS_ASSUME_NONNULL_BEGIN

@interface PersonalView : UIView
- (void) personalViewInit;
@property (nonatomic, strong) UIButton* backButton;
@property (nonatomic, strong) UILabel* nameLabel;
@property (nonatomic, strong) UIImageView* headImageView;
@property (nonatomic, strong) UITableView* personalTableView;
@property (nonatomic, strong) UIButton *firstButton;
@property (nonatomic, strong) UIButton *secondButton;
@property (nonatomic, strong) UILabel *firstLabel;
@property (nonatomic, strong) UILabel *secondLabel;
@property (nonatomic, strong) UIView *firstView;
@property (nonatomic, strong) UIView *secondView;
@property (nonatomic, strong) UIImageView *firstImageView;
@property (nonatomic, strong) UIImageView *secondImageView;

@property (assign, nonatomic) id<secondButtonDelegate> delegate;
- (void)viewInit;
@end

NS_ASSUME_NONNULL_END
