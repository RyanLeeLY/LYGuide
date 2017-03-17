//
//  MyTableViewController.m
//  LYIntroductionDemo
//
//  Created by 李尧 on 2016/11/27.
//  Copyright © 2016年 ryanleely. All rights reserved.
//

#import "MyTableViewController.h"
#import "LYGuide.h"
#import "LYGuideConfig.h"

@interface MyTableViewController ()

@end

@implementation MyTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
    NSIndexPath *index =  [NSIndexPath indexPathForItem:2 inSection:0];
    UITableViewCell *cell =  [self.tableView cellForRowAtIndexPath:index];
    NSLog(@"table view cell. %f,%f,%f,%f", cell.frame.origin.x, cell.frame.origin.y, cell.frame.size.width, cell.frame.size.height);
    NSLog(@"table view ly frame cell. %f,%f,%f,%f", cell.ly_absolute_frame.origin.x, cell.ly_absolute_frame.origin.y, cell.ly_absolute_frame.size.width, cell.ly_absolute_frame.size.height);
    
    LYGuide *guide = [LYGuide guideWithText:@"Test1Test1Test1Test1Test1" target:cell.ly_absolute_frame handler:^(LYGuide *guide, BOOL onHint) {
        if(onHint){
            [guide dismiss];  //Dissmiss the introduction tutorial
            NSLog(@"Tap on hint");
        }else{
            NSLog(@"Not Tap on hint");
        }
    }];
    guide.borderScale = CGSizeMake(1, 1.3);
    [guide show];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell==nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
