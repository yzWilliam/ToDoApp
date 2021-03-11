//
//  DetailVC.m
//  ToDoApp
//
//  Created by Zhiwei Yu on 3/9/21.
//

#import "DetailVC.h"
#import "ViewController.h"

@interface DetailVC ()

@end

@implementation DetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.titleTextView.text = self.post.title;
    self.bodyTextView.text = self.post.body;
    if (self.isUpdate) {
        [self.detailButton setTitle:@"Update" forState:UIControlStateNormal];
    } else {
        [self.detailButton setTitle:@"Add" forState:UIControlStateNormal];
    }
    
}

- (IBAction)updatePost:(UIButton *)sender {
    if (self.isUpdate) {
        [self.delegate update:self.index newTitle:self.titleTextView.text newBody:self.bodyTextView.text];
        [self.navigationController popViewControllerAnimated:YES];
    } else {
        Post *post = [[Post alloc] init];
        post.ID = 0;
        post.userId = 0;
        post.title = self.titleTextView.text;
        post.body = self.bodyTextView.text;
        [self.delegate add:post];
        [self.navigationController popViewControllerAnimated:YES];
    }
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
