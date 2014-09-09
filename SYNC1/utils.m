//
//  utils.m
//  SYNC1
//
//  Created by Peter Dunlop on 8/17/14.
//  Copyright (c) 2014 tpetdu. All rights reserved.
//

#import "utils.h"
#import <Foundation/Foundation.h>

@implementation utils

+ (void)sendRequest:(NSURL *)url dataForRequest:(NSData *)data connectionDelegate:(NSObject *) connectionDelegate
{
	// Create the request.
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    // Specify that it will be a POST request
    request.HTTPMethod = @"POST";
    
    // This is how we set header fields
    [request setValue:@"application/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
//    // Convert your data and set your request's HTTPBody property
//    NSString *stringData = @"some data";
//    NSData *requestBodyData = stringData dataUsingEncoding:NSUT[F8StringEncoding];
    request.HTTPBody = data;
    
    // Create url connection and fire request
    [NSURLConnection connectionWithRequest:request delegate:connectionDelegate];
}

@end