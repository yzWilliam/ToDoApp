//
//  APIHandler.m
//  ToDoApp
//
//  Created by Zhiwei Yu on 3/9/21.
//

#import "APIHandler.h"
#import "Post.h"

@implementation APIHandler

+ (instancetype) sharedInstance {
    static dispatch_once_t once;
    static id sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [self new];
    });
    return sharedInstance;
}

- (void) getDataWithCompletionHandler: (void (^)(NSArray * _Nullable array, NSError * _Nullable error)) completionHandler {
    NSURLSession *session = [NSURLSession sharedSession];
    NSURL *url = [[NSURL alloc] initWithString:@"https://jsonplaceholder.typicode.com/posts"];
    
    [[session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        //status code is 200 and < 300
        if (error == nil && data != nil) {
            
            //parse data now
            
            NSArray *resp = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
            NSArray *arrOfPostObject = [Post getParsedData:resp];
            completionHandler(arrOfPostObject, error);
        } else {
            completionHandler(nil, error);
        }
                
        }] resume];
}

@end
