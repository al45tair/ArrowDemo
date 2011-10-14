#import "TestView.h"
#import "AJHBezierUtils.h"

@implementation TestView

- (id)initWithFrame:(NSRect)frame
{
  if ((self = [super initWithFrame:frame])) {
    arrowSize = 20;
    arrowAngle = 25;
    [arrowSizeSlider setFloatValue:arrowSize];
    [arrowAngleSlider setFloatValue:arrowSize];
  }
  
  return self;
}

- (IBAction)takeArrowSizeFrom:(id)sender
{
  arrowSize = [sender floatValue];
  [self setNeedsDisplay:YES];
}

- (IBAction)takeArrowAngleFrom:(id)sender
{
  arrowAngle = [sender floatValue];
  [self setNeedsDisplay:YES];
}

- (void)drawRect:(NSRect)rect
{
  float width = [self bounds].size.width;
  float height = [self bounds].size.height;
  float wfactor = width / 400;
  float hfactor = height / 400;
  NSPoint p[6] = { NSMakePoint (40.0 * wfactor, 20.0 * hfactor),
		   NSMakePoint (40.0 * wfactor, 380.0 * hfactor),
    
		   NSMakePoint (60.0 * wfactor, 40.0 * hfactor),
		   NSMakePoint (160.0 * wfactor, 40.0 * hfactor),
		   NSMakePoint (60.0 * wfactor, 360.0 * hfactor),
		   NSMakePoint (160.0 * wfactor, 360.0 * hfactor)};
  NSAffineTransform *transform = [NSAffineTransform transform];
  NSBezierPath *mainPath, *arrow1, *arrow2;
  
  [transform scaleXBy:1.0 yBy:hfactor / wfactor];

  mainPath = [NSBezierPath bezierPath];

  // First draw a straight line on the left hand side of the window
  [[NSColor blackColor] set];
  [mainPath moveToPoint:p[0]];
  [mainPath lineToPoint:p[1]];
  [mainPath stroke];
  
  // Draw the arrows
  arrow1 = [mainPath bezierPathWithArrowHeadForStartOfLength:arrowSize
						       angle:arrowAngle];
  [arrow1 closePath];
  [[NSColor whiteColor] set];
  [arrow1 fill];
  [[NSColor blackColor] set];
  [arrow1 stroke];

  arrow2 = [mainPath bezierPathWithArrowHeadForEndOfLength:arrowSize 
						     angle:arrowAngle];
  [arrow2 closePath];
  [arrow2 fill];
  [arrow2 stroke];
  
  // Next, draw a curve
  [mainPath removeAllPoints];
  [mainPath moveToPoint:p[2]];
  [mainPath curveToPoint:p[5] controlPoint1:p[3] controlPoint2:p[4]];
  [mainPath stroke];
  
  // And the arrows
  arrow1 = [mainPath bezierPathWithArrowHeadForStartOfLength:arrowSize 
						       angle:arrowAngle];
  [arrow1 stroke];
  
  arrow2 = [mainPath bezierPathWithArrowHeadForEndOfLength:arrowSize 
						     angle:arrowAngle];
  [arrow2 closePath];
  [arrow2 fill];
  [arrow2 stroke];
  
  // Finally, draw a set of concentric arcs, each with arrows
  [mainPath removeAllPoints];
  [mainPath appendBezierPathWithArcWithCenter:NSMakePoint(280.0 * wfactor,
							  200.0 * wfactor)
				       radius:100.0 * wfactor
				   startAngle:30.0
				     endAngle:330.0];
  [mainPath transformUsingAffineTransform:transform];
  [mainPath stroke];

  arrow1 = [mainPath bezierPathWithArrowHeadForStartOfLength:arrowSize 
						       angle:arrowAngle];
  [arrow1 closePath];
  [[NSColor whiteColor] set];
  [arrow1 fill];
  [[NSColor blackColor] set];
  [arrow1 stroke];
  
  arrow2 = [mainPath bezierPathWithArrowHeadForEndOfLength:arrowSize 
						     angle:arrowAngle];
  [arrow2 closePath];
  [arrow2 fill];
  [arrow2 stroke];
  
  [[NSColor redColor] set];
  [mainPath removeAllPoints];
  [mainPath appendBezierPathWithArcWithCenter:NSMakePoint(280.0 * wfactor,
							  200.0 * wfactor)
				       radius:80.0 * wfactor
				   startAngle:220.0
				     endAngle:180.0];
  [mainPath transformUsingAffineTransform:transform];
  [mainPath stroke];
  
  arrow1 = [mainPath bezierPathWithArrowHeadForStartOfLength:arrowSize 
						       angle:arrowAngle];
  [arrow1 closePath];
  [[NSColor yellowColor] set];
  [arrow1 fill];
  [[NSColor redColor] set];
  [arrow1 stroke];
  
  arrow2 = [mainPath bezierPathWithArrowHeadForEndOfLength:arrowSize 
						     angle:arrowAngle];
  [arrow2 closePath];
  [arrow2 fill];
  [arrow2 stroke];

  [[NSColor blueColor] set];
  [mainPath removeAllPoints];
  [mainPath appendBezierPathWithArcWithCenter:NSMakePoint(280.0 * wfactor,
							  200.0 * wfactor)
				       radius:60.0 * wfactor
				   startAngle:70.0
				     endAngle:370.0];
  [mainPath transformUsingAffineTransform:transform];
  [mainPath stroke];
  
  arrow1 = [mainPath bezierPathWithArrowHeadForStartOfLength:arrowSize 
						       angle:arrowAngle];
  [arrow1 closePath];
  [[NSColor greenColor] set];
  [arrow1 fill];
  [[NSColor blueColor] set];
  [arrow1 stroke];
  
  arrow2 = [mainPath bezierPathWithArrowHeadForEndOfLength:arrowSize 
						     angle:arrowAngle];
  [arrow2 closePath];
  [arrow2 fill];
  [arrow2 stroke];

  [[NSColor greenColor] set];
  [mainPath removeAllPoints];
  [mainPath appendBezierPathWithArcWithCenter:NSMakePoint(280.0 * wfactor,
							  200.0 * wfactor)
				       radius:40.0 * wfactor
				   startAngle:260.0
				     endAngle:220.0];
  [mainPath transformUsingAffineTransform:transform];
  [mainPath stroke];
  
  arrow1 = [mainPath bezierPathWithArrowHeadForStartOfLength:arrowSize
						       angle:arrowAngle];
  [arrow1 closePath];
  [[[NSColor greenColor] blendedColorWithFraction:0.5 ofColor:[NSColor blackColor]] set];
  [arrow1 fill];
  [[NSColor greenColor] set];
  [arrow1 stroke];
  
  arrow2 = [mainPath bezierPathWithArrowHeadForEndOfLength:arrowSize 
						     angle:arrowAngle];
  [arrow2 closePath];
  [arrow2 fill];
  [arrow2 stroke];
}

- (void)windowWillClose:(NSNotification *)aNotification
{
  [NSApp terminate:self];
}

@end
