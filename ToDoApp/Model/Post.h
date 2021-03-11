//
//  Post.h
//  ToDoApp
//
//  Created by Zhiwei Yu on 3/9/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Post : NSObject

@property (nonatomic, assign) NSInteger userId;
@property (nonatomic, assign) NSInteger ID;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *body;

+ (NSArray *) getParsedData: (NSArray *) responseArray;

@end

NS_ASSUME_NONNULL_END
