//
//  PersonalTableViewCell.h
//  zhiHuDailyProgram
//
//  Created by zzy on 2022/11/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PersonalTableViewCell : UITableViewCell
@property (nonatomic, strong) UIImageView* titleImageView;
@property (nonatomic, strong) UILabel* titleLabel;
@property (nonatomic, strong) UILabel* msgLabel;
@end

NS_ASSUME_NONNULL_END
