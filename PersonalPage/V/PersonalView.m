//
//  PersonalView.m
//  zhiHuDailyProgram
//
//  Created by zzy on 2022/11/1.
//

#import "PersonalView.h"
#import "Masonry.h"

#define Width [UIScreen mainScreen].bounds.size.width
#define Height [UIScreen mainScreen].bounds.size.height
#define SIZE_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SIZE_HEIGHT ([UIScreen mainScreen].bounds.size.height)
@implementation PersonalView

- (void)viewInit{
    self.backgroundColor = [UIColor whiteColor];
    _backButton = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    _backButton.frame = CGRectMake(10, 40, 50, 50);
    [_backButton setImage:[UIImage imageNamed:@"arrowLeft.png"] forState:UIControlStateNormal];
    _backButton.tintColor = [UIColor darkGrayColor];
    [_backButton addTarget:self action:@selector(buttonReturn:) forControlEvents:UIControlEventTouchUpInside];
    _backButton.tag = 0;
    [self addSubview:_backButton];
    
    
    _headImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"head.jpg"]];
    [_headImageView.layer setMasksToBounds:YES];
    [_headImageView.layer setCornerRadius:32.0];
    [self addSubview:_headImageView];
   [ _headImageView mas_makeConstraints:^(MASConstraintMaker* make) {
       make.top.equalTo(@85);
       make.left.equalTo(@(Width/2-52.5));
       make.width.equalTo(@105);
       make.height.equalTo(@105);
   }];
    _nameLabel = [[UILabel alloc] init];
    _nameLabel.text = @"漓江塔塔主";
    _nameLabel.textColor = [UIColor blackColor];
    _nameLabel.backgroundColor = [UIColor clearColor];
    [_nameLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:28]];
    [self addSubview:_nameLabel];
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker* make) {
        make.top.equalTo(@120);
        make.left.equalTo(@(Width/2-75));
        make.width.equalTo(@200);
        make.height.equalTo(@200);
    }];
    
    _firstButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_firstButton addTarget:self action:@selector(buttonReturn:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_firstButton];
    _firstButton.tag = 1;
    [_firstButton mas_makeConstraints:^(MASConstraintMaker* make) {
        make.height.equalTo(@60);
        make.width.equalTo(@SIZE_WIDTH);
        make.top.equalTo(self).offset(240);
        make.left.equalTo(self).offset(0);
    }];
    
    _secondButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_secondButton addTarget:self action:@selector(buttonReturn:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_secondButton];
    _secondButton.tag = 2;
    [_secondButton mas_makeConstraints:^(MASConstraintMaker* make) {
        make.height.equalTo(@60);
        make.width.equalTo(@SIZE_WIDTH);
        make.top.equalTo(self).offset(301);
        make.left.equalTo(self).offset(0);
    }];
    
    _firstLabel = [[UILabel alloc] init];
    _firstLabel.text = @"我的收藏";
    _firstLabel.font = [UIFont systemFontOfSize:20];
    [self.firstButton addSubview:_firstLabel];
    [_firstLabel mas_makeConstraints:^(MASConstraintMaker* make) {
        make.height.equalTo(@60);
        make.width.equalTo(@100);
        make.top.mas_offset(0);
        make.left.mas_offset(30);
    }];
    
    _secondLabel = [[UILabel alloc] init];
    _secondLabel.text = @"消息中心";
    _secondLabel.font = [UIFont systemFontOfSize:20];
    [self.secondButton addSubview:_secondLabel];
    [_secondLabel mas_makeConstraints:^(MASConstraintMaker* make) {
        make.height.equalTo(@60);
        make.width.equalTo(@100);
        make.top.mas_offset(0);
        make.left.mas_offset(30);
    }];
    
    _firstView = [[UIView alloc] init];
    _firstView.backgroundColor = [UIColor colorWithRed:(238.0f / 255.0f) green:(238.0f / 255.0f)blue:(238.0f / 255.0f) alpha:1.0f];
    [self addSubview:_firstView];
    [_firstView mas_makeConstraints:^(MASConstraintMaker* make) {
        make.height.equalTo(@1);
        make.width.equalTo(@SIZE_WIDTH);
        make.top.mas_offset(239);
        make.left.mas_offset(0);
    }];
    
    _secondView = [[UIView alloc] init];
    _secondView.backgroundColor = [UIColor colorWithRed:(238.0f / 255.0f) green:(238.0f / 255.0f)blue:(238.0f / 255.0f) alpha:1.0f];
    [self addSubview:_secondView];
    [_secondView mas_makeConstraints:^(MASConstraintMaker* make) {
        make.height.equalTo(@1);
        make.width.equalTo(@SIZE_WIDTH);
        make.top.mas_offset(300);
        make.left.mas_offset(0);
    }];
    
    _firstImageView = [[UIImageView alloc] init];
    [_firstImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"next.png"]]];
    [self.firstButton addSubview:_firstImageView];
    [_firstImageView mas_makeConstraints:^(MASConstraintMaker* make) {
        make.height.equalTo(@24);
        make.width.equalTo(@24);
        make.top.mas_offset(18);
        make.right.mas_offset(-30);
    }];
    
    _secondImageView = [[UIImageView alloc] init];
    [_secondImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"next.png"]]];
    [self.secondButton addSubview:_secondImageView];
    [_secondImageView mas_makeConstraints:^(MASConstraintMaker* make) {
        make.height.equalTo(@24);
        make.width.equalTo(@24);
        make.top.mas_offset(18);
        make.right.mas_offset(-30);
    }];

}
- (void)buttonReturn:(UIButton *)button {
    [_delegate chuButton:button];
}

@end
