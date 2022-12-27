//
//  viewMainPage.m
//  zhiHuDailyProgram
//
//  Created by zzy on 2022/10/18.
//

#import "MainPageView.h"
#import "Masonry.h"
#import "PersonalViewController.h"
#import "MainPageViewController.h"
#import "ScrollerViewTableViewCell.h"
#import "MainPageTableViewCell.h"
#import "TimeTableViewCell.h"
#import "BlankTableViewCell.h"
#import "UIImageView+WebCache.h"

#define Width [UIScreen mainScreen].bounds.size.width
#define Height [UIScreen mainScreen].bounds.size.height
@implementation MainPageView
- (void)viewInit {
    self.backgroundColor = [UIColor grayColor];
    _topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Width, 110)];
    _topView.backgroundColor = [UIColor whiteColor];
    [self addSubview: _topView];
    
    NSDate *date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSInteger Flags = NSCalendarUnitYear |NSCalendarUnitMonth |NSCalendarUnitDay |NSCalendarUnitWeekday |NSCalendarUnitHour |NSCalendarUnitMinute |NSCalendarUnitSecond;
    comps = [calendar components:Flags fromDate:date];
    NSArray* monthArray = [[NSArray alloc] init];
    monthArray = [NSArray arrayWithObjects:@"一月", @"二月", @"三月", @"四月", @"五月", @"六月", @"七月", @"八月", @"九月", @"十月", @"十一月", @"十二月", nil];
    NSInteger month = [comps month];
    NSInteger day = [comps day];
    
    
    UILabel* dayLabel = [[UILabel alloc] init];
    dayLabel.text = [NSString stringWithFormat:@"%ld",(long)day];
    [dayLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:24]];
    dayLabel.textColor = [UIColor blackColor];
    dayLabel.textAlignment = NSTextAlignmentCenter;
    dayLabel.backgroundColor = [UIColor clearColor];
    [self.topView addSubview:dayLabel];
    [dayLabel mas_makeConstraints:^(MASConstraintMaker* make) {
        make.top.equalTo(@50);
        make.left.equalTo(@10);
        make.width.equalTo(@60);
        make.height.equalTo(@30);
    }];
    UILabel* monthLabel = [[UILabel alloc] init];
    monthLabel.text = monthArray[month - 1];
    [monthLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:14]];
    monthLabel.textColor = [UIColor blackColor];
    monthLabel.textAlignment = NSTextAlignmentCenter;
    monthLabel.backgroundColor = [UIColor clearColor];
    [self.topView addSubview:monthLabel];
    [monthLabel mas_makeConstraints:^(MASConstraintMaker* make) {
        make.top.equalTo(@75);
        make.left.equalTo(@10);
        make.width.equalTo(@60);
        make.height.equalTo(@25);

    }];
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.text = @"知乎日报";
    _titleLabel.textColor = [UIColor blackColor];
    _titleLabel.backgroundColor = [UIColor clearColor];
    [_titleLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:31]];
    _titleLabel.textAlignment = NSTextAlignmentLeft;
    [self.topView addSubview:_titleLabel];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker* make) {
            make.top.equalTo(@55);
            make.left.equalTo(@87);
            make.width.equalTo(@200);
            make.height.equalTo(@40);
            
    }];
    
    
    _headButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [_headButton setImage:[UIImage imageNamed:@"head.jpg"] forState:UIControlStateNormal];
    [_headButton.layer setMasksToBounds:YES];
    [_headButton addTarget:self action:@selector(personalPageIn) forControlEvents:UIControlEventTouchUpInside];
    [_headButton.layer setCornerRadius:23.0];
    [self.topView addSubview:_headButton];
    [_headButton mas_makeConstraints:^(MASConstraintMaker* make) {
        make.top.equalTo(@50);
        make.left.equalTo(@350);
        make.width.equalTo(@46);
        make.height.equalTo(@46);
    }];
    
    UIView* gang = [[UIView alloc] init];
    gang.backgroundColor = [UIColor grayColor];
    [self.topView addSubview:gang];
    [gang mas_makeConstraints:^(MASConstraintMaker* make) {
        make.top.equalTo(@50);
        make.left.equalTo(@70);
        make.width.equalTo(@2);
        make.height.equalTo(@50);
    }];
    
    
    
    self.mainTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 110, Width, Height-110) style:UITableViewStylePlain];
 
    _mainTableView.backgroundColor = [UIColor whiteColor];
    _mainTableView.delegate = self;
    _mainTableView.dataSource = self;
    _mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _mainTableView.tag = 1;
    [self addSubview:_mainTableView];
    [_mainTableView registerClass:[ScrollerViewTableViewCell class] forCellReuseIdentifier:@"scrollCell"];
    [_mainTableView registerClass:[MainPageTableViewCell class] forCellReuseIdentifier:@"mainCell"];
    [_mainTableView registerClass:[TimeTableViewCell class] forCellReuseIdentifier:@"timeCell"];
    [_mainTableView registerClass:[BlankTableViewCell class] forCellReuseIdentifier:@"blankCell"];
    
    

    

}
- (CGFloat) tableView:(UITableView* )tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    if(indexPath.section == 0 && indexPath.row == 0) {
        return Width;
    } else if (indexPath.section == 1) {
        return 140;
    } else if (indexPath.section == 3) {
        return 140;
    }else {
        if (indexPath.row % 7 == 0) {
            return 30;
        } else {
            return 140;
        }

    }
}
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }else if (section == 1) {
        return [_viewArray[0][@"stories"] count];
    } else if (section == 3) {
        return 1;
    } else {
        return ([_viewBeforeArray[0][@"stories"] count] + 1)* _viewBeforeArray.count;
    }

}

