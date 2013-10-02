module Cv
  module Helper
    MotionCV = MotionCV_helper

    def MotionMatFromUIImage image
      MotionCV.MotionMatFromUIImage(image)
    end

    def UIImageFromMotionMat mat
      MotionCV.UIImageFromMotionMat(mat)
    end
  end

  extend Helper
end
