//
//  DetailVC.h
//  ToDoApp
//
//  Created by Zhiwei Yu on 3/9/21.
//

#import <UIKit/UIKit.h>
#import "Post.h"

NS_ASSUME_NONNULL_BEGIN

@protocol PostVMDelegate <NSObject>

- (void) update: (NSInteger) index newTitle: (NSString*) title newBody: (NSString*) body;
- (void) add: (Post*) post;

@end

@interface DetailVC : UIViewController

@property (strong, nonatomic) IBOutlet UITextView *titleTextView;
@property (strong, nonatomic) IBOutlet UITextView *bodyTextView;
@property (strong, nonatomic) IBOutlet UIButton *detailButton;
@property (strong, nonatomic) Post* post;
@property (assign, nonatomic) NSInteger index;
@property (assign, nonatomic) BOOL isUpdate;
@property (weak, nonatomic) id<PostVMDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
