#import "CodeMap.h"

@implementation CodeMap

static NSArray *codeNames;
static NSDictionary *codeMap;

static NSArray *story;
static int currentStoryIndex;

+(void)prepare
{
    NSArray *c = @[@"c0",@"e0",@"g",@"c"];
    NSArray *cm = @[@"c0",@"d0s",@"g",@"c"];
    NSArray *c7 = @[@"c0",@"e0",@"g",@"as"];
    NSArray *cm7 = @[@"c0",@"d0s",@"g",@"as"];
    NSArray *cs = @[@"c0s",@"f0",@"gs",@"cs"];
    NSArray *csm = @[@"c0s",@"e0",@"gs",@"cs"];
    NSArray *cs7 = @[@"c0s",@"f0",@"gs",@"b"];
    NSArray *csm7 = @[@"c0s",@"e0",@"gs",@"b"];
    NSArray *d = @[@"d0",@"f0s",@"a",@"d"];
    NSArray *dm = @[@"d0",@"f0",@"a",@"d"];
    NSArray *d7 = @[@"d0",@"f0s",@"a",@"c"];
    NSArray *dm7 = @[@"d0",@"f0",@"a",@"c"];
    NSArray *ds = @[@"d0s",@"g0",@"as",@"ds"];
    NSArray *dsm_ = @[@"d0s",@"f0s",@"as",@"ds"];
    NSArray *ds7 = @[@"d0s",@"g0",@"as",@"cs"];
    NSArray *dsm7 = @[@"d0s",@"f0s",@"as",@"cs"];
    NSArray *e = @[@"e0",@"b0",@"gs",@"e"];
    NSArray *em = @[@"e0",@"b0",@"g",@"e"];
    NSArray *e7 = @[@"e0",@"b0",@"gs",@"d"];
    NSArray *em7 = @[@"e0",@"b0",@"g",@"d"];
    NSArray *f = @[@"f0",@"c0",@"f",@"a"];
    NSArray *fm = @[@"f0",@"c0",@"f",@"gs"];
    NSArray *f7 = @[@"f0",@"c0",@"ds",@"a"];
    NSArray *fm7 = @[@"f0",@"c0",@"ds",@"gs"];
    NSArray *fs = @[@"f0s",@"c0s",@"fs",@"as"];
    NSArray *fsm = @[@"f0s",@"c0s",@"fs",@"a"];
    NSArray *fs7 = @[@"f0s",@"c0s",@"e",@"as"];
    NSArray *fsm7 = @[@"f0s",@"c0s",@"e",@"a"];
    NSArray *g = @[@"g0",@"b0",@"d",@"g"];
    NSArray *gm = @[@"g0",@"a0s",@"d",@"g"];
    NSArray *g7 = @[@"g0",@"b0",@"d",@"f"];
    NSArray *gm7 = @[@"g0",@"a0s",@"d",@"f"];
    NSArray *gs = @[@"g0s",@"c0",@"ds",@"gs"];
    NSArray *gsm = @[@"g0s",@"b0",@"ds",@"gs"];
    NSArray *gs7 = @[@"g0s",@"c0",@"ds",@"fs"];
    NSArray *gsm7 = @[@"g0s",@"b0",@"ds",@"fs"];
    NSArray *a = @[@"a0",@"e0",@"cs",@"a"];
    NSArray *am = @[@"a0",@"e0",@"c",@"a"];
    NSArray *a7 = @[@"a0",@"e0",@"cs",@"g"];
    NSArray *am7 = @[@"a0",@"e0",@"c",@"g"];
    NSArray *as = @[@"a0s",@"f0",@"d",@"as"];
    NSArray *asm_ = @[@"a0s",@"f0",@"cs",@"as"];
    NSArray *as7 = @[@"a0s",@"f0",@"d",@"gs"];
    NSArray *asm7 = @[@"a0s",@"f0",@"cs",@"gs"];
    NSArray *b = @[@"b0",@"f0s",@"ds",@"b"];
    NSArray *bm = @[@"b0",@"f0s",@"d",@"b"];
    NSArray *b7 = @[@"b0",@"f0s",@"ds",@"a"];
    NSArray *bm7 = @[@"b0",@"f0s",@"d",@"a"];
        
    codeMap = @{
                @"C" : c, @"Cm" : cm , @"C7" : c7 , @"Cm7" : cm7 ,
                @"C#" : cs , @"C#m" : csm , @"C#7" : cs7 , @"C#m7" : csm7 ,
                @"D" : d , @"Dm" : dm , @"D7" : d7 , @"Dm7" : dm7 ,
                @"D#" : ds , @"D#m" : dsm_ , @"D#7" : ds7 , @"D#m7" : dsm7 ,
                @"E" : e , @"Em" : em , @"E7" : e7 , @"Em7" : em7 ,
                @"F" : f , @"Fm" : fm , @"F7" : f7 , @"Fm7" : fm7 ,
                @"F#" : fs , @"F#m" : fsm , @"F#7" : fs7 , @"F#m7" : fsm7 ,
                @"G" : g , @"Gm" : gm , @"G7" : g7 , @"Gm7" : gm7 ,
                @"G#" : gs , @"G#m" : gsm , @"G#7" : gs7 , @"G#m7" : gsm7 ,
                @"A" : a , @"Am" : am , @"A7" : a7 , @"Am7" : am7 ,
                @"A#" : as , @"A#m" : asm_ , @"A#7" : as7 , @"A#m7" : asm7 ,
                @"B" : b , @"Bm" : bm , @"B7" : b7 , @"Bm7" : bm7
    };
}

