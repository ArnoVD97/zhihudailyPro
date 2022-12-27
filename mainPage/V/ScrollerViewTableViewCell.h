//
//  tableViewCellScrollerView.h
//  zhiHuDailyProgram
//
//  Created by zzy on 2022/10/18.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ScrollerViewTableViewCell : UITableViewCell <UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView* infScrollView;
@property (nonatomic, strong) UIPageControl* pageControl;
@property (nonatomic, strong) NSMutableArray* pictureName;
@property (nonatomic, strong) UIImageView* picture;
@property (nonatomic, strong) UILabel* titleLabel;
@property (nonatomic, strong) UILabel* underLabel;
@property (nonatomic, strong) NSTimer* timer;
@end

NS_ASSUME_NONNULL_END
