//
//  MovieDetailViewController.m
//  AboutFilms
//
//  Created by Arama Brown on 8/2/16.
//  Copyright © 2016 Arama Brown. All rights reserved.
//

#import "MovieDetailViewController.h"

@implementation MovieDetailViewController


-(void)viewDidLoad
{
    [super viewDidLoad];
    
    self.movieTitle.text = self.movieObject.title;
    self.criticsPicks.text  = [NSString stringWithFormat:@"%i", self.movieObject.criticsPick];
    
    if(self.movieObject.openingDate!=(id)[NSNull null]){
    self.movieOpeningDate.text = self.movieObject.openingDate;
    };
    self.movieSummary.text = self.movieObject.summary;
    
    UIImage *pic = [UIImage imageWithData:[NSData dataWithContentsOfURL:self.movieObject.thumbNailUrl]];
    self.movieImage.image = pic;
    self.movieRating.text = self.movieObject.mpaaRating;
}




    





@end
