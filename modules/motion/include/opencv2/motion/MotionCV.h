//
//  MotionCV.h
//  OpenCV
//
//  Created by 岩澤 英治 on 2013/07/24.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "MotionMat.h"

// cv:: Size is not available. Because, there is not a C++ template in Objective-C.
typedef struct MotionIntSize {
    int width;
    int height;
} MotionIntSize;

typedef struct MotionIntPoint {
    int x;
    int y;
} MotionIntPoint;

@interface MotionCV : NSObject

/*
 * Interface for UIImage <=> MotionMat
 */
+ (MotionMat *)MotionMatFromUIImage:(UIImage *)image;
+ (UIImage *)UIImageFromMotionMat:(MotionMat *)mat;

/*
 * OpenCV C API filters
 */
+ (void)canny:(MotionMat *)src
          dst:(MotionMat *)dst
   threshold1:(double)threshold1
   threshold2:(double)threshold2
         size:(int)aperture_size;

+ (void)not:(MotionMat *)src
        dst:(MotionMat *)dst;

+ (void)blur:(MotionMat *)src
         dst:(MotionMat *)dst
        size:(MotionIntSize)size
      anchor:(MotionIntPoint)ancho
  borderType:(int)borderType;

/*
 * cvtColor
 */
+ (void)cvtColor:(MotionMat *)src
             dst:(MotionMat *)dst
            code:(int)code
             dcn:(int)dcn;

+ (void)cvtColor:(MotionMat *)src
             dst:(MotionMat *)dst
            code:(int)code;

/*
 * threshold
 */
+ (void)threshold:(MotionMat *)src
              dst:(MotionMat *)dst
           thresh:(double)thresh
           maxVal:(double)maxVal
    thresholdType:(int)thresholdType;

/*
 * adaptiveThreshold
 */
+ (void)adaptiveThreshold:(MotionMat *)src
                      dst:(MotionMat *)dst
                 maxValue:(double)maxValue
           adaptiveMethod:(int)adaptiveMethod
            thresholdType:(int)thresholdType
                blockSize:(int)blockSize
                        C:(double)c;

/*
 * GaussianBlur
 */
+ (void)GaussianBlur:(MotionMat *)src
                 dst:(MotionMat *)dst
                size:(MotionIntSize)size
              sigmaX:(double)sigmaX
              sigmaY:(double)sigmaY
          borderType:(int)borderType;

+ (void)GaussianBlur:(MotionMat *)src
                 dst:(MotionMat *)dst
                size:(MotionIntSize)size
              sigmaX:(double)sigmaX
              sigmaY:(double)sigmaY;
+ (void)GaussianBlur:(MotionMat *)src
                 dst:(MotionMat *)dst
                size:(MotionIntSize)size
              sigmaX:(double)sigmaX;

@end
