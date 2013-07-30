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

@interface MotionCV : NSObject

+ (MotionMat *)MotionMatFromUIImage:(UIImage *)image;
+ (UIImage *)UIImageFromMotionMat:(MotionMat *)mat;

+ (void)cvtColorInput:(MotionMat *)src output:(MotionMat *)dst  code:(int)code dcn:(int)dcn;
+ (void)cvtColorInput:(MotionMat *)src output:(MotionMat *)dst  code:(int)code;

+ (void)threshold:(MotionMat *)src dst:(MotionMat *)dst thresh:(double)thresh maxVal:(double)maxVal thresholdType:(int)thresholdType;
+ (void)adaptiveThreshold:(MotionMat *)src dst:(MotionMat *)dst maxValue:(double)maxValue adaptiveMethod:(int)adaptiveMethod thresholdType:(int)thresholdType blockSize:(int)blockSize C:(double)c;
+ (void)GaussianBlur:(MotionMat *)src dst:(MotionMat *)dst sizeWidth:(int)width sizeHeight:(int)height sigmaX:(double)sigmaX sigmaY:(double)sigmaY borderType:(int)borderType;
+ (void)GaussianBlur:(MotionMat *)src dst:(MotionMat *)dst sizeWidth:(int)width sizeHeight:(int)height sigmaX:(double)sigmaX sigmaY:(double)sigmaY;
+ (void)GaussianBlur:(MotionMat *)src dst:(MotionMat *)dst sizeWidth:(int)width sizeHeight:(int)height sigmaX:(double)sigmaX;

@end
