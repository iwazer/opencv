#include "opencv2/core.hpp"

@interface MotionMat ()
{
    cv::Mat *_cvMat;
}

- (cv::Mat&)mat;
- (void)setMat:(cv::Mat)mat;

@end
