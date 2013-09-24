module Cv
  module Helper
    def MotionMatFromUIImage image
      MotionCV.MotionMatFromUIImage(image)
    end

    def UIImageFromMotionMat mat
      MotionCV.UIImageFromMotionMat(mat)
    end
  end

  extend Helper
end
