module Cv
  module Helper
    def MotionMatFromUIImage image
      MotionCV_helper.MotionMatFromUIImage(image)
    end

    def UIImageFromMotionMat mat
      MotionCV_helper.UIImageFromMotionMat(mat)
    end
  end

  extend Helper
end
