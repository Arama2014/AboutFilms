//
//  MovieReviews.h
//  AboutFilms
//
//  Created by Arama Brown on 5/18/16.
//  Copyright © 2016 Arama Brown. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface MovieReviews : MTLModel<MTLJSONSerializing>


@property (nonatomic) NSString *movieTitle;
@property (nonatomic) NSString *rating;
@property (nonatomic) NSUInteger *criticsPick;
@property (nonatomic) NSString *headline;
@property (nonatomic) NSString *summary;
@property (nonatomic) NSDate *openingDate;
@property (nonatomic) NSURL *reviewLong;
@property (nonatomic) NSString *icon;

@end
