//
//  AppDelegate.m
//  KImageViewerDemo
//
//  Created by Federico Cappelli on 01/03/12.
//  Copyright (c) 2012 Meta s.r.l. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize window = _window;

- (void)dealloc
{
    [super dealloc];
}
	
- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    NSView * contentView = self.window.contentView;
    imageViewer = [[KImageViewer alloc] initWithFrame:contentView.frame];
    [contentView addSubview:imageViewer.view];
    
    //Display image
    NSString *immPath = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"jpg" inDirectory:nil];
    [imageViewer setImageWithURL:[NSURL fileURLWithPath:immPath]];
}

@end
