//
//  modelMainPage.h
//  zhiHuDailyProgram
//
//  Created by zzy on 2022/10/18.
//

//#import <Foundation/Foundation.h>

@protocol StoriesModel
@end

@protocol Top_StoriesModel
@end

#import "JSONModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface StoriesModel : JSONModel
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSArray  *images;
@property (nonatomic, copy) NSString *hint;
@property (nonatomic, copy) NSString *image_hue;
@property (nonatomic, copy) NSString* ga_prefix;
@property (nonatomic, copy) NSString* type;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *id;
@end

@interface Top_StoriesModel : JSONModel
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *image;
@property (nonatomic, copy) NSString *hint;
@property (nonatomic, copy) NSString *image_hue;
@property (nonatomic, copy) NSString* ga_prefix;
@property (nonatomic, copy) NSString* type;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *id;
@end

@interface MainPageModel : JSONModel
@property (nonatomic, copy) NSString *date;
@property (nonatomic, copy) NSArray<StoriesModel> *stories;
@property (nonatomic, copy) NSArray<Top_StoriesModel> *top_stories;
@end

NS_ASSUME_NONNULL_END

