//
//  NSString+StringCategory.m
//  Carouse
//
//  Created by 王盛魁 on 16/6/15.
//  Copyright © 2016年 wangsk. All rights reserved.
//

#import "NSString+StringCategory.h"

@implementation NSString (StringCategory)
// 截取字符串
- (NSArray *)subStringFromString:(NSString *)fromString ToString:(NSString *)toString{
    NSMutableArray *returnAarray = [NSMutableArray array];/**< 截取返回数组 */
    NSArray *fromArray = [NSArray array]; /**< 截取位置开始数组 */
    NSArray *toArray = [NSArray array];   /**< 截取位置结束数组 */
    if (fromString != nil && [self containsString:fromString]) {
        fromArray = [self containsOfString:fromString];
    }
    if (toString != nil && [self containsString:toString]) {
        toArray = [self containsOfString:toString];
    }
    if (fromArray.count == 0 && toArray.count) {
        for (int i = 0; i < toArray.count; i++) {
            [returnAarray addObject:[self substringToIndex:[[toArray[i] firstObject] intValue]]];
        }
    }else if (fromArray.count && toArray.count == 0) {
        for (int i = 0; i < fromArray.count; i++) {
            [returnAarray addObject:[self substringFromIndex:[[fromArray[i] firstObject] intValue] + [[fromArray[i] lastObject] intValue]]];
        }
    }else if (fromArray.count && toArray.count) {
        for (int i = 0; i < fromArray.count; i++) {
            for (int j = 0; j < toArray.count; j++) {
                if([[fromArray[i] firstObject] intValue] + [[fromArray[i] lastObject] intValue] <= [[toArray[j] firstObject] intValue]){
                    NSRange subRange = NSMakeRange([[fromArray[i] firstObject] intValue] + [[fromArray[i] lastObject] intValue], [[toArray[j] firstObject] intValue]-([[fromArray[i] firstObject] intValue] + [[fromArray[i] lastObject] intValue]));
                    [returnAarray addObject:[self substringWithRange:subRange]];
                }
            }
        }
    }
    return returnAarray;
}
- (NSArray *)containsOfString:(NSString *)string{
    NSMutableArray *recordArray = [NSMutableArray array];
    NSMutableArray *returnArray = [NSMutableArray array];
    NSMutableString *superString = [NSMutableString stringWithString:self];
    while ([superString containsString:string]) {
        NSRange range = [superString rangeOfString:string];
        NSArray *subFromArray = [NSArray arrayWithObjects:[NSString stringWithFormat:@"%lu",range.location],[NSString stringWithFormat:@"%lu",range.length], nil];
        [recordArray addObject:subFromArray];
        superString = [NSMutableString stringWithString:[superString substringFromIndex:range.location + range.length]];
    }
    int sum = 0;
    for (int i = 0; i < recordArray.count; i++) {
        NSArray *temp = [recordArray objectAtIndex:i];
        NSArray *subArray = [NSArray arrayWithObjects:[NSString stringWithFormat:@"%d",[temp.firstObject intValue]+sum],temp.lastObject, nil];
        sum += ([temp.firstObject intValue]+[temp.lastObject intValue]);
        [returnArray addObject:subArray];
    }
    return returnArray;
}

@end
