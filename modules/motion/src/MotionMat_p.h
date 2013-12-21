#include "opencv2/core.hpp"
#include "opencv2/imgproc/imgproc_c.h"

@interface MotionMat ()
{
    cv::Mat _cvMat;
}

- (cv::Mat&)mat;
- (void)setMat:(cv::Mat)mat;
- (void)setIplImage:(IplImage*)image;

@end
