#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface Bubble : NSObject
@property float x;
@property float y;
@property float sx;
@property float sy;
@property float m;
@property float radius;
@property (strong, nonatomic) UIColor *color;
@property (strong, nonatomic) NSString *note;

+ (Bubble *)createWithRadius:(int)radius withColor:(UIColor *)color startX:(int)x startY:(int)y;
+ (bool)collision:(Bubble *)b1 with:(Bubble *)b2;
- (void)chaim;
- (bool)bounce;
- (void)update;
- (void)drawOn:(CGContextRef *)context;
- (float)centerX;
- (float)centerY;
- (void)centerX:(float)x;
- (void)centerY:(float)y;
@end