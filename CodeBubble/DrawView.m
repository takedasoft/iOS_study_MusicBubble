#import "DrawView.h"
#import "Bubble.h"
#import "CodeMap.h"

@interface DrawView()
@property (nonatomic) CGPoint touchPoint;
@property (nonatomic) CGPoint releasePoint;
@end

@implementation DrawView

NSTimer *timer_;

NSMutableArray *bubbles;
int bubblesCount = 0;

int enterframeCount = 0;
int phaseInterval = 60;

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        timer_ = [NSTimer scheduledTimerWithTimeInterval:1.0 / 12.0
                                                  target:self
                                                selector:@selector(enterframe:)
                                                userInfo:nil
                                                 repeats:YES];
        bubbles = [NSMutableArray array];
        Bubble *b1 = [Bubble createWithRadius:80 withColor:[UIColor colorWithRed:0.0 green:0.0 blue:1.0 alpha:0.4] startX:10 startY:10 ];
        Bubble *b2 = [Bubble createWithRadius:40 withColor:[UIColor colorWithRed:0.0 green:1.0 blue:0.0 alpha:0.4] startX:100 startY:200 ];
        Bubble *b3 = [Bubble createWithRadius:20 withColor:[UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:0.4] startX:250 startY:300  ];
        Bubble *b4 = [Bubble createWithRadius:20 withColor:[UIColor colorWithRed:0.7 green:0.0 blue:0.7 alpha:0.4] startX:150 startY:300  ];
        [bubbles addObject:b1];
        [bubbles addObject:b2];
        [bubbles addObject:b3];
        [bubbles addObject:b4];
        bubblesCount = [bubbles count];
        
        [CodeMap prepare];
        [CodeMap play:[CodeMap getNowhereManStory]];
    }
        
    return self;
}

-(void)enterframe:(NSTimer*)timer{
    if( enterframeCount % phaseInterval == 0 ){
        NSArray *notes = [CodeMap getNextNotes];
        for( int i = 0 ; i < bubblesCount; i++ ){
            Bubble *b = bubbles[i];
            b.note = notes[i];
        }
        enterframeCount = 0;
    }
    enterframeCount++;
    
    for( Bubble *b in bubbles ){
        if( b.bounce ){
            [b chaim];
        }
    }
    for (int i = 0; i < bubblesCount-1; i++) {
        for ( int j=i+1; j<bubblesCount; j++) {
            if( [Bubble collision:bubbles[i] with:bubbles[j]] ){
                [bubbles[i] chaim];
                [bubbles[j] chaim];
            }
        }
    }
    
    for( Bubble *b in bubbles ){
        [b update];
    }
    
    [self setNeedsDisplay];
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    _touchPoint = [[touches anyObject] locationInView:self];
}

-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    _releasePoint = [[touches anyObject] locationInView:self];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)evnet
{
    CGPoint p = [[touches anyObject] locationInView:self];
    CGPoint q = [[touches anyObject] previousLocationInView:self];
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    for( Bubble *b in bubbles ){
        [b drawOn: &currentContext];
    }
}

@end