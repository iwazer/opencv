//
//  MotionMat.mm
//  motion-opencv
//
//  Created by 岩澤 英治 on 2013/07/17.
//  Copyright (c) 2013年 iwazer. All rights reserved.
//

#import "opencv2/motion/MotionMat.h"

#import "MotionMat_p.h"

#include <opencv2/core/mat.hpp>

@implementation MotionMat

- (id)init
{
    self = [super init];
    if (self) {
        _cvMat = new cv::Mat();
    }
    return self;
}

- (id)initWithRows:(int)rows cols:(int)cols channels:(int)channels
{
    self = [super init];
    if (self) {
        _cvMat = new cv::Mat(rows, cols, channels);
    }
    return self;
}

- (id)initWithSize:(CGSize)size bgr:(int *)bgr
{
    self = [super init];
    if (self) {
        _cvMat = new cv::Mat(cv::Size((int)size.width, (int)size.height), CV_8UC3, cv::Scalar(bgr[0], bgr[1], bgr[2]));
    }
    return self;
}

- (void)setMat:(cv::Mat)mat
{
    if (_cvMat) {
        delete(_cvMat);
    }
    _cvMat = new cv::Mat(mat);
}

- (void)set:(MotionMat *)mm
{
    [self setMat:[mm mat]];
}

- (void)copyTo:(MotionMat *)mat
          mask:(MotionMat *)mask
{
    _cvMat->copyTo([mat mat], [mask mat]);
}

- (void)copyTo:(MotionMat *)mat
{
    _cvMat->copyTo([mat mat], cv::Mat());
}

- (void)setIplImage:(IplImage*)image
{
    cv::Mat mat = cv::cvarrToMat(image);
    [self setMat:mat];
}

- (void)dealloc
{
    if (_cvMat) {
        delete(_cvMat);
        _cvMat = NULL;
    }
    [super dealloc];
}

- (cv::Mat&)mat
{
    return *_cvMat;
}

- (unsigned char *)data
{
    return _cvMat->data;
}
- (size_t)stepWithIndex:(int)index
{
    return _cvMat->step[index];
}
- (size_t)elemSize
{
    return _cvMat->elemSize();
}

- (BOOL)empty
{
    return _cvMat->empty();
}
- (size_t)total
{
    return _cvMat->total();
}

- (int)rows
{
    return _cvMat->rows;
}
- (int)cols
{
    return _cvMat->cols;
}

- (MotionIntSize)size
{
    cv::InputArray& ia = *_cvMat;
    MotionIntSize sz = {
        .width = ia.size().width,
        .height = ia.size().height
    };
    return sz;
}

- (MotionMat *)crop:(CGRect)rect
{
    cv::Mat *mat = new cv::Mat([self mat], cv::Rect(rect.origin.x,rect.origin.y,rect.size.width,rect.size.height));
    MotionMat *croped = [[MotionMat alloc] init];
    delete(croped->_cvMat);
    croped->_cvMat = mat;
    return croped;
}

@end
