

#import <UIKit/UIKit.h>

typedef void (^SubviewBlock) (UIView* view);
typedef void (^SuperviewBlock) (UIView* superview);

@interface UIView (ViewRecursion)

-(void)runBlockOnAllSubviews:(SubviewBlock)block;
-(void)runBlockOnAllSuperviews:(SuperviewBlock)block;
-(void)enableAllControlsInViewHierarchy;
-(void)disableAllControlsInViewHierarchy;

@end
