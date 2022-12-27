//
//  TimeTableViewCell.m
//  zhiHuDailyProgram
//
//  Created by zzy on 2022/10/27.
//

#import "TimeTableViewCell.h"
#import "Masonry.h"
#define Width [UIScreen mainScreen].bounds.size.width
#define Height [UIScreen mainScreen].bounds.size.height
@implementation TimeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    _month = [[UILabel alloc] init];
    [self.contentView addSubview:_month];
    
    _day = [[UILabel alloc] init];
    [self.contentView addSubview:_day];
    
    _heng = [[UIView alloc] init];
    [self.contentView addSubview:_heng];
    
    return  self;
}
- (void) layoutSubviews {
    [_month mas_makeConstraints:^(MASConstraintMaker* make) {
        make.top.equalTo(@5);
        make.left.equalTo(@20);
        make.width.equalTo(@70);
        make.height.equalTo(@20);
    }];
    [_day mas_makeConstraints:^(MASConstraintMaker* make) {
        make.top.equalTo(@5);
        make.left.equalTo(@60);
        make.width.equalTo(@70);
        make.height.equalTo(@20);
    }];
    [_heng mas_makeConstraints:^(MASConstraintMaker* make) {
        make.top.equalTo(@15);
        make.left.equalTo(@115);
        make.width.equalTo(@(Width-130));
        make.height.equalTo(@2);
    }];
}

@end
