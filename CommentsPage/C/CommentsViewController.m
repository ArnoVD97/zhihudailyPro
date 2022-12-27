//
//  CommentsViewController.m
//  zhiHuDailyProgram
//
//  Created by zzy on 2022/11/13.
//

#import "CommentsViewController.h"
#import "CommentsView.h"
#import "Manager.h"
#import "CommentModel.h"
@interface CommentsViewController ()

@end

@implementation CommentsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.hidden = YES;
    self.commentView = [[CommentsView alloc] initWithFrame:self.view.bounds];
    [self getComment];
    
    self.commentView.delegate = self;
    [self.view addSubview: self.commentView];
}
- (void)chuButton:(UIButton *)button {

    [self.navigationController popViewControllerAnimated:YES];

}

- (void)getComment {
    [[Manager sharedManger] NetLongCommentWorkWithData:^(CommentModel * _Nonnull mainViewModel) {
        NSLog(@"请求成功");
        self.commentView.longDictionary = [[NSDictionary alloc] init];
        self.commentView.longDictionary = [mainViewModel toDictionary];
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [self getSecondComment];
        });
    } error:^(NSError * _Nonnull error) {
        NSLog(@"请求失败");
    } date:[NSString stringWithFormat:@"%@", _urlString]];
    
    
}
- (void)getSecondComment {
    [[Manager sharedManger] NetShortCommentWorkWithData:^(CommentModel * _Nonnull mainViewModel) {
        NSLog(@"请求成功");
        self.commentView.shortDictionary = [[NSDictionary alloc] init];
        self.commentView.shortDictionary = [mainViewModel toDictionary];
        dispatch_async(dispatch_get_main_queue(), ^{

            [self.commentView viewInit];
        });
    } error:^(NSError * _Nonnull error) {
        NSLog(@"请求失败");
    } date:[NSString stringWithFormat:@"%@", _urlString]];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
