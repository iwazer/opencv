//
//  MotionMat.h
//  motion-opencv
//
//  Created by 岩澤 英治 on 2013/07/17.
//  Copyright (c) 2013年 iwazer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MotionMat : NSObject

- (id)init;
- (id)initWithRows:(int)rows cols:(int)cols channels:(int)channels;
- (void)dealloc;

- (unsigned char *)data;
- (size_t)stepWithIndex:(int)index;
- (size_t)elemSize;
- (BOOL)empty;
- (size_t)total;
- (int)rows;
- (int)cols;

@end
