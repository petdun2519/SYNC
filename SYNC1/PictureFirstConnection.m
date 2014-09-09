//
//  PictureFirstConnection.m
//  SYNC1
//
//  Created by Peter Dunlop on 8/19/14.
//  Copyright (c) 2014 tpetdu. All rights reserved.
//

#import "PictureFirstConnection.h"

@implementation PictureFirstConnection

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.image =[UIImage imageNamed:@"molly.png"];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
}


@end
