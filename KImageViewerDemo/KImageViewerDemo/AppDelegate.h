//
//  AppDelegate.h
//  KImageViewerDemo
//
//  Created by Federico Cappelli on 01/03/12.
//  Copyright (c) 2012 Meta s.r.l. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "KImageViewer.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>
{
    KImageViewer * imageViewer;
}

@property (assign) IBOutlet NSWindow *window;

@end
