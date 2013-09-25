module Cv
  module Core
    def hconcat src1, src2, dst
      MotionCV_core.hconcat(src1, src:src2, dst:dst)
    end

    def vconcat src1, src2, dst
      MotionCV_core.vconcat(src1, src:src2, dst:dst)
    end

    def bitwise_and src1, src2, dst, mask=MotionMat.new
      MotionCV_core.bitwise_and(src1, src:src2, dst:dst, mask:mask)
    end

    def bitwise_not src, dst
      MotionCV_core.bitwise_not(src, dst:dst)
    end

    def bitwise_or src1, src2, dst, mask=MotionMat.new
      MotionCV_core.bitwise_or(src1, src:src2, dst:dst, mask:mask)
    end

    def bitwise_xor src1, src2, dst, mask=MotionMat.new
      MotionCV_core.bitwise_xor(src1, src:src2, dst:dst, mask:mask)
    end

    def min src1, src2, dst
      MotionCV_core.min(src1, src:src2, dst:dst)
    end

    def subtract src1, src2, dst
      MotionCV_core.subtract(src1, src:src2, dst:dst)
    end

    def circle mat, center, radius, rgb, thickness, lineType=8, shift=0
      MotionCV_core.circle(mat, center:center.map(&:to_f), radius:radius.to_i,
                           bgr:rgb2bgr(rgb),
                           thickness:thickness, lineType:lineType, shift:shift)
    end

    def rectangle mat, pt1, pt2, rgb, thickness, lineType=8, shift=0
      MotionCV_core.rectangle(mat, pt1:pt1, pt2:pt2,  bgr:rgb2bgr(rgb),
                              thickness:thickness, lineType:lineType, shift:shift)
    end
  end

  extend Core
end
