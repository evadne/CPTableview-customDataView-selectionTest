/*
 * AppController.j
 * app
 *
 * Created by Evadne Wu on May 17, 2011.
 * Copyright 2011, Monoceros All rights reserved.
 */

@import <Foundation/CPObject.j>
@import "MNTableViewController.j"

@implementation AppController : CPObject

- (void)applicationDidFinishLaunching:(CPNotification)aNotification
{
    var theWindow = [[CPWindow alloc] initWithContentRect:CGRectMakeZero() styleMask:CPBorderlessBridgeWindowMask],
        contentView = [theWindow contentView];

    var label = [[CPTextField alloc] initWithFrame:CGRectMakeZero()];
    [label setStringValue:@"Hello World!"];
    [label setFont:[CPFont boldSystemFontOfSize:24.0]];
    [label sizeToFit];
    [label setAutoresizingMask:CPViewMinXMargin | CPViewMaxXMargin | CPViewMinYMargin | CPViewMaxYMargin];
    [label setCenter:[contentView center]];

    [contentView addSubview:label];
    [theWindow orderFront:self];

	var tableViewController = [[MNTableViewController alloc] init];
	[[tableViewController view] setAutoresizingMask:CPViewWidthSizable|CPViewHeightSizable];
	[[tableViewController view] setFrame:[contentView bounds]];
	[contentView addSubview:[tableViewController view]];
	
	[[tableViewController arrayController] setContent:[CPArray arrayWithObjects:@"One", @"Two", @"Three", @"Four", @"Five"]];
	[[tableViewController tableView] reloadData];

}

@end
