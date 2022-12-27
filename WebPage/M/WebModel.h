//
//  WebModel.h
//  zhiHuDailyProgram
//
//  Created by zzy on 2022/11/10.
//

#import "JSONModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface WebModel : JSONModel

@property (nonatomic, assign) int long_comments;
@property (nonatomic, assign) int popularity;
@property (nonatomic, assign) int short_comments;
@property (nonatomic, assign) int comments;
@end

NS_ASSUME_NONNULL_END
