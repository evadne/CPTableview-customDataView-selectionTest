//	MNTableViewController
	
@import <AppKit/AppKit.j>
@import "MNSampleDataView.j"

@implementation MNTableViewController : CPViewController {
	
	CPArrayController arrayController @accessors;
	CPScrollView scrollView @accessors;
	CPTableView tableView @accessors;
	CPView dataViewPrototype @accessors;
	
}

- (id) initWithCibName:(CPString)aCibNameOrNil bundle:(CPBundle)aCibBundleOrNil {

	self = [super initWithCibName:aCibNameOrNil bundle:aCibBundleOrNil];
	if (!self) return nil;
	
	[self mnConfigure];
	
	return self;

}

- (id) initWithCoder:(CPCoder)aCoder {
	
	self = [super initWithCoder:aCoder];
	if (!self) return nil;
	
	[self mnConfigure];	
	
	return self;
	
}

- (void) mnConfigure {
	
	[self setArrayController:[[CPArrayController alloc] init]];
	[self setDataViewPrototype:[[MNSampleDataView alloc] init]];
	
}

- (CPScrollView) view {
	
	return [super view];
	
}

- (void) loadView {
	
	scrollView = [[CPScrollView alloc] init];
	tableView = [[CPTableView alloc] initWithFrame:[scrollView bounds]];

	[tableView setDataSource:self];
	[tableView setDelegate:self];
	[tableView setRowHeight:32];
	[tableView setColumnAutoresizingStyle:CPTableViewUniformColumnAutoresizingStyle];
	[tableView setGridStyleMask:CPTableViewSolidHorizontalGridLineMask];
	[tableView setHeaderView:nil];
	[tableView setCornerView:nil];
	
	[scrollView setAutoresizingMask:CPViewWidthSizable|CPViewHeightSizable];
	[scrollView setDocumentView:tableView];
	[scrollView setHasHorizontalScroller:NO];
	[self setView:scrollView];
	
	var column = [[CPTableColumn alloc] initWithIdentifier:@"column"];
	[column setDataView:[self dataViewPrototype]];
	[tableView addTableColumn:column];
	
}

- (int) numberOfRowsInTableView:(CPTableView)inTableView {
		
	return [[arrayController arrangedObjects] count] || 0;
	
}

- (id) tableView:(CPTableView)inTableView objectValueForTableColumn:(CPTableColumn)inTableColumn row:(int)inRow {
	
	return [[arrayController arrangedObjects] objectAtIndex:inRow];

}

@end
