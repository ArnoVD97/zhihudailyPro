//
//  CommentsViewController.h
//  zhiHuDailyProgram
//
//  Created by zzy on 2022/11/13.
//

#import <UIKit/UIKit.h>

#import "CommentsView.h"
NS_ASSUME_NONNULL_BEGIN

@interface CommentsViewController : UIViewController<commentButtonDelegate>

@property (nonatomic, strong) CommentsView *commentView;
@property (nonatomic, strong) NSMutableString *urlString;


@end

NS_ASSUME_NONNULL_END
