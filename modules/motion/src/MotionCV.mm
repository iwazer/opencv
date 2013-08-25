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
    cv::threshold([src mat], [dst mat], 0, 255, thresholdType);
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

@end
