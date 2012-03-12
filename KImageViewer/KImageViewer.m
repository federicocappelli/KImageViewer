//
//  KImageViewer.m
//  ZanichelliOSX
//
//  Created by Federico Cappelli on 28/02/12.
//  Copyright (c) 2012 Meta s.r.l. All rights reserved.
//

#import "KImageViewer.h"

@implementation KImageViewer


#define ZOOM_IN_FACTOR  1.414214
#define ZOOM_OUT_FACTOR 0.7071068

/*
 - (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
 {
 self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
 if (self) 
 {
 // customize the IKImageView...
 [_imageView setDoubleClickOpensImageEditPanel: YES];
 [_imageView setCurrentToolMode: IKToolModeMove];
 [_imageView zoomImageToActualSize: self];
 [_imageView setDelegate: self];
 _imageView.editable = YES;
 _imageView.autoresizes = NO;
 _imageView.autohidesScrollers = NO;
 _imageView.hasHorizontalScroller = YES;
 _imageView.hasVerticalScroller = YES;
 
 [[_imageView enclosingScrollView] reflectScrolledClipView:
 [[_imageView enclosingScrollView] contentView]];
 }
 
 return self;
 }*/

-(id)initWithFrame:(CGRect)frameRect
{
    self = [super initWithNibName:@"KImageViewer" bundle:nil];
    if (self) 
    {
        // customize the IKImageView...
        [_imageView setDoubleClickOpensImageEditPanel: YES];
        [_imageView setCurrentToolMode: IKToolModeMove];
        [_imageView zoomImageToActualSize: self];
        [_imageView setDelegate: self];
        _imageView.editable = YES;
        _imageView.autoresizes = NO;
        _imageView.autohidesScrollers = NO;
        _imageView.hasHorizontalScroller = YES;
        _imageView.hasVerticalScroller = YES;
        
        [[_imageView enclosingScrollView] reflectScrolledClipView:
         [[_imageView enclosingScrollView] contentView]];
        self.view.frame = frameRect;
    }
    
    return self;
}

#pragma mark - Set image

- (void)setImageWithURL: (NSURL*)url
{
    // use ImageIO to get the CGImage, image properties, and the image-UTType
    CGImageRef          image = NULL;
    CGImageSourceRef    isr = CGImageSourceCreateWithURL( (CFURLRef)url, NULL);
    
    if (isr)
    {
        image = CGImageSourceCreateImageAtIndex(isr, 0, NULL);
        
        if (image)
        {
            _imageProperties = (NSDictionary*)CGImageSourceCopyPropertiesAtIndex(isr, 0, (CFDictionaryRef)_imageProperties);
            
            _imageUTType = (NSString*)CGImageSourceGetType(isr);
            [_imageUTType retain];
        }
    }
    
    if (image)
    {
        [_imageView setImage: image imageProperties: _imageProperties];
        [_imageView zoomImageToFit: self];
    }
}

#pragma mark - Zoom

- (IBAction)doZoom: (id)sender
{
    NSInteger zoom;
    CGFloat   zoomFactor;
    
    if ([sender isKindOfClass: [NSSegmentedControl class]])
        zoom = [sender selectedSegment];
    else
        zoom = [sender tag];
    
    switch (zoom)
    {
        case 0:
            zoomFactor = [_imageView zoomFactor];
            [_imageView setZoomFactor: zoomFactor * ZOOM_OUT_FACTOR];
            break;
        case 1:
            zoomFactor = [_imageView zoomFactor];
            [_imageView setZoomFactor: zoomFactor * ZOOM_IN_FACTOR];
            break;
        case 2:
            [_imageView zoomImageToActualSize: self];
            break;
        case 3:
            [_imageView zoomImageToFit: self];
            break;
    }
}
/*
 -(IBAction)showToolbar:(id)sender
 {
 NSButton * button = (NSButton*)sender;
 if([button state])
 {
 toolbar.frame = CGRectMake(toolbar.frame.origin.x, 
 toolbar.frame.origin.y+toolbar.frame.size.height,
 toolbar.frame.size.width, 
 toolbar.frame.size.height);
 }
 else
 {
 toolbar.frame = CGRectMake(toolbar.frame.origin.x, 
 toolbar.frame.origin.y-toolbar.frame.size.height,
 toolbar.frame.size.width, 
 toolbar.frame.size.height);
 }
 }*/

@end
