//	MNSampleDataView.j

@import <AppKit/AppKit.j>

@implementation MNSampleDataView : CPView {
	
	CPTextField label @accessors;
	id objectValue @accessors;
	
}

- (id) initWithFrame:(CGRect)aFrame {
	
	self = [super initWithFrame:aFrame];
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
	
	[self setLabel:[CPTextField labelWithTitle:nil]];
	[[self label] setFrame:[self bounds]];
	[[self label] setAutoresizingMask:CPViewWidthSizable|CPViewHeightSizable];
	[self addSubview:[self label]];
	
}

- (void) setObjectValue:(id)anObject {
	
	if (objectValue === anObject) return; // -isEqual: ?
	
	[self willChangeValueForKey:@"objectValue"];
	objectValue = anObject;
	[label setStringValue:[CPString stringWithFormat:@"%@", anObject]];
	[self didChangeValueForKey:@"objectValue"];

}

- (void) setSelected:(BOOL)selected animated:(BOOL)animated {
	
	CPLog(@"%@, object %@ was set selected? %x, animated? %x", self, [self objectValue], selected, animated);
	
}

- (BOOL) setThemeState:(CPThemeState)aState {
	
	var superAllowed = [super setThemeState:aState];
	[self setSelected:[self hasThemeState:CPThemeStateSelectedDataView] animated:NO];
	return superAllowed;
	
}

- (BOOL) unsetThemeState:(CPThemeState)aState {

	var superAllowed = [super unsetThemeState:aState];
	[self setSelected:[self hasThemeState:CPThemeStateSelectedDataView] animated:NO];
	return superAllowed;

}

@end