//
//  KImageViewer.h
//  ZanichelliOSX
//
//  Created by Federico Cappelli on 28/02/12.
//  Copyright (c) 2012 Meta s.r.l. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <Quartz/Quartz.h>

@interface KImageViewer : NSViewController
{
    IBOutlet IKImageView * _imageView;
    IBOutlet NSView * toolbar;
    IBOutlet NSButton * disclosereButton;
    
	NSDictionary * _toolbarDict;
    
    NSDictionary * _imageProperties;
    NSString * _imageUTType;
    IKSaveOptions * _saveOptions;
}

-(id)initWithFrame:(CGRect)frameRect;
-(void)setImageWithURL:(NSURL*)url;

-(IBAction)doZoom: (id)sender;
//-(IBAction)showToolbar:(id)sender;
@end
