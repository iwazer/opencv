//
//  MotionCV.m
//  OpenCV
//
//  Created by 岩澤 英治 on 2013/07/24.
//
//

#import "opencv2/motion/MotionCV_core.h"
#import "MotionMat_p.h"

#include "opencv2/core.hpp"
#include "opencv2/imgproc.hpp"

@implementation MotionCV_core

/*
 * ===================================================================
 * Undocumented...
 */

/*
 * cv::{h|v}concat
 */
+ (void)hconcat:(MotionMat *)src1
            src:(MotionMat *)src2
            dst:(MotionMat *)dst
{
    cv::hconcat([src1 mat], [src2 mat], [dst mat]);
}

+ (void)vconcat:(MotionMat *)src1
            src:(MotionMat *)src2
            dst:(MotionMat *)dst
{
    cv::vconcat([src1 mat], [src2 mat], [dst mat]);
}

/*
 * ===================================================================
 * Basic Structures
 */

// still nonimplement...

/*
 * ===================================================================
 * Operations on Arrays
 */

/*
 * cv::bitwise_and
 */
+ (void)bitwise_and:(MotionMat *)src1
                src:(MotionMat *)src2
                dst:(MotionMat *)dst
               mask:(MotionMat *)mask/* =Mat() */
{
    cv::bitwise_and([src2 mat], [src2 mat], [dst mat], [mask mat]);
}

+ (void)bitwise_and:(MotionMat *)src1
                src:(MotionMat *)src2
                dst:(MotionMat *)dst
{
    cv::bitwise_and([src2 mat], [src2 mat], [dst mat], cv::Mat());
}

/*
 * cv::bitwise_not
 */
+ (void)bitwise_not:(MotionMat *)src
                dst:(MotionMat *)dst
{
    cv::bitwise_not([src mat], [dst mat]);
}

/*
 * cv::bitwise_or
 */
+ (void)bitwise_or:(MotionMat *)src1
               src:(MotionMat *)src2
               dst:(MotionMat *)dst
              mask:(MotionMat *)mask/* =Mat() */
{
    cv::bitwise_or([src1 mat], [src2 mat], [dst mat], [mask mat]);
}

/*
 * cv::bitwise_xor
 */
+ (void)bitwise_xor:(MotionMat *)src1
                src:(MotionMat *)src2
                dst:(MotionMat *)dst
               mask:(MotionMat *)mask/* =Mat() */
{
    cv::bitwise_xor([src1 mat], [src2 mat], [dst mat], [mask mat]);
}

+ (void)bitwise_xor:(MotionMat *)src1
                src:(MotionMat *)src2
                dst:(MotionMat *)dst
{
    cv::bitwise_xor([src1 mat], [src2 mat], [dst mat], cv::Mat());
}

/*
 * cv::min
 */
+ (void)min:(MotionMat *)src1
        src:(MotionMat *)src2
        dst:(MotionMat *)dst
{
    cv::min([src1 mat], [src2 mat], [dst mat]);
}

/*
 * cv::split
 */
+ (void)split:(MotionMat *)mtx
           mv:(MotionMat **)mv
{
    std::vector<cv::Mat> vec;
    cv::split([mtx mat], vec);
    for (int i=0; i<vec.size(); i++) {
        MotionMat *mat = [[MotionMat alloc] init];
        [mat setMat:vec.at(i)];
        mv[i] = mat;
    }
}

/*
 * cv::subtract
 */
+ (void)subtract:(MotionMat *)src1
             src:(MotionMat *)src2
             dst:(MotionMat *)dst
{
    cv::subtract([src1 mat], [src2 mat], [dst mat]);
}

/*
 * ===================================================================
 * Drawing Functions
 */

/*
 * cv::circle
 */
+ (void)circle:(MotionMat *)mat
        center:(CGPoint)center
        radius:(int)radius
           bgr:(int *)bgr
     thickness:(int)thickness
      lineType:(int)lineType
         shift:(int)shift
{
    cv::circle([mat mat],
               cv::Point(center.x, center.y), radius,
               cv::Scalar(bgr[0], bgr[1], bgr[2]),
               thickness,
               lineType,
               shift);
}

/*
 * cv::rectangle
 */
+ (void)rectangle:(MotionMat *)mat
              pt1:(CGPoint)pt1
              pt2:(CGPoint)pt2
              bgr:(int *)bgr
        thickness:(int)thickness
         lineType:(int)lineType
            shift:(int)shift
{
    cv::rectangle([mat mat],
                  cv::Point(pt1.x, pt1.y), cv::Point(pt2.x, pt2.y),
                  cv::Scalar(bgr[0], bgr[1], bgr[2]),
                  thickness,
                  lineType,
                  shift);
}

/*
 * ===================================================================
 * Clustering
 */

// still nonimplement...

@end
