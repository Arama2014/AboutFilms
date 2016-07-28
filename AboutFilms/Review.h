//
//  Review.h
//  AboutFilms
//
//  Created by Arama Brown on 6/21/16.
//  Copyright © 2016 Arama Brown. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Review : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) NSString *summary;
@property (nonatomic, assign) NSInteger criticsPick;
@property (nonatomic,strong) NSString *mpaaRating;
@property (nonatomic,strong) NSString *openingDate;
@property (nonatomic,strong) NSString *headline;
@property (nonatomic,strong) NSURL *thumbNailUrl;


//@property (nonatomic,strong)


@end
