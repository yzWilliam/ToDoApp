//
//  PostVM.h
//  ToDoApp
//
//  Created by Zhiwei Yu on 3/9/21.
//

#import <Foundation/Foundation.h>
#import "Post.h"

NS_ASSUME_NONNULL_BEGIN

@interface PostVM : NSObject

- (void) getDataWithCompletionHandler:(void (^)(void))completionHandler;
- (NSInteger) getCount;
- (Post*) getPost: (NSInteger) index;
- (NSString*) getDescription: (NSInteger) index;
- (void) updatePost: (NSInteger) index newTitle: (NSString*) title newBody: (NSString*) body;
- (void) deletePost: (NSInteger) index;
- (void) addPost: (Post*) post;

@end

NS_ASSUME_NONNULL_END
