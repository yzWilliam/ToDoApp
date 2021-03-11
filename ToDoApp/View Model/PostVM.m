//
//  PostVM.m
//  ToDoApp
//
//  Created by Zhiwei Yu on 3/9/21.
//

#import "PostVM.h"
#import "APIHandler.h"

@interface PostVM()

@property (nonatomic, strong) NSArray *array;
@property (nonatomic, strong) NSError *error;

@end

@implementation PostVM

- (void) getDataWithCompletionHandler: (void (^)(void)) completionHandler {
    
    [[APIHandler sharedInstance] getDataWithCompletionHandler:^(NSArray * _Nullable array, NSError * _Nullable error) {
        self.array = array;
        self.error = error;
        completionHandler();
    }];

}

- (NSInteger) getCount {
    return self.array.count;
}

- (Post*) getPost: (NSInteger) index {
    return self.array[index];
}

- (NSString*) getDescription: (NSInteger) index {
    Post* post = [self getPost:index];
    return [NSString stringWithFormat:@"%ld. %@", (long)post.ID, post.title];
}

- (void) updatePost: (NSInteger) index newTitle: (NSString*) title newBody: (NSString*) body {
    Post* post = [self getPost:index];
    post.title = title;
    post.body = body;
}

- (void) deletePost: (NSInteger) index {
    NSMutableArray *newArray = [NSMutableArray arrayWithArray:self.array];
    [newArray removeObjectAtIndex:index];
    self.array = [NSArray arrayWithArray:newArray];
}

- (void) addPost: (Post*) post {
    NSMutableArray *newArray = [NSMutableArray arrayWithArray:self.array];
    [newArray addObject:post];
    self.array = [NSArray arrayWithArray:newArray];
}

@end