+(NSArray *)getTakeItEasyStory
{
    return @[
            @"Em",@"Em",@"C",@"G",@"Am",@"C",@"Em",@"Em"
            ,@"C",@"G",@"C",@"G",@"Am",@"C",@"G",@"G"];
}
+(NSArray *)getJustLoveStory
{
    return @[
            @"G#m7",@"C#m7",@"F#m7",@"B7",@"G#m7",@"C#7",@"F#m7",@"G#m7"
            ,@"E",@"C#m7",@"A",@"B",@"E",@"C#m7",@"A",@"B"];
}
+(NSArray *)getNowhereManStory
{
    return @[
            @"E",@"B",@"A",@"E",@"F#m",@"Am",@"E",@"E"
            ,@"G#m",@"A",@"G#m",@"A",@"G#m",@"A",@"A",@"B7"];
}
+(NSArray *)codeNames
{
    if( ! codeNames ){
    codeNames = @[@"C",@"Cm",@"C7",@"Cm7",
            @"C#",@"C#m",@"C#7",@"C#m7",
            @"D",@"Dm",@"D7",@"Dm7",
            @"D#",@"D#m",@"D#7",@"D#m7",
            @"E",@"Em",@"E7",@"Em7",
            @"F",@"Fm",@"F7",@"Fm7",
            @"F#",@"F#m",@"F#7",@"F#m7",
            @"G",@"Gm",@"G7",@"Gm7",
            @"G#",@"G#m",@"G#7",@"G#m7",
            @"A",@"Am",@"A7",@"Am7",
            @"A#",@"A#m",@"A#7",@"A#m7",
            @"B",@"Bm",@"B7",@"Bm7"];
    }
    return codeNames;
}
+(NSArray *)notesByName:(NSString *)codeName
{
    return codeMap[codeName];
}

+(void)play:(NSArray *)story_
{
    story = story_;
    currentStoryIndex = -1;
}

+(NSArray *)getNextNotes
{
    currentStoryIndex++;
    if( currentStoryIndex >= [story count] ){
        currentStoryIndex = 0;
    }    
    return codeMap[ story[currentStoryIndex] ];
}
@end
