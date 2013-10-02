module Cv
  module Core
    MotionCV = MotionCV_core

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

    def split mtx, mv
      _mv = Pointer.new(:object, mtx.channels)
      MotionCV.split(mtx, mv:_mv)
      mtx.channels.times do |i|
        mv << _mv[i]
      end
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
  end

  extend Core
end
