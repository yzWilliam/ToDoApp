//
//  Post.m
//  ToDoApp
//
//  Created by Zhiwei Yu on 3/9/21.
//

#import "Post.h"

@implementation Post

+(NSArray *)getParsedData:(NSArray *)responseArray {
    
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    
    for (NSDictionary *dictionary in responseArray) {
        
        NSInteger ID = [[dictionary objectForKey:@"id"] integerValue];
        NSInteger userId = [[dictionary objectForKey: @"userId"] integerValue];
        NSString *title = [dictionary objectForKey:@"title"];
        NSString *body = [dictionary objectForKey:@"body"];
        
        Post *post = [[Post alloc] init];
        post.ID = ID;
        post.userId = userId;
        post.title = title;
        post.body = body;
        [arr addObject:post];

    }
    
    return  [NSArray arrayWithArray:arr];
}

@end
