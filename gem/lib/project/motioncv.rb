class MotionCV
end

module Cv
  class << self
    ##
    def MotionMatFromUIImage image
      MotionCV.MotionMatFromUIImage(image)
    end

    def UIImageFromMotionMat mat
      MotionCV.MotionMatFromUIImage(mat)
    end

    ##
    def canny src, dst, threshold1, threshold2, aperture_size
      MotionCV.canny(src, dst:dst, threshold1:threshold1, threshold2:threshold2, size:aperture_size)
    end

    def not src, dst
      MotionCV.not(src, dst:dst)
    end

    ##
    def bitwise_xor src1, src2, dst, mask=MotionMat.new
      MotionCV.bitwise_xor(src1, src:src2, dst:dst, mask:mask)
    end

    def min src1, src2, dst
      MotionCV.min(src1, src:src2, dst:dst)
    end

    def subtract src1, src2, dst
      MotionCV.subtract(src1, src:src2, dst:dst)
    end

    def blur src, dst, size, anchor, borderType
      MotionCV.blur(src, dst:dst, size:size, anchor:anchor, borderType:borderType)
    end

    def equalizeHist src, dst
      MotionCV.equalizeHist(src, dst:dst)
    end

    def resize src, dst, dsize, fx=0, fy=0, interpolation=CV_INTER_LINEAR
      MotionCV.resize(src, dst:dst, dsize:dsize, fx:fx, fy:fy, interpolation:interpolation)
    end

    def cvtColor src, dst, code, dcn=0
      MotionCV.cvtColor(src, dst:dst, code:code, dcn:dcn)
    end

    def threshold src, dst, thresh, maxVal, thresholdType
      MotionCV.threshold(src, dst:dst, thresh:thresh, maxVal:maxVal, thresholdType:thresholdType)
    end

    def adaptiveThreshold src, dst, maxValue, adaptiveMethod, thresholdType, blockSize, c
      MotionCV.adaptiveThreshold(src, dst:dst, maxValue:maxValue, adaptiveMethod:adaptiveMethod,
                                 thresholdType:thresholdType, blockSize:blockSize, C:c)
    end

    def GaussianBlur src, dst, size, sigmaX, sigmaY=0, borderType=MCV_BORDER_DEFAULT
      MotionCV.GaussianBlur(src, dst:dst, size:size, sigmaX:sigmaX, sigmaY:sigmaY,
                            borderType:borderType)
    end

    def Canny src, dst, threshold1, threshold2, apertureSize=3, l2gradient=false
      MotionCV.Canny(src, dst:dst, threshold1:threshold1, threshold2:threshold2,
                     apertureSize:apertureSize, l2gradient:l2gradient)
    end
  end
end
