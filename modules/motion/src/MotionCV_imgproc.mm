//
//  MotionCV.m
//  OpenCV
//
//  Created by 岩澤 英治 on 2013/07/24.
//
//

#import "opencv2/motion/MotionCV_imgproc.h"
#import "MotionMat_p.h"

#include "opencv2/core.hpp"
#include "opencv2/imgproc.hpp"

@implementation MotionCV_imgproc

/*
 * ===================================================================
 * Histograms
 */

/*
 * cv::equalizeHist
 */
+ (void)equalizeHist:(MotionMat *)src
                 dst:(MotionMat *)dst
{
    cv::equalizeHist([src mat], [dst mat]);
}

/*
 * ===================================================================
 * Image Filtering
 */

/*
 * cv::blur
 */
+ (void)blur:(MotionMat *)src
         dst:(MotionMat *)dst
        size:(MotionIntSize)size
      anchor:(MotionIntPoint)ancho
  borderType:(int)borderType
{
    cv::blur([src mat], [dst mat], cv::Size(size.width, size.height), cv::Point(-1, -1), cv::BORDER_DEFAULT);
}

+ (void)GaussianBlur:(MotionMat *)src
                 dst:(MotionMat *)dst
                size:(MotionIntSize)size
              sigmaX:(double)sigmaX
              sigmaY:(double)sigmaY
          borderType:(int)borderType
{
    cv::GaussianBlur([src mat], [dst mat], cv::Size(size.width, size.height), sigmaX, sigmaY, borderType);
}

+ (void)GaussianBlur:(MotionMat *)src
                 dst:(MotionMat *)dst
                size:(MotionIntSize)size
              sigmaX:(double)sigmaX
              sigmaY:(double)sigmaY
{
    [self GaussianBlur:src dst:dst size:size sigmaX:sigmaX sigmaY:sigmaY borderType:cv::BORDER_DEFAULT];
}

+ (void)GaussianBlur:(MotionMat *)src
                 dst:(MotionMat *)dst
                size:(MotionIntSize)size
              sigmaX:(double)sigmaX
{
    [self GaussianBlur:src dst:dst size:size sigmaX:sigmaX sigmaY:0];
}

/*
 * ===================================================================
 * Geometric Image Transformations
 */

/*
 * cv::resize
 */
+ (void)resize:(MotionMat *)src
           dst:(MotionMat *)dst
         dsize:(MotionIntSize)dsize
            fx:(double)fx/* =0 */
            fy:(double)fy/* =0 */
 interpolation:(int)interpolation/* =INTER_LINEAR */
{
    cv::resize([src mat], [dst mat], cv::Size(dsize.width, dsize.height), fx, fy, interpolation);
}

+ (void)resize:(MotionMat *)src
           dst:(MotionMat *)dst
         dsize:(MotionIntSize)dsize
            fx:(double)fx
            fy:(double)fy
{
    [self resize:src dst:dst dsize:dsize fx:fx fy:fy interpolation:cv::INTER_LINEAR];
}

+ (void)resize:(MotionMat *)src
           dst:(MotionMat *)dst
         dsize:(MotionIntSize)dsize
{
    [self resize:src dst:dst dsize:dsize fx:0 fy:0];
}

/*
 * ===================================================================
 * Miscellaneous Image Transformations
 */

+ (void)adaptiveThreshold:(MotionMat *)src
                      dst:(MotionMat *)dst
                 maxValue:(double)maxValue
           adaptiveMethod:(int)adaptiveMethod
            thresholdType:(int)thresholdType
                blockSize:(int)blockSize
                        C:(double)c
{
    cv::adaptiveThreshold([src mat], [dst mat], maxValue, adaptiveMethod, thresholdType, blockSize, c);
}

+ (void)cvtColor:(MotionMat *)src
             dst:(MotionMat *)dst
            code:(int)code
             dcn:(int)dcn
{
    cv::cvtColor([src mat], [dst mat], code, dcn);
}

+ (void)cvtColor:(MotionMat *)src
             dst:(MotionMat *)dst
            code:(int)code
{
    [self cvtColor:src dst:dst code:code dcn:0];
}

/*
 * cv::distanceTransform
 */
+ (void)distanceTransform:(MotionMat *)src
                      dst:(MotionMat *)dst
             distanceType:(int)distanceType
                 maskSize:(int)maskSize
{
    cv::distanceTransform([src mat], [dst mat], distanceType, maskSize);
}

+ (void)threshold:(MotionMat *)src
              dst:(MotionMat *)dst
           thresh:(double)thresh
           maxVal:(double)maxVal
    thresholdType:(int)thresholdType
{
    cv::threshold([src mat], [dst mat], thresh, maxVal, thresholdType);
}

/*
 * ===================================================================
 * Structural Analysis and Shape Descriptors
 */

// still nonimplement...

/*
 * ===================================================================
 * Motion Analysis and Object Tracking
 */

// still nonimplement...

/*
 * ===================================================================
 * Feature Detection
 */

/*
 * cv::Canny
 */
+ (void) Canny:(MotionMat *)src
           dst:(MotionMat *)dst
    threshold1:(double)threshold1
    threshold2:(double)threshold2
  apertureSize:(int)apertureSize/* =3 */
    l2gradient:(BOOL)l2gradient/* =false */
{
    cv::Canny([src mat], [dst mat], threshold1, threshold2, apertureSize, l2gradient);
}

+ (void) Canny:(MotionMat *)src
           dst:(MotionMat *)dst
    threshold1:(double)threshold1
    threshold2:(double)threshold2
  apertureSize:(int)apertureSize
{
    [self Canny:src dst:dst threshold1:threshold1 threshold2:threshold2 apertureSize:apertureSize l2gradient:false];
}

+ (void) Canny:(MotionMat *)src
           dst:(MotionMat *)dst
    threshold1:(double)threshold1
    threshold2:(double)threshold2
{
    [self Canny:src dst:dst threshold1:threshold1 threshold2:threshold2 apertureSize:3];
}

@end
