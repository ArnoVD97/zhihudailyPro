//
//  Manager.m
//  zhiHuDailyProgram
//
//  Created by zzy on 2022/10/19.
//

#import "Manager.h"




static Manager *manager = nil;

@implementation Manager
+ (instancetype)sharedManger {
    if (!manager){
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            manager = [Manager new];
        });
    }
    return manager;
}

- (void)NetWorkTestWithData:(TestSuccessBlock)succeedBlock error:(ErrorBlock)errorBlock {
    NSString *json = @"https://news-at.zhihu.com/api/4/news/latest";
    json = [json stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    NSURL *testUrl = [NSURL URLWithString:json];
    NSURLRequest *testRequest = [NSURLRequest requestWithURL:testUrl];
    NSURLSession *testSession = [NSURLSession sharedSession];
    NSURLSessionDataTask *testDataTask = [testSession dataTaskWithRequest:testRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil) {
            MainPageModel *country = [[MainPageModel alloc] initWithData:data error:nil];
            succeedBlock(country);
        } else {
            errorBlock(error);
        }
        }];
        [testDataTask resume];
}

- (void) NetWorkBeforeWithData:(TestSuccessBlock)succeedBlock error:(ErrorBlock)errorBlock jsonBeforeDay:(NSString *)beforeDay {
    NSString *json = [NSString stringWithFormat: @"https://news-at.zhihu.com/api/4/news/before/%@",beforeDay];
    json = [json stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    NSURL *testUrl = [NSURL URLWithString:json];
    NSURLRequest *testRequest = [NSURLRequest requestWithURL:testUrl];
    NSURLSession *testSession = [NSURLSession sharedSession];
    NSURLSessionDataTask *testDataTask = [testSession dataTaskWithRequest:testRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil) {
            MainPageModel *country = [[MainPageModel alloc] initWithData:data error:nil];
            succeedBlock(country);
        } else {
            errorBlock(error);
        }
        }];
        [testDataTask resume];
}
- (void)NetExtraWorkWithData:(secondDataBlock) dataBlock error:(ErrorBlock) errorBlock date:(NSString*)dateString {
    NSString *string = [NSString stringWithFormat:@"https://news-at.zhihu.com/api/4/story-extra/%@", dateString];
    string = [string stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    NSURL *url = [NSURL URLWithString:string];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil) {
            WebModel *country = [[WebModel alloc] initWithData:data error:nil];
            dataBlock(country);
        } else {
            errorBlock(error);
        }
    }];
    [dataTask resume];
}
- (void)NetOldWorkWithData:(TestSuccessBlock) dataBlock error:(ErrorBlock) errorBlock date:(NSString*)dateString {
    NSString *string = [NSString stringWithFormat:@"https://news-at.zhihu.com/api/4/news/before/%@", dateString];
    string = [string stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    NSURL *url = [NSURL URLWithString:string];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil) {
            MainPageModel *country = [[MainPageModel alloc] initWithData:data error:nil];
            dataBlock(country);
        } else {
            errorBlock(error);
        }
    }];
    [dataTask resume];
}
//长评论
- (void)NetLongCommentWorkWithData:(commentDataBlock) dataBlock error:(ErrorBlock) errorBlock date:(NSString*)dateString {
    NSString *string = [NSString stringWithFormat:@"https://news-at.zhihu.com/api/4/story/%@/long-comments", dateString];
    string = [string stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    NSURL *url = [NSURL URLWithString:string];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil) {
            CommentModel *country = [[CommentModel alloc] initWithData:data error:nil];
            dataBlock(country);
        } else {
            errorBlock(error);
        }
    }];
    [dataTask resume];
}
//短评论
- (void)NetShortCommentWorkWithData:(commentDataBlock) dataBlock error:(ErrorBlock) errorBlock date:(NSString*)dateString {
    NSString *string = [NSString stringWithFormat:@"https://news-at.zhihu.com/api/4/story/%@/short-comments", dateString];
    string = [string stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    NSURL *url = [NSURL URLWithString:string];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil) {
            CommentModel *country = [[CommentModel alloc] initWithData:data error:nil];
            dataBlock(country);
        } else {
            errorBlock(error);
        }
    }];
    [dataTask resume];
}
@end
