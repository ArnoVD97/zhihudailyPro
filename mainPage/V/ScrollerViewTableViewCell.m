//
//  tableViewCellScrollerView.m
//  zhiHuDailyProgram
//
//  Created by zzy on 2022/10/18.
//

#import "ScrollerViewTableViewCell.h"
#import "Masonry.h"
#define Width [UIScreen mainScreen].bounds.size.width
#define Height [UIScreen mainScreen].bounds.size.height
@implementation ScrollerViewTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    _infScrollView = [[UIScrollView alloc] init];
    [self.contentView addSubview:_infScrollView];
    self.pageControl = [[UIPageControl alloc] init];
    _pageControl.numberOfPages = 5;
    _pageControl.currentPage = 0;
    _pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
    _pageControl.pageIndicatorTintColor = [UIColor grayColor];
    [self.contentView addSubview:_pageControl];
    
    _titleLabel = [[UILabel alloc] init];
    [self.infScrollView addSubview:_titleLabel];
    
    _underLabel = [[UILabel alloc] init];
    [self.infScrollView addSubview:_underLabel];
    
    return self;
}
- (void) layoutSubviews {
    _infScrollView.frame = CGRectMake(0, 0, Width, Width);
    _infScrollView.backgroundColor = [UIColor whiteColor];
    
    
    [_pageControl mas_makeConstraints:^(MASConstraintMaker* make) {
        make.top.equalTo(@375);
        make.left.equalTo(@(Width - (Width / 2)+30));
        make.width.equalTo(@250);
        make.height.equalTo(@20);
    }];
 

    self.infScrollView.pagingEnabled = YES;
    self.infScrollView.scrollEnabled = YES;
    self.infScrollView.contentSize = CGSizeMake(Width*7, Width);
    self.infScrollView.bounces = YES;
    self.infScrollView.alwaysBounceVertical = NO;
    self.infScrollView.alwaysBounceHorizontal = NO;
    self.infScrollView.showsVerticalScrollIndicator = NO;
    self.infScrollView.showsHorizontalScrollIndicator = NO;
    self.infScrollView.userInteractionEnabled = YES;
    self.infScrollView.delegate = self;
    
    if (_infScrollView.tag == 0) {
        [_infScrollView setContentOffset:CGPointMake(Width, 0) animated:NO];
    _infScrollView.tag = 1;
    }
}
//当scrollView停止滚动之后调用此方法
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if (scrollView.tag == 1) {
        //计算偏移量所对应的页数
        int page = _infScrollView.contentOffset.x / Width;
        if (page == 6) {
            _infScrollView.contentOffset = CGPointMake(Width * 1, 0);
            _pageControl.currentPage = 0;
        } else if (page == 0) {
            _infScrollView.contentOffset = CGPointMake(Width * 6, 0);
            _pageControl.currentPage = 5;
        } else {
            _pageControl.currentPage = page-1;
        }
    }
}

- (void) scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView.tag == 1) {
        //计算偏移量所对应的页数
        int page = _infScrollView.contentOffset.x / Width;
        if (page == 7) {
            _infScrollView.contentOffset = CGPointMake(Width * 1, 0);
            _pageControl.currentPage = 0;
        } else if (page == 0) {
            _infScrollView.contentOffset = CGPointMake(Width * 6, 0);
            _pageControl.currentPage = 5;
        } else {
            _pageControl.currentPage = page -1;
        }
    }
}
- (void)timeOut:(NSTimer*)timer {
    if (_infScrollView.contentOffset.x >= Width * 5) {
        [_infScrollView setContentOffset:CGPointMake(Width, 0) animated:YES];
    } else {
        [_infScrollView setContentOffset:CGPointMake(_infScrollView.contentOffset.x + Width, 0) animated:YES];
    }
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    if (scrollView.tag == 1) {
        [_timer invalidate];
        _timer = nil;
    }
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (scrollView.tag == 1) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(timeOut:) userInfo:nil repeats:YES];
        NSRunLoop *runloop = [NSRunLoop currentRunLoop];
        [runloop addTimer:_timer forMode:NSRunLoopCommonModes];
    }
}

@end
