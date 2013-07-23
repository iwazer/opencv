# ----------------------------------------------------------------------------
#  CMake file for RubyMotion support
# ----------------------------------------------------------------------------
set(the_description "The RubyMotion bindings")

link_directories(${HOME}/${SDKROOT}/lib)
ocv_define_module(motion opencv_core opencv_imgproc)
