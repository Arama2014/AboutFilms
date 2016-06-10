//
//  NetworkManager.m
//  AboutFilms
//
//  Created by Arama Brown on 6/9/16.
//  Copyright © 2016 Arama Brown. All rights reserved.
//

#import "NetworkManager.h"

static NSString * const NYTkey = @"458d12afb57140d7bb1181f1ecc4c6a7";
static NSString * const NYTUrl = @"https://api.nytimes.com/svc/movies/v2/reviews/";

@interface NetworkManager()
@property (nonatomic, strong) AFHTTPSessionManager *sessionManager;
@end

@implementation NetworkManager

+ (instancetype)sharedManager {
    static NetworkManager *sharedManager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[NetworkManager alloc] init];
        [sharedManager setupInstance];
    });
    return sharedManager;
}


-(void)setupInstance {
    NSURL *baseURL = [NSURL URLWithString:NYTUrl];
    self.sessionManager = [[AFHTTPSessionManager alloc] initWithBaseURL:baseURL];

    self.sessionManager.requestSerializer = [AFJSONRequestSerializer serializer];
    [self.sessionManager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];

    AFSecurityPolicy* policy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    [policy setValidatesDomainName:NO];
    [policy setAllowInvalidCertificates:YES];

    self.sessionManager.securityPolicy = policy;
}

- (void)getMovies:(NSString*)searchTerm {
    NSAssert(searchTerm != nil, @"");
    NSString *path = @"search.json";
    NSDictionary *params = @{
                             @"api-key" : NYTkey,
                             @"query" : searchTerm
                             };

    [self.sessionManager GET:path parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *response = [NSDictionary dictionaryWithDictionary:responseObject];
        NSArray *resultMovieList = [NSArray arrayWithArray:response[@"results"]];
        // Take each NSDictionary in this array "results", and make them into a movie object.
        NSLog(@"This is a list of the movies: %@", resultMovieList);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"This error happened: %@", error.localizedDescription);
    }];
}

@end

