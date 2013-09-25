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
 * Interface for UIImage <=> MotionMat
 */

@interface MotionCV_helper : NSObject

+ (MotionMat *)MotionMatFromUIImage:(UIImage *)image;
+ (UIImage *)UIImageFromMotionMat:(MotionMat *)mat;

@end
