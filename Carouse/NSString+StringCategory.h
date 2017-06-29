//
//  NSString+StringCategory.h
//  Carouse
//
//  Created by 王盛魁 on 16/6/15.
//  Copyright © 2016年 wangsk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (StringCategory)
/**
 * 截取字符串
 *
 * fromString  字符串截取开始字符串
 *
 * toString    字符串截取结束字符串
 *
 * return      截取的字符串数组
 *
 */
- (NSArray *)subStringFromString:(NSString *)fromString ToString:(NSString *)toString;


@end
