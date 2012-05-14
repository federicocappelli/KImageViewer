//
//  NSBGView.m
//  ZanichelliOSX
//
//  Created by Federico Cappelli on 15/03/12.
//  Copyright (c) 2012 Meta s.r.l. All rights reserved.
//

#import "NSBGView.h"

@implementation NSBGView

@synthesize backgroundColor;

- (void)drawRect:(NSRect)rect
{
    [self.backgroundColor set];
    NSRectFill([self bounds]);
}


@end
