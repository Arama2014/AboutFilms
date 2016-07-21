//
//  NetworkManager.h
//  AboutFilms
//
//  Created by Arama Brown on 6/9/16.
//  Copyright © 2016 Arama Brown. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

@interface NetworkManager : NSObject
+ (instancetype)sharedManager;
//- (void)getMovies:(NSString*)searchTerm ;
- (void)getMovies:(NSString*)searchTerm completion:(void (^) (NSArray *results))completion;
@property (nonatomic,strong)NSMutableArray *reviews;

@end
