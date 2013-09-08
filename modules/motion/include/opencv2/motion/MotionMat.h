//
//  MotionMat.h
//  motion-opencv
//
//  Created by 岩澤 英治 on 2013/07/17.
//  Copyright (c) 2013年 iwazer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

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
- (id)initWithRows:(int)rows
              cols:(int)cols
          channels:(int)channels;
- (id)initWithSize:(CGSize)size
               bgr:(int *)bgr;
- (void)dealloc;

- (void)set:(MotionMat *)mm;

- (void)copyTo:(MotionMat *)mat
          mask:(MotionMat *)mask;
- (void)copyTo:(MotionMat *)mat;

- (unsigned char *)data;
- (size_t)stepWithIndex:(int)index;
- (size_t)elemSize;
- (BOOL)empty;
- (size_t)total;
- (int)rows;
- (int)cols;
- (MotionIntSize)size;

- (MotionMat *)crop:(CGRect)rect;

@end
