//
//  ConnectSegue.m
//  SYNC1
//
//  Created by Peter Dunlop on 8/17/14.
//  Copyright (c) 2014 tpetdu. All rights reserved.
//

#import "ConnectSegue.h"
#import "ConnectPageViewController.h"
#import "MPCHandler.h"
#import "ViewConnectionViewController.h"

@implementation ConnectSegue

- (void)perform {
    
    ConnectPageViewController *sourceViewController = self.sourceViewController;
    ViewConnectionViewController *destinationViewController = self.destinationViewController;
    
    
    
    [sourceViewController presentViewController:destinationViewController animated:YES completion:NULL];
}


@end
