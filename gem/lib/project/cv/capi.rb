#
# from C API
#

module Cv
  module Capi
    def canny src, dst, threshold1, threshold2, aperture_size
      MotionCV_capi.canny(src, dst:dst,
                          threshold1:threshold1, threshold2:threshold2, size:aperture_size)
    end

    def not src, dst
      MotionCV_capi.not(src, dst:dst)
    end

    def rgb2bgr rgb
      bgr = Pointer.new(:int, 3)
      rgb.reverse.each_with_index{|v,i| bgr[i] = v}
      bgr
    end
  end

  extend Capi
end
