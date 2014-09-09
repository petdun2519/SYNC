//
//  MyButton.m
//  SYNC1
//
//  Created by Peter Dunlop on 8/11/14.
//  Copyright (c) 2014 tpetdu. All rights reserved.
//

#import "MyButton.h"
#import "StyleKitName.h"

@implementation MyButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    [StyleKitName drawCanvas1WithFrame:self.bounds];
    // Drawing code
}


@end
