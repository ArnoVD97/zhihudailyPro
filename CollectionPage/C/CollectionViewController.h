//
//  CollectionViewController.h
//  zhiHuDailyProgram
//
//  Created by zzy on 2022/11/18.
//

#import <UIKit/UIKit.h>
#import "CollectionView.h"
NS_ASSUME_NONNULL_BEGIN

@interface CollectionViewController : UIViewController <thirdButtonDelegate,deleteDelegate,PushDelegate>
@property (nonatomic, strong) CollectionView* collectview;

@end

NS_ASSUME_NONNULL_END
