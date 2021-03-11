//
//  ViewController.h
//  ToDoApp
//
//  Created by Zhiwei Yu on 3/9/21.
//

#import <UIKit/UIKit.h>
#import "PostVM.h"
#import "DetailVC.h"

@interface ViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, PostVMDelegate>

@property (nonatomic, strong) PostVM *postVM;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

