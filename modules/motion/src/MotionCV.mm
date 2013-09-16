//
//  MotionCV.m
//  OpenCV
//
//  Created by 岩澤 英治 on 2013/07/24.
//
//

#import "opencv2/motion/MotionCV.h"
#import "MotionMat_p.h"

#include "opencv2/core.hpp"
#include "opencv2/imgproc.hpp"

@implementation MotionCV

+ (MotionMat *)MotionMatFromUIImage:(UIImage *)image
{
    CGColorSpaceRef colorSpace = CGImageGetColorSpace(image.CGImage);
    CGFloat cols = image.size.width;
    CGFloat rows = image.size.height;

    MotionMat *mat = [[MotionMat alloc] initWithRows:rows cols:cols channels:CV_8UC4];

    CGContextRef contextRef = CGBitmapContextCreate([mat data],                 // Pointer to  data
                                                    cols,                       // Width of bitmap
                                                    rows,                       // Height of bitmap
                                                    8,                          // Bits per component
                                                    [mat stepWithIndex:0],      // Bytes per row
                                                    colorSpace,                 // Colorspace
                                                    kCGImageAlphaNoneSkipLast |
                                                    kCGBitmapByteOrderDefault); // Bitmap info flags

    CGContextDrawImage(contextRef, CGRectMake(0, 0, cols, rows), image.CGImage);
    CGContextRelease(contextRef);
    CGColorSpaceRelease(colorSpace);

    return mat;
}

+ (UIImage *)UIImageFromMotionMat:(MotionMat *)mat
{
    NSData *data = [NSData dataWithBytes:[mat data] length:[mat elemSize]*[mat total]];
    CGColorSpaceRef colorSpace;

    if ([mat elemSize] == 1) {
        colorSpace = CGColorSpaceCreateDeviceGray();
    } else {
        colorSpace = CGColorSpaceCreateDeviceRGB();
    }

    CGDataProviderRef provider = CGDataProviderCreateWithCFData((CFDataRef)data);

    // Creating CGImage from cv::Mat
    CGImageRef imageRef = CGImageCreate([mat cols],                                 //width
                                        [mat rows],                                 //height
                                        8,                                          //bits per component
                                        8 * [mat elemSize],                         //bits per pixel
                                        [mat stepWithIndex:0],                      //bytesPerRow
                                        colorSpace,                                 //colorspace
                                        kCGImageAlphaNone|kCGBitmapByteOrderDefault,// bitmap info
                                        provider,                                   //CGDataProviderRef
                                        NULL,                                       //decode
                                        false,                                      //should interpolate
                                        kCGRenderingIntentDefault                   //intent
                                        );

    // Getting UIImage from CGImage
    UIImage *finalImage = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
    CGDataProviderRelease(provider);
    CGColorSpaceRelease(colorSpace);

    return finalImage;
}

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

+ (void)blur:(MotionMat *)src
         dst:(MotionMat *)dst
        size:(MotionIntSize)size
      anchor:(MotionIntPoint)ancho
  borderType:(int)borderType
{
    cv::blur([src mat], [dst mat], cv::Size(size.width, size.height), cv::Point(-1, -1), cv::BORDER_DEFAULT);
}

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
 * cv::subtract
 */
+ (void)subtract:(MotionMat *)src1
             src:(MotionMat *)src2
             dst:(MotionMat *)dst
{
    cv::subtract([src1 mat], [src2 mat], [dst mat]);
}

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
 * cv::equalizeHist
 */
+ (void)equalizeHist:(MotionMat *)src
                 dst:(MotionMat *)dst
{
    cv::equalizeHist([src mat], [dst mat]);
}

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

+ (void)threshold:(MotionMat *)src
              dst:(MotionMat *)dst
           thresh:(double)thresh
           maxVal:(double)maxVal
    thresholdType:(int)thresholdType
{
    cv::threshold([src mat], [dst mat], thresh, maxVal, thresholdType);
}

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
 * cv::distanceTransform
 */
+ (void)distanceTransform:(MotionMat *)src
                      dst:(MotionMat *)dst
             distanceType:(int)distanceType
                 maskSize:(int)maskSize
{
    cv::distanceTransform([src mat], [dst mat], distanceType, maskSize);
}

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

/*
 * cv::findContours
 */
+ (void) findContours:(MotionMat *)src
             contours:(NSMutableArray *)contoursArray
                 mode:(int)mode
               method:(int)method
               offset:(MotionIntPoint)offset
{
    std::vector<std::vector<cv::Point> > contours;
    cv::findContours([src mat], contours, mode, method, cv::Point(offset.x, offset.y));

    for (int i = 0; i < contours.size(); i++ ) {
        
        std::vector<cv::Point> contour = contours[i];
        UIBezierPath *path = [UIBezierPath bezierPath];
        for (int j = 0; j < contour.size(); j++) {
            cv::Point cvPoint = contour[j];
            CGPoint point = CGPointMake(cvPoint.x, cvPoint.y);
            if (j == 0) {
                [path moveToPoint:point];
            } else {
                [path addLineToPoint:point];
            }
        }
        [contoursArray addObject:path];
    }
}

@end
