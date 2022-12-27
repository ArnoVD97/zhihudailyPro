//
//  modelMainPage.m
//  zhiHuDailyProgram
//
//  Created by zzy on 2022/10/18.
//

#import "MainPageModel.h"
#define Width [UIScreen mainScreen].bounds.size.width
#define Height [UIScreen mainScreen].bounds.size.height


@implementation MainPageModel
+ (BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}
@end

@implementation StoriesModel
+ (BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}
@end

@implementation Top_StoriesModel
+ (BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}
@end
