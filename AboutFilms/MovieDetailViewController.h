//
//  MovieDetailViewController.h
//  AboutFilms
//
//  Created by Arama Brown on 8/2/16.
//  Copyright © 2016 Arama Brown. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Review.h"
#import "MoviesTableViewController.h"

@interface MovieDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *movieImage;
@property (weak, nonatomic) IBOutlet UILabel *movieTitle;
@property (weak, nonatomic) IBOutlet UILabel *criticsPicks;
@property (strong) Review *movieObject;
@property (weak, nonatomic) IBOutlet UILabel *movieOpeningDate;
@property (weak, nonatomic) IBOutlet UILabel *movieRating;

@property (weak, nonatomic) IBOutlet UILabel *movieSummary;



@end
