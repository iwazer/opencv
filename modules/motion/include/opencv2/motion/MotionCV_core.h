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

@interface MotionCV_core : NSObject

/*
 * cv::{h|v}concat
 */
+ (void)hconcat:(MotionMat *)src1
            src:(MotionMat *)src2
            dst:(MotionMat *)dst;

+ (void)vconcat:(MotionMat *)src1
            src:(MotionMat *)src2
            dst:(MotionMat *)dst;
/*
 * cv::bitwise_and
 */
+ (void)bitwise_and:(MotionMat *)src1
                src:(MotionMat *)src2
                dst:(MotionMat *)dst
               mask:(MotionMat *)mask/*=Mat()*/;

+ (void)bitwise_and:(MotionMat *)src1
                src:(MotionMat *)src2
                dst:(MotionMat *)dst;

/*
 * cv::bitwise_not
 */
+ (void)bitwise_not:(MotionMat *)src
                dst:(MotionMat *)dst;

/*
 * cv::bitwise_or
 */
+ (void)bitwise_or:(MotionMat *)src1
               src:(MotionMat *)src2
               dst:(MotionMat *)dst
              mask:(MotionMat *)mask/* =Mat() */;

/*
 * cv::bitwise_xor
 */
+ (void)bitwise_xor:(MotionMat *)src1
                src:(MotionMat *)src2
                dst:(MotionMat *)dst
               mask:(MotionMat *)mask/* =Mat() */;

+ (void)bitwise_xor:(MotionMat *)src1
                src:(MotionMat *)src2
                dst:(MotionMat *)dst;

/*
 * cv::min
 */
+ (void)min:(MotionMat *)src1
        src:(MotionMat *)src2
        dst:(MotionMat *)dst;

/*
 * cv::split
 */
+ (void)split:(MotionMat *)mtx
           mv:(MotionMat **)mv;

/*
 * cv::subtract
 */
+ (void)subtract:(MotionMat *)src1
             src:(MotionMat *)src2
             dst:(MotionMat *)dst;

/*
 * cv::circle
 */
+ (void)circle:(MotionMat *)mat
        center:(CGPoint)center
        radius:(int)radius
           bgr:(int *)bgr
     thickness:(int)thickness
      lineType:(int)lineType
         shift:(int)shift;

/*
 * cv::rectangle
 */
+ (void)rectangle:(MotionMat *)mat
              pt1:(CGPoint)pt1
              pt2:(CGPoint)pt2
              bgr:(int *)bgr
        thickness:(int)thickness
         lineType:(int)lineType
            shift:(int)shift;

@end
