//
//  NetDataEngine.h
//  LimitFree
//
//  Created by lijinghua on 15/9/12.
//  Copyright (c) 2015年 lijinghua. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^SuccessBlockType) (id responsData);
typedef void(^FailedBlockType)(NSError *error);

@interface NetDataEngine : NSObject

+ (instancetype)sharedInstance;

- (void)requestRecommendFrom:(NSString*)url success:(SuccessBlockType)successBlock falied:(FailedBlockType)failedBlock;

- (void)requestCategoryFrom:(NSString*)url success:(SuccessBlockType)successBlock falied:(FailedBlockType)failedBlock;

- (void)requestNewInfo:(NSString*)url success:(SuccessBlockType)successBlock falied:(FailedBlockType)failedBlock;

- (void)requestActiveList:(NSString*)url success:(SuccessBlockType)successBlock falied:(FailedBlockType)failedBlock;

- (void)requestSubjectAppList:(NSString*)url success:(SuccessBlockType)successBlock falied:(FailedBlockType)failedBlock;

@end
