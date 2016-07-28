//
//  MoviesTableViewController.h
//  AboutFilms
//
//  Created by Arama Brown on 5/18/16.
//  Copyright © 2016 Arama Brown. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MoviesTableViewController : UITableViewController <UITableViewDataSource>
//moviestableviewcontroller is the delegate for the tableview  implements the methods that are defined by the UITableViewDataSource Protocol
//class implements a delegate by passing a method to my class, my class responds tableview does not own the controller. the controller owns the view
//and the view owns the tableview...
@end
