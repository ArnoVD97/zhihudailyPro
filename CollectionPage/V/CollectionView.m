//
//  CollectionView.m
//  zhiHuDailyProgram
//
//  Created by zzy on 2022/11/18.
//

#import "CollectionView.h"
#import "Masonry.h"
#import "UIImageView+WebCache.h"
#import "CollectionTableViewCell.h"
#define SIZE_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SIZE_HEIGHT ([UIScreen mainScreen].bounds.size.height)

@implementation CollectionView

- (void)viewInit{
    _backButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_backButton setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"arrowLeft.png"]] forState:UIControlStateNormal];
    _backButton.tag = 0;
    [self addSubview:_backButton];
    NSSet* set = [UIApplication sharedApplication].connectedScenes;
    UIWindowScene* windoewScene = [set anyObject];
    UIStatusBarManager* statusBarManager = windoewScene.statusBarManager;
    
    [_backButton mas_makeConstraints:^(MASConstraintMaker* make) {
        if (statusBarManager.statusBarFrame.size.height < 30) {
            make.top.equalTo(self).offset(43-20);
        
        } else {
            make.top.equalTo(self).offset(43);
        }
        make.height.equalTo(@30);
        make.width.equalTo(@30);
        make.top.equalTo(self).offset(43);
        make.left.equalTo(self).offset(20);
}];
    [_backButton addTarget:self action:@selector(buttonReturn:) forControlEvents:UIControlEventTouchUpInside];
    [self initTableView];
}
- (void)initTableView {
    _tableView = [[UITableView alloc] init];
    _tableView.backgroundColor = [UIColor whiteColor];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorColor = [UIColor clearColor];
    _tableView.tag = 66;
    [self addSubview:_tableView];
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(100);
        make.height.equalTo(@(SIZE_HEIGHT - 100));
        make.width.equalTo(@(SIZE_WIDTH));
        make.left.equalTo(self).offset(0);
    }];
    [self.tableView registerClass:[CollectionTableViewCell class] forCellReuseIdentifier:@"collect"];
}
- (void)initScrollView {
    _scrollView = [[UIScrollView alloc] init];
    _scrollView.tag = 52;
    _scrollView.delegate = self;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.backgroundColor = [UIColor clearColor];
    [self addSubview:self.scrollView];
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.collectArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 120;
}
- (UITableViewCell* )tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CollectionTableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"collect" forIndexPath:indexPath];
    cell.bigLabel.text = self.collectArray[indexPath.row][@"mainLabel"];
    [cell.mainImageView sd_setImageWithURL:[NSURL URLWithString:[self.collectArray[indexPath.row][@"imageUrl"]stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]]]];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.pushDelegate getPushRow:indexPath.row];
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    [_secondDelegate getDeleteRow:indexPath.row];
}
- (void)buttonReturn:(UIButton* )button {
    [_delegate chuButton:button];
}/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
