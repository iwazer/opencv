class MotionMat
  def initWithSize size, rgb=[0, 0, 0] # black
    bgr = Pointer.new(:int, 3)
    bgr[0] = rgb[2]
    bgr[1] = rgb[1]
    bgr[2] = rgb[0]
    initWithSize(size, bgr:bgr)
  end

  alias :width :cols
  alias :height :rows
end
