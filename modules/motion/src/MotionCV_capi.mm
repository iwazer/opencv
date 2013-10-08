//
//  MotionCV.m
//  OpenCV
//
//  Created by 岩澤 英治 on 2013/07/24.
//
//

#import "opencv2/motion/MotionCV_capi.h"
#import "MotionMat_p.h"

#include "opencv2/core.hpp"
#include "opencv2/imgproc.hpp"

/*
 * OpenCV C API filters
 */

@implementation MotionCV_capi

+ (void)canny:(MotionMat *)src
          dst:(MotionMat *)dst
   threshold1:(double)threshold1
   threshold2:(double)threshold2
         size:(int)aperture_size
{
    IplImage ipl = [src mat];
    IplImage *srcImage = &ipl;
    IplImage *edgeImage = cvCreateImage(cvGetSize(srcImage), IPL_DEPTH_8U, 1);
    cvCanny(srcImage, edgeImage, threshold1, threshold2, aperture_size);
    [dst setIplImage:edgeImage];
    cvReleaseImageHeader(&edgeImage);
}

+ (void)not:(MotionMat *)src
        dst:(MotionMat *)dst
{
    IplImage ipl = [src mat];
    IplImage *srcImage = &ipl;
    IplImage *outImage = cvCreateImage(cvGetSize(srcImage), srcImage->depth, srcImage->nChannels);
    cvNot(srcImage, outImage);
    [dst setIplImage:outImage];
    cvReleaseImageHeader(&outImage);
}

@end
