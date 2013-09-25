//
//  MotionCV.m
//  OpenCV
//
//  Created by 岩澤 英治 on 2013/07/24.
//
//

#import "opencv2/motion/MotionCV_helper.h"
#import "MotionMat_p.h"

#include "opencv2/core.hpp"
#include "opencv2/imgproc.hpp"

/*
 * Interface for UIImage <=> MotionMat
 */
@implementation MotionCV_helper

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

@end
