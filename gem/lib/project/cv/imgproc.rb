module Cv
  module Imgproc
    MotionCV = MotionCV_imgproc

    def equalizeHist src, dst
      MotionCV.equalizeHist(src, dst:dst)
    end

    def blur src, dst, size, anchor=[-1,-1], borderType=MCV_BORDER_DEFAULT
      MotionCV.blur(src, dst:dst,
                            size:size, anchor:anchor, borderType:borderType)
    end

    def GaussianBlur src, dst, size, sigmaX, sigmaY=0, borderType=MCV_BORDER_DEFAULT
      MotionCV.GaussianBlur(src, dst:dst,
                                    size:size, sigmaX:sigmaX, sigmaY:sigmaY,
                                    borderType:borderType)
    end

    def resize src, dst, dsize, fx=0, fy=0, interpolation=CV_INTER_LINEAR
      MotionCV.resize(src, dst:dst,
                              dsize:dsize, fx:fx, fy:fy, interpolation:interpolation)
    end

    def adaptiveThreshold src, dst, maxValue, adaptiveMethod, thresholdType, blockSize, c
      MotionCV.adaptiveThreshold(src, dst:dst,
                                         maxValue:maxValue, adaptiveMethod:adaptiveMethod,
                                         thresholdType:thresholdType, blockSize:blockSize, C:c)
    end

    def cvtColor src, dst, code, dcn=0
      MotionCV.cvtColor(src, dst:dst, code:code, dcn:dcn)
    end

    def distanceTransform src, dst, distanceType, maskSize
      MotionCV.distanceTransform(src, dst:dst,
                                         distanceType:distanceType, maskSize:maskSize)
    end

    def threshold src, dst, thresh, maxVal, thresholdType
      MotionCV.threshold(src, dst:dst,
                                 thresh:thresh, maxVal:maxVal, thresholdType:thresholdType)
    end

    def findContours src, contours, mode, method, offset=[0,0]
      MotionCV.findContours(src, contours: contours, mode: mode, method: method, offset: offset)
    end

    def Canny src, dst, threshold1, threshold2, apertureSize=3, l2gradient=false
      MotionCV.Canny(src, dst:dst,
                             threshold1:threshold1, threshold2:threshold2,
                             apertureSize:apertureSize, l2gradient:l2gradient)
    end
  end

  extend Imgproc
end
