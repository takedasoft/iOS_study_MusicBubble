#import <Foundation/Foundation.h>

@interface CodeMap : NSObject
+(void)prepare;
+(NSArray *)codeNames;
+(NSArray *)notesByName:(NSString *)codeName;
+(NSArray *)getTakeItEasyStory;
+(NSArray *)getJustLoveStory;
+(NSArray *)getNowhereManStory;
+(void)play:(NSArray *)story;
+(NSArray *)getNextNotes;
@end
