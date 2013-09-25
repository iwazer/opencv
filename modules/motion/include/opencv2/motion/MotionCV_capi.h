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

/*
 * OpenCV C API filters
 */
@interface MotionCV_capi : NSObject

+ (void)canny:(MotionMat *)src
          dst:(MotionMat *)dst
   threshold1:(double)threshold1
   threshold2:(double)threshold2
         size:(int)aperture_size;

+ (void)not:(MotionMat *)src
        dst:(MotionMat *)dst;

@end
