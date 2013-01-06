    //
//  mainViewController.m
//  backgroundMusic
//
//  Created by maliy on 7/15/10.
//  Copyright 2010 interMobile. All rights reserved.
//

#import <CoreTelephony/CTCarrier.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import "mainViewController.h"


@implementation mainViewController

#pragma mark lifeCycle

- (id) init
{
	if (self = [super init])
	{
	}
	return self;
}

- (void) dealloc
{
	[super dealloc];
}

#pragma mark -

- (void) refreshInfo
{
	NSString *info = nil;
	CTTelephonyNetworkInfo *tni = [[CTTelephonyNetworkInfo alloc] init];
	CTCarrier *cr = tni.subscriberCellularProvider;
	info = [NSString stringWithFormat:@"carrierName: %@\nmobileNetworkCode: %@\n"
			"mobileCountryCode: %@\nisoCountryCode: %@\nallowsVOIP: %d",
			cr.carrierName,
			cr.mobileNetworkCode,
			cr.mobileCountryCode,
			cr.isoCountryCode,
			cr.allowsVOIP];
	tv.text = info;
}

#pragma mark -

- (void) viewWillAppear:(BOOL)animated
{
}

- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation) interfaceOrientation
{
	return YES;
}

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/


// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
	[super loadView];
	
	self.navigationItem.title = NSLocalizedString(@"Carrier Info", @"");
	
	CGRect screenRect = [[UIScreen mainScreen] applicationFrame];
	
	UIView *contentView = [[UIView alloc] initWithFrame:screenRect];
	contentView.autoresizesSubviews = YES;
	contentView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
	contentView.backgroundColor = [UIColor colorWithWhite:0.8 alpha:0.8];
	
	self.view = contentView;
	[contentView release];
	
	
	UITextView *_tv = [[UITextView alloc] initWithFrame:self.view.bounds];
	_tv.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
	_tv.editable = NO;
	tv = [_tv retain];
	[self.view addSubview:tv];
	[_tv release];
	
	[self refreshInfo];
}


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;

	[tv release];
}



@end
