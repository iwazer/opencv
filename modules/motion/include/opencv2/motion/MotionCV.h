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

@end
