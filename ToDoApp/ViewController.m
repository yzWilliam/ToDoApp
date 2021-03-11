//
//  ViewController.m
//  ToDoApp
//
//  Created by Zhiwei Yu on 3/9/21.
//

#import "ViewController.h"
#import "Post.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Add" style:UIBarButtonItemStylePlain target:self action:@selector(addPost:)];
    
    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];
    
    self.postVM = [PostVM new];
    [self.postVM getDataWithCompletionHandler: ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    }];
}

- (void)viewWillAppear:(BOOL)animated {
    [self.tableView reloadData];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cell = [UITableViewCell new];
    cell.textLabel.text = [self.postVM getDescription:indexPath.row];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.postVM.getCount;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DetailVC* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailVC"];
    vc.post = [self.postVM getPost:indexPath.row];
    vc.index = indexPath.row;
    vc.isUpdate = YES;
    vc.delegate = self;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.postVM deletePost:indexPath.row];
        [self.tableView reloadData];
    }
}

- (void) update: (NSInteger) index newTitle: (NSString*) title newBody: (NSString*) body {
    [self.postVM updatePost:index newTitle:title newBody:body];
}

- (void) addPost: (UIBarButtonItem *) sender {
    DetailVC* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailVC"];
    vc.delegate = self;
    vc.isUpdate = NO;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void) add: (Post*) post {
    [self.postVM addPost:post];
}

@end
