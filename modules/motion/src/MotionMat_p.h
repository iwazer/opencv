#include "opencv2/core.hpp"

@interface MotionMat ()
{
    cv::Mat *_cvMat;
}

- (cv::Mat&)mat;

@end
