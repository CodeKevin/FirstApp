//
//  KVBaseModle.m
//  Sdgift
//
//  Created by Kevin on 15/12/5.
//  Copyright © 2015年 Kevin. All rights reserved.
//

#import "KVBaseModle.h"

@implementation KVBaseModle



- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    NSLog(@"捕获到未定义的key %@",key);
}

- (id)valueForUndefinedKey:(NSString *)key{
    return nil;
}
@end
