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

@interface MotionCV_imgproc : NSObject

/*
 * cv::blur
 */
+ (void)blur:(MotionMat *)src
         dst:(MotionMat *)dst
        size:(MotionIntSize)size
      anchor:(MotionIntPoint)ancho
  borderType:(int)borderType;

/*
 * cv::equalizeHist
 */
+ (void)equalizeHist:(MotionMat *)src
                 dst:(MotionMat *)dst;

/*
 * cv::resize
 */
+ (void)resize:(MotionMat *)src
           dst:(MotionMat *)dst
         dsize:(MotionIntSize)dsize
            fx:(double)fx/* =0 */
            fy:(double)fy/* =0 */
 interpolation:(int)interpolation/* =INTER_LINEAR */;

+ (void)resize:(MotionMat *)src
           dst:(MotionMat *)dst
         dsize:(MotionIntSize)dsize
            fx:(double)fx
            fy:(double)fy;

+ (void)resize:(MotionMat *)src
           dst:(MotionMat *)dst
         dsize:(MotionIntSize)dsize;

/*
 * cv::cvtColor
 */
+ (void)cvtColor:(MotionMat *)src
             dst:(MotionMat *)dst
            code:(int)code
             dcn:(int)dcn;

+ (void)cvtColor:(MotionMat *)src
             dst:(MotionMat *)dst
            code:(int)code;

/*
 * cv::threshold
 */
+ (void)threshold:(MotionMat *)src
              dst:(MotionMat *)dst
           thresh:(double)thresh
           maxVal:(double)maxVal
    thresholdType:(int)thresholdType;

/*
 * cv::adaptiveThreshold
 */
+ (void)adaptiveThreshold:(MotionMat *)src
                      dst:(MotionMat *)dst
                 maxValue:(double)maxValue
           adaptiveMethod:(int)adaptiveMethod
            thresholdType:(int)thresholdType
                blockSize:(int)blockSize
                        C:(double)c;

/*
 * cv::GaussianBlur
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

/*
 * cv::distanceTransform
 */
+ (void)distanceTransform:(MotionMat *)src
                      dst:(MotionMat *)dst
             distanceType:(int)distanceType
                 maskSize:(int)maskSize;

/*
 * cv::Canny
 */
+ (void) Canny:(MotionMat *)src
           dst:(MotionMat *)dst
    threshold1:(double)threshold1
    threshold2:(double)threshold2
  apertureSize:(int)apertureSize/* =3 */
    l2gradient:(BOOL)l2gradient/* =false */;

+ (void) Canny:(MotionMat *)src
           dst:(MotionMat *)dst
    threshold1:(double)threshold1
    threshold2:(double)threshold2
  apertureSize:(int)apertureSize;

+ (void) Canny:(MotionMat *)src
           dst:(MotionMat *)dst
    threshold1:(double)threshold1
    threshold2:(double)threshold2;

@end