- (void)pressImage:(UITapGestureRecognizer *)gestureRecognizer {
    NSLog(@"%ld",gestureRecognizer.view.tag - 1);
    int clickNumber;
    if (gestureRecognizer.view.tag == 0) {
        clickNumber = 4;
    } else if (gestureRecognizer.view.tag == 6){
        clickNumber = 0;
    } else {
        clickNumber = (int)gestureRecognizer.view.tag - 1;
    }
    
    [_thirdDelegate getClickNumber:clickNumber];
}
- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    
    if (indexPath.row == 0 && indexPath.section == 0) {
        ScrollerViewTableViewCell* mainCell = [self.mainTableView dequeueReusableCellWithIdentifier:@"scrollCell" forIndexPath:indexPath];
        mainCell.backgroundColor = [UIColor clearColor];

        NSString* top = [[NSString alloc] init];
        top = _viewDictionary[@"top_stories"][4][@"image"];
        NSURL* topImageUrl = [NSURL URLWithString:top];
        UIImage* topImage = [UIImage imageWithData:[NSData dataWithContentsOfURL:topImageUrl]];
        UIImageView* topImageView = [[UIImageView alloc] initWithImage:topImage];
        topImageView.frame = CGRectMake(Width*(0), 0, Width, Width);
        [mainCell.infScrollView addSubview:topImageView];
        
        UILabel* titleTopLabel = [[UILabel alloc] init];
        titleTopLabel.textColor = [UIColor whiteColor];
        [titleTopLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:26]];
        titleTopLabel.textAlignment = NSTextAlignmentLeft;
        titleTopLabel.lineBreakMode = NSLineBreakByCharWrapping;
        titleTopLabel.numberOfLines = 0;
        titleTopLabel.text = _viewDictionary[@"top_stories"][4][@"title"];
        titleTopLabel.frame = CGRectMake(Width*(0) + 20,300, Width, 100);
        [mainCell.infScrollView addSubview:titleTopLabel];
        UILabel* hintTopLabel = [[UILabel alloc] init];
        [hintTopLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:16]];
        hintTopLabel.textColor = [UIColor colorWithWhite:0.9 alpha:1];
        hintTopLabel.text = _viewDictionary[@"top_stories"][4][@"hint"];
        hintTopLabel.frame = CGRectMake(Width*(0)+20, 380, Width-40, 30);
        [mainCell.infScrollView addSubview:hintTopLabel];
        for (int i = 0; i < 5; i++) {
            NSString* pictureName = [[NSString alloc] init];
            pictureName = _viewDictionary[@"top_stories"][i][@"image"];
           
            
            NSURL* imageUrl = [NSURL URLWithString:pictureName];
            
            UIImage* mainImg = [UIImage imageWithData:[NSData dataWithContentsOfURL:imageUrl]];
            UIImageView* mainImgView = [[UIImageView alloc] initWithImage:mainImg];
            mainImgView.frame = CGRectMake(Width*(i+1), 0, Width, Width);
            [mainCell.infScrollView addSubview:mainImgView];
            mainImgView.userInteractionEnabled = YES;
            mainImgView.tag = i+1;
            UITapGestureRecognizer *singleTap =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(pressImage:)];
            [mainImgView addGestureRecognizer:singleTap];
            UILabel* titleLabel = [[UILabel alloc] init];
            titleLabel.textColor = [UIColor whiteColor];
            [titleLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:26]];
            titleLabel.textAlignment = NSTextAlignmentLeft;
            titleLabel.lineBreakMode = NSLineBreakByCharWrapping;
            titleLabel.numberOfLines = 0;
            titleLabel.text = _viewDictionary[@"top_stories"][i][@"title"];
            titleLabel.frame = CGRectMake(Width*(i+1) + 20,300, Width-40, 100);
            [mainCell.infScrollView addSubview:titleLabel];
            UILabel* hintLabel = [[UILabel alloc] init];
            [hintLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:16]];
            hintLabel.textColor = [UIColor colorWithWhite:0.9 alpha:1];
            hintLabel.text = _viewDictionary[@"top_stories"][i][@"hint"];
            hintLabel.frame = CGRectMake(Width*(i+1) + 20, 380, Width-40, 30);
            [mainCell.infScrollView addSubview:hintLabel];
        }
        NSString* bottom = [[NSString alloc] init];
        bottom = _viewDictionary[@"top_stories"][0][@"image"];
        NSURL* bottomImageUrl = [NSURL URLWithString:bottom];
        UIImage* bottomImage = [UIImage imageWithData:[NSData dataWithContentsOfURL:bottomImageUrl]];
        UIImageView* bottomImageView = [[UIImageView alloc] initWithImage:bottomImage];
        bottomImageView.frame = CGRectMake(Width*(6), 0, Width, Width);
        [mainCell.infScrollView addSubview:bottomImageView];
        UILabel* titleBottomLabel = [[UILabel alloc] init];
        titleBottomLabel.textColor = [UIColor whiteColor];
        [titleBottomLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:26]];
        titleBottomLabel.textAlignment = NSTextAlignmentLeft;
        titleBottomLabel.lineBreakMode = NSLineBreakByCharWrapping;
        titleBottomLabel.numberOfLines = 0;
        titleBottomLabel.text = _viewDictionary[@"top_stories"][0][@"title"];
        titleBottomLabel.frame = CGRectMake(Width*(6)+20,300, Width-40, 100);
        [mainCell.infScrollView addSubview:titleBottomLabel];
        UILabel* hintBottomLabel = [[UILabel alloc] init];
        [hintBottomLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:16]];
        hintBottomLabel.textColor = [UIColor colorWithWhite:0.9 alpha:1];
        hintBottomLabel.text = _viewDictionary[@"top_stories"][0][@"hint"];
        hintBottomLabel.frame = CGRectMake(Width*(6)+20, 380, Width-40, 30);
        [mainCell.infScrollView addSubview:hintBottomLabel];
        return mainCell;
    } else if (indexPath.section == 1) {
        MainPageTableViewCell* mainCell = [self.mainTableView dequeueReusableCellWithIdentifier:@"mainCell" forIndexPath:indexPath];
            mainCell.backgroundColor = [UIColor whiteColor];
            mainCell.titleLabel.text = _viewDictionary[@"stories"][indexPath.row][@"title"];
            NSString* imageString = [[NSString alloc] init];
            imageString = self.viewDictionary[@"stories"][indexPath.row][@"images"][0];
            NSURL* imageUrl = [NSURL URLWithString:imageString];
            UIImage* image = [UIImage imageWithData:[NSData dataWithContentsOfURL:imageUrl]];
            mainCell.titleImageView.image = image;
            [mainCell.contentView addSubview:mainCell.titleImageView];

            
            mainCell.msgLabel.text = _viewDictionary[@"stories"][indexPath.row][@"hint"];
        return mainCell;
    } else if (indexPath.section == 3) {
        BlankTableViewCell* mainCell = [self.mainTableView dequeueReusableCellWithIdentifier:@"blankCell" forIndexPath:indexPath];

        mainCell.selectionStyle = UITableViewCellSelectionStyleNone;
        _activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleLarge];
        _activityIndicatorView.backgroundColor = [UIColor whiteColor];
        [_activityIndicatorView startAnimating];
        
        [mainCell addSubview: _activityIndicatorView];
        _activityIndicatorView.frame = CGRectMake(Width / 2 - 8, 25, 15, 15);
        return mainCell;
       
    } else {
        if (indexPath.row % 7 == 0) {
            TimeTableViewCell *mainCell = [self.mainTableView dequeueReusableCellWithIdentifier:@"timeCell" forIndexPath:indexPath];
            
            NSDate *senddate = [NSDate dateWithTimeIntervalSinceNow: - 24 * 3600 * (indexPath.row / 7 + 1)];
            NSCalendar  *cal = [NSCalendar  currentCalendar];
            NSUInteger  unitFlags = NSCalendarUnitDay|NSCalendarUnitMonth|NSCalendarUnitYear;
            NSDateComponents *conponent = [cal components:unitFlags fromDate:senddate];
            NSInteger month = [conponent month];
            NSInteger day = [conponent day];
            mainCell.month.text = [NSString stringWithFormat:@"%ld月",(NSInteger)month];
            mainCell.day.text = [NSString stringWithFormat:@"%ld日",(NSInteger)day];
      
            mainCell.heng.backgroundColor = [UIColor grayColor];


            return mainCell;
        } else {
            MainPageTableViewCell* mainCell = [self.mainTableView dequeueReusableCellWithIdentifier:@"mainCell" forIndexPath:indexPath];
            if (_viewBeforeArray[0][@"top_stories"] == nil) {
                NSDictionary *a =_viewBeforeArray[0][@"top_stories"][1];
                _viewBeforeArray[0][@"top_stories"][1] = _viewBeforeArray[0][@"top_stories"][0];
                _viewBeforeArray[0][@"top_stories"][0] = a;
            }
            mainCell.backgroundColor = [UIColor whiteColor];
            mainCell.titleLabel.text =_viewBeforeArray[indexPath.row / 7 ][@"stories"][indexPath.row%7-1][@"title"];
                NSString* imageString = [[NSString alloc] init];
                imageString = self.viewBeforeArray[indexPath.row/7][@"stories"][indexPath.row%7-1][@"images"][0];
                NSURL* imageUrl = [NSURL URLWithString:imageString];
                UIImage* image = [UIImage imageWithData:[NSData dataWithContentsOfURL:imageUrl]];
                mainCell.titleImageView.image = image;
                [mainCell.contentView addSubview:mainCell.titleImageView];
            mainCell.msgLabel.text = _viewBeforeArray[indexPath.row/7][@"stories"][indexPath.row%7-1][@"hint"];
            
            return mainCell;
        }

        
        
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (scrollView.tag == 1) {
        CGFloat height = scrollView.frame.size.height;
        CGFloat contentOffsetY = scrollView.contentOffset.y;
        CGFloat bottomOffset = scrollView.contentSize.height - contentOffsetY; //计算屏幕差
        if (bottomOffset <= height * 1.2) {



            [_delegate getBefore];
        }

    }
}
- (void)personalPageIn {
    NSNotification *notification = [NSNotification notificationWithName:@"pressHead" object:nil userInfo:nil];
    [[NSNotificationCenter defaultCenter] postNotification:notification];


}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    int clickNumber;
    if (indexPath.section == 1 || (indexPath.section == 2 && indexPath.row % 7 != 0)) {
        if (indexPath.section == 1) {
            clickNumber = (int)indexPath.row + 5;
        } else {
            clickNumber = (int)(indexPath.row / 7 + 1) * 6 + indexPath.row % 7 + 4;
        }
        [_thirdDelegate getClickNumber:clickNumber];
    }
    [self.mainTableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
