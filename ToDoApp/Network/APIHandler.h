//
//  APIHandler.h
//  ToDoApp
//
//  Created by Zhiwei Yu on 3/9/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface APIHandler : NSObject

+ (instancetype) sharedInstance;
- (void) getDataWithCompletionHandler: (void (^)(NSArray * _Nullable array, NSError * _Nullable error)) completionHandler;

@end

NS_ASSUME_NONNULL_END
