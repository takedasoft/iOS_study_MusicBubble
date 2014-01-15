#import <AVFoundation/AVFoundation.h>
#import "Bubble.h"

@interface Bubble()
@property (strong, nonatomic) AVAudioPlayer *player;
@end

@implementation Bubble

+ (Bubble *)createWithRadius:(int)radius withColor:(UIColor *)color startX:(int)x startY:(int)y
{
    Bubble *b = [[Bubble alloc] init];
    b.radius = radius;
    b.m = radius;
    b.color = color;
    b.sx = 3.0;
    b.sy = 3.0;
    b.x = x;
    b.y = y;
    return b;
}
- (void)drawOn:(CGContextRef *)context
{
    CGContextSetFillColorWithColor( *context , _color.CGColor );
    CGRect r = CGRectMake( _x , _y , _radius * 2, _radius * 2 );
    CGContextFillEllipseInRect( *context, r );
}

- (void)chaim
{
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:_note ofType:@"caf"] ];
    _player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [_player play];
}

- (float)centerX
{
    return _x + _radius;
}
- (float)centerY
{
    return _y + _radius;
}
- (void)centerX:(float)x
{
    _x = x - _radius;
}
- (void)centerY:(float)y
{
    _y = y - _radius;
}

- (void)update
{
    _x = _x + _sx;
    _y = _y + _sy;
}
- (bool)bounce
{
    bool b = false;
    
    if( [Bubble onLeft: self] || [Bubble onRight: self] ){
        _sx = - _sx;
        b = true;
    }
    if( [Bubble onTop: self] || [Bubble onBottom: self]){
        _sy = - _sy;
        b = true;
    }
    return b;
}
+ (bool)onLeft:(Bubble *)b
{
    if( b.x <= 0 ){
        b.x = 0;
        return true;
    }
    return false;
}
+ (bool)onRight:(Bubble *)b
{
    if( b.x + 2 * b.radius >= 320 ){
        b.x = 320 - 2 * b.radius;
        return true;
    }
    return false;
}
+ (bool)onTop:(Bubble *)b
{
    if( b.y <= 0 ){
        b.y = 0;
        return true;
    }
    return false;
}
+ (bool)onBottom:(Bubble *)b
{
    if( b.y + 2 * b.radius >= 480 ){
        b.y = 480 - 2 * b.radius;
        return true;
    }
    return false;
}
+ (bool)collision:(Bubble *)b1 with:(Bubble *)b2
{
    float dx, dy;
    float dist;
    float angle;
    float cosa, sina;
    float vx1p, vy1p, vx2p, vy2p;
    float P,V;
    float diff, cosd,sind;
    
    dx = [b2 centerX] - [b1 centerX];
    dy = [b2 centerY] - [b1 centerY];
    dist = sqrt(dx*dx+dy*dy);
    
    if (dist<b1.radius+b2.radius) {
        angle = atan2(dy, dx);
        cosa = cos(angle);
        sina = sin(angle);
        vx1p = cosa*b1.sx+sina*b1.sy;
        vy1p = cosa*b1.sy-sina*b1.sx;
        vx2p = cosa*b2.sx+sina*b2.sy;
        vy2p = cosa*b2.sy-sina*b2.sx;
        P = vx1p*b1.m+vx2p*b2.m;
        V = vx1p-vx2p;
        vx1p = (P-b2.m*V)/(b1.m+b2.m);
        vx2p = V+vx1p;
        b1.sx = cosa*vx1p-sina*vy1p;
        b1.sy = cosa*vy1p+sina*vx1p;
        b2.sx = cosa*vx2p-sina*vy2p;
        b2.sy = cosa*vy2p+sina*vx2p;
        diff = ((b1.radius+b2.radius)-dist)/2;
        cosd=cosa*diff;
        sind=sina*diff;
        [b1 centerX: [b1 centerX] - cosd];
        [b1 centerY: [b1 centerY] - sind];
        [b2 centerX: [b2 centerX] + cosd];
        [b2 centerY: [b2 centerY] + sind];
        return true;
    }
    return false;
}


@end
