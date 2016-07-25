//
//  MovieTableViewCell.h
//  AboutFilms
//
//  Created by Arama Brown on 7/6/16.
//  Copyright © 2016 Arama Brown. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieTableViewCell : UITableViewCell


@property (weak, nonatomic) IBOutlet UIImageView *movieImage;

@property (weak, nonatomic) IBOutlet UILabel *movieTitle;

@property (weak, nonatomic) IBOutlet UILabel *movieHeadline;

@end
