//
//  MotionMat.h
//  motion-opencv
//
//  Created by 岩澤 英治 on 2013/07/17.
//  Copyright (c) 2013年 iwazer. All rights reserved.
//

#import <Foundation/Foundation.h>

// cv:: Size is not available. Because, there is not a C++ template in Objective-C.
typedef struct MotionIntSize {
    int width;
    int height;
} MotionIntSize;

typedef struct MotionIntPoint {
    int x;
    int y;
} MotionIntPoint;

@interface MotionMat : NSObject

- (id)init;
- (id)initWithRows:(int)rows cols:(int)cols channels:(int)channels;
- (void)dealloc;

- (void)set:(MotionMat *)mm;

- (unsigned char *)data;
- (size_t)stepWithIndex:(int)index;
- (size_t)elemSize;
- (BOOL)empty;
- (size_t)total;
- (int)rows;
- (int)cols;
- (MotionIntSize)size;

@end
