//
//  PersonalTableViewCell.m
//  zhiHuDailyProgram
//
//  Created by zzy on 2022/11/20.
//

#import "PersonalTableViewCell.h"
#import "Masonry.h"
#define Width [UIScreen mainScreen].bounds.size.width
#define Height [UIScreen mainScreen].bounds.size.height

@implementation PersonalTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.textAlignment = NSTextAlignmentLeft;
    _titleLabel.textColor = [UIColor blackColor];
    _titleLabel.numberOfLines = 2;
    [_titleLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:20]];
    [self.contentView addSubview:_titleLabel];
    
    _msgLabel = [[UILabel alloc] init];
    _msgLabel.textAlignment = NSTextAlignmentLeft;
    _msgLabel.textColor = [UIColor grayColor];
    _msgLabel.font = [UIFont systemFontOfSize:16];
    [self.contentView addSubview:_msgLabel];
    
    
    _titleImageView = [[UIImageView alloc] init];
    [self.contentView addSubview:_titleImageView];
    return self;
}
- (void) layoutSubviews {
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker* make) {
        make.top.equalTo(@15);
        make.left.equalTo(@20);
        make.width.equalTo(@(Width * 0.65));
        make.height.equalTo(@70);
    }];
    [self.titleImageView mas_makeConstraints:^(MASConstraintMaker* make) {
        make.top.equalTo(@20);
        make.left.equalTo(@(Width * 0.75));
        make.width.equalTo(@(Width * 0.21));
        make.height.equalTo(@(Width * 0.21));
    }];
    [self.msgLabel mas_makeConstraints:^(MASConstraintMaker* make) {
        make.top.equalTo(_titleLabel.mas_bottom).offset(6);
        make.left.equalTo(@20);
        make.width.equalTo(@(Width * 0.7));
        make.height.equalTo(@20);
    }];
}
@end
