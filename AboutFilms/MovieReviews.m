//
//  MovieReviews.m
//  AboutFilms
//
//  Created by Arama Brown on 5/18/16.
//  Copyright © 2016 Arama Brown. All rights reserved.
//

#import "MovieReviews.h"

@implementation MovieReviews


+ (NSDictionary *)JSONKeyPathsByPropertyKey{
    return @{
             
            @"movieTitle": @"display_title ",
            @"rating":@"mpaa_rating ",
            @"criticsPick":@"critics_pick",
            @"headline": @"headline",
            @"summary": @"summary_short",
            @"openingDate":@"opening_date",
            @"reviewURL":@"link.url",
            @"icon":@"multimedia.src"
             
             
             
             };
}


+ (NSValueTransformer *) reviewURLJSONTransformer{
    return [NSValueTransformer valueTransformerForName: MTLURLValueTransformerName];
}


+ (NSDateFormatter*) dateFormatter{
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc ]init];
    dateFormatter.dateFormat = @"yyyy-MM-dd";
    return dateFormatter;
}


+(NSValueTransformer *)openingDateJSONTransformer{
    return [MTLValueTransformer transformerUsingForwardBlock:^id (NSString *dateString, BOOL *success, NSError **error ) {
        return [self.dateFormatter dateFromString:dateString];
        
    }];

}

@end
