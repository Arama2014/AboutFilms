//
//  NetworkManager.m
//  AboutFilms
//
//  Created by Arama Brown on 6/9/16.
//  Copyright © 2016 Arama Brown. All rights reserved.
//

#import "NetworkManager.h"
#import "Review.h"

static NSString * const NYTkey = @"458d12afb57140d7bb1181f1ecc4c6a7";
static NSString * const NYTUrl = @"https://api.nytimes.com/svc/movies/v2/reviews/";

@interface NetworkManager()
@property (nonatomic, strong) AFHTTPSessionManager *sessionManager;
@end

@implementation NetworkManager

#pragma mark - Class Methods.

+ (instancetype)sharedManager {
    static NetworkManager *sharedManager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[NetworkManager alloc] init];
        [sharedManager setupInstance];
    });
    return sharedManager;
}

#pragma mark - Instance Methods.


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

- (void)getMovies:(NSString*)searchTerm completionBlock:(void (^) (NSArray *results))completion
{
    dispatch_queue_t backgroundQueue = dispatch_get_global_queue(QOS_CLASS_BACKGROUND, 0);
    
    dispatch_async(backgroundQueue, ^{

        NSAssert(searchTerm != nil, @"searchTerm != nil");//assert that search term is not nil, if it's not nil,it keeps going to the next line
        NSString *path = @"search.json";   // @"open-date=2016-07-22";
        NSDictionary *params = @{
                                 @"api-key" : NYTkey,
                                 @"opening-date" : searchTerm
                                 };
        
        void (^successBlock)(NSURLSessionDataTask*, id) = ^(NSURLSessionDataTask *task, _Nullable id responseObject)
        {
            NSDictionary *response = [NSDictionary dictionaryWithDictionary:responseObject];// create NSDictionary with Json responseObject and store it in the NSDictionary variable response
            NSArray *resultMovieList = [NSArray arrayWithArray:response[@"results"]]; //get the array of dictionaries that are at the results key of the response dictionary
            //and store it in the NSArray variable resultMovieList
            
            // Take each NSDictionary in this array "results", and make them into a movie object.
            //NSLog(@"This is a list of the movies: %@", resultMovieList);
            
            self.reviews = [NSMutableArray array];
            
            for (NSDictionary *dict in resultMovieList) {// for each dictionary in the resultMovieList array of dictionaries, we create a movie review object, set the properties
                //instantiate a Review, assign the properties from the dictionary, add to reviewS property
                Review *movieReview = [[Review alloc]init];
                movieReview.title = [dict objectForKey:@"display_title"];
                movieReview.summary =[dict objectForKey:@"summary_short"];
                movieReview.criticsPick =[[dict objectForKey:@"critics_pick"] integerValue];
                movieReview.mpaaRating= [dict objectForKey:@"mpaa_rating"];
                movieReview.openingDate = [dict objectForKey:@"opening_date"];
                movieReview.headline = [dict objectForKey: @"headline"];
                [self.reviews addObject:movieReview]; //adding our movieReview object to our list of moviereview objects
            }

            // By here, the network call is finished and we have our results.
            
            dispatch_async(dispatch_get_main_queue(), ^{
                completion(self.reviews);
            });
        };
        
        void (^failureBlock)(NSURLSessionDataTask*, id) = ^(NSURLSessionDataTask * _Nullable task, NSError *error) {
            NSLog(@"This error happened: %@", error.localizedDescription);
        };
        
        [self.sessionManager GET:path
                      parameters:params
                         success:successBlock
                         failure:failureBlock];

    }); // end of dispatch_async
    
}

@end

