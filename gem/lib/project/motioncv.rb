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
    def hconcat src1, src2, dst
      MotionCV.hconcat(src1, src:src2, dst:dst)
    end

    def vconcat src1, src2, dst
      MotionCV.vconcat(src1, src:src2, dst:dst)
    end

    def bitwise_and src1, src2, dst, mask=MotionMat.new
      MotionCV.bitwise_and(src1, src:src2, dst:dst, mask:mask)
    end

    def bitwise_not src, dst
      MotionCV.bitwise_not(src, dst:dst)
    end

    def bitwise_or src1, src2, dst, mask=MotionMat.new
      MotionCV.bitwise_or(src1, src:src2, dst:dst, mask:mask)
    end

    def bitwise_xor src1, src2, dst, mask=MotionMat.new
      MotionCV.bitwise_xor(src1, src:src2, dst:dst, mask:mask)
    end

    def min src1, src2, dst
      MotionCV.min(src1, src:src2, dst:dst)
    end

    def subtract src1, src2, dst
      MotionCV.subtract(src1, src:src2, dst:dst)
    end

    def circle mat, center, radius, rgb, thickness, lineType=8, shift=0
      MotionCV.circle(mat, center:center.map(&:to_f), radius:radius.to_i,
                      bgr:rgb2bgr(rgb),
                      thickness:thickness, lineType:lineType, shift:shift)
    end

    def rectangle mat, pt1, pt2, rgb, thickness, lineType=8, shift=0
      MotionCV.rectangle(mat, pt1:pt1, pt2:pt2,  bgr:rgb2bgr(rgb),
                         thickness:thickness, lineType:lineType, shift:shift)
    end

    def blur src, dst, size, anchor=[-1,-1], borderType=MCV_BORDER_DEFAULT
      MotionCV.blur(src, dst:dst, size:size, anchor:anchor, borderType:borderType)
    end

    def equalizeHist src, dst
      MotionCV.equalizeHist(src, dst:dst)
    end

    def resize src, dst, dsize, fx=0, fy=0, interpolation=CV_INTER_LINEAR
      MotionCV.resize(src, dst:dst, dsize:dsize, fx:fx, fy:fy, interpolation:interpolation)
    end

    def split mtx, mv
      _mv = Pointer.new(:object, mtx.channels)
      MotionCV.split(mtx, mv:_mv)
      mtx.channels.times do |i|
        mv << _mv[i]
      end
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

    def distanceTransform src, dst, distanceType, maskSize
      MotionCV.distanceTransform(src, dst:dst, distanceType:distanceType, maskSize:maskSize)
    end

    def Canny src, dst, threshold1, threshold2, apertureSize=3, l2gradient=false
      MotionCV.Canny(src, dst:dst, threshold1:threshold1, threshold2:threshold2,
                     apertureSize:apertureSize, l2gradient:l2gradient)
    end

    def rgb2bgr rgb
      bgr = Pointer.new(:int, 3)
      rgb.reverse.each_with_index{|v,i| bgr[i] = v}
      bgr
    end
  end
end
