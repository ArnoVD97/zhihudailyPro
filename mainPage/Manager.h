//
//  Manager.h
//  zhiHuDailyProgram
//
//  Created by zzy on 2022/10/19.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h""
#import "MainPageModel.h"
#import "WebModel.h"
#import "CommentModel.h"
NS_ASSUME_NONNULL_BEGIN
typedef void (^TestSuccessBlock) (MainPageModel * _Nonnull mainViewModel);
typedef void (^ErrorBlock) (NSError * _Nonnull error);
//返回web
typedef void (^secondDataBlock) (WebModel* _Nonnull mainModel);


//返回评论
typedef void (^commentDataBlock) (CommentModel* _Nonnull mainModel);
@interface Manager : NSObject

+ (instancetype)sharedManger;
- (void)NetWorkTestWithData:(TestSuccessBlock) succeedBlock error:(ErrorBlock) errorBlock;
- (void) NetWorkBeforeWithData:(TestSuccessBlock)succeedBlock error:(ErrorBlock)errorBlock jsonBeforeDay:(NSString*) json;
- (void)NetExtraWorkWithData:(secondDataBlock) dataBlock error:(ErrorBlock) errorBlock date:(NSString*)dateString;
- (void)NetOldWorkWithData:(TestSuccessBlock) dataBlock error:(ErrorBlock) errorBlock date:(NSString*)dateString;
- (void)NetLongCommentWorkWithData:(commentDataBlock) dataBlock error:(ErrorBlock) errorBlock date:(NSString*)dateString;
- (void)NetShortCommentWorkWithData:(commentDataBlock) dataBlock error:(ErrorBlock) errorBlock date:(NSString*)dateString;
@end

NS_ASSUME_NONNULL_END
