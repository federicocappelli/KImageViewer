//
//  NSBGView.h
//  ZanichelliOSX
//
//  Created by Federico Cappelli on 15/03/12.
//  Copyright (c) 2012 Meta s.r.l. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSBGView : NSView
{
    NSColor * backgroundColor;
}

-(void)setBackgroundColor:(NSColor*)aColor;

@property(nonatomic, retain) NSColor * backgroundColor;

@end
