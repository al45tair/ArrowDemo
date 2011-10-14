/* TestView */

#import <Cocoa/Cocoa.h>

@interface TestView : NSView
{
  IBOutlet NSSlider *arrowSizeSlider;
  IBOutlet NSSlider *arrowAngleSlider;
  
  float arrowSize;
  float arrowAngle;
}

- (IBAction)takeArrowSizeFrom:(id)sender;
- (IBAction)takeArrowAngleFrom:(id)sender;

@end
