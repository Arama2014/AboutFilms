//
//  SessionManager.h
//  AboutFilms
//
//  Created by Arama Brown on 6/7/16.
//  Copyright © 2016 Arama Brown. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface SessionManager : AFHTTPSessionManager


+ (instancetype)sharedManager;
@end
