//
//  ConnectionDelegate.h
//  SYNC1
//
//  Created by Peter Dunlop on 8/23/14.
//  Copyright (c) 2014 tpetdu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ConnectionDelegate : NSObject<NSURLConnectionDelegate>{
    NSMutableData *_responseData;
}

@end
