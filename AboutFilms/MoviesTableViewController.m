//
//  MoviesTableViewController.m
//  AboutFilms
//
//  Created by Arama Brown on 5/18/16.
//  Copyright © 2016 Arama Brown. All rights reserved.

//delegates 
//nsnotification broadcast to many and request  and the objects don't need to know about each other 

#import "MoviesTableViewController.h"
#import "NetworkManager.h"
#import "MovieTableViewCell.h"
#import "Review.h"

@interface MoviesTableViewController ()

@property(nonatomic)NSArray *movieLists;

@end

@implementation MoviesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   // @"open-date=2016-07-22"
    
    [[NetworkManager sharedManager] getMovies:@"2016-07-15;2016-07-22" completionBlock:^(NSArray *results){
    // 1. view loads 2. getMovies is called with date string and creates an array of results 3. with those results do this block, store in movieLists
        self.movieLists= [results copy]; //make a copy of results instead of assign
        
        [self.tableView reloadData];
    }];
    
    

    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark UITableViewDataSource methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.movieLists.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MovieTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MovieCell" forIndexPath:indexPath];
//    cell.MovieTitle.text = self.movieLists[indexPath.row].title;
    
    NSUInteger row = [indexPath indexAtPosition:1];
    Review *review = self.movieLists[row];
    
    cell.movieHeadline.text = review.headline;
    cell.movieTitle.text = review.title;
    
    UIImage *pic = [UIImage imageWithData:[NSData dataWithContentsOfURL:review.thumbNailUrl]];
    
    cell.movieImage.image = pic;
    //cell.movieImage.
    
    // Configure the cell...
    
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
