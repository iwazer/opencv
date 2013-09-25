unless defined?(Motion::Project::Config)
  raise "This file must be required within a RubyMotion project Rakefile."
end

lib_dir_path = File.dirname(File.expand_path(__FILE__))
Motion::Project::App.setup do |app|
  app.files.unshift(Dir.glob(File.join(lib_dir_path, "project/**/*.rb")))
  app.vendor_project(File.join(lib_dir_path, '../framework/opencv2.framework'),
    :static,
    :source_files=> [
                       'Versions/A/Headers/imgproc/imgproc_c.h',
                       'Versions/A/Headers/imgproc/types_c.h',
                       'Versions/A/Headers/motion/core_base.h',
                       'Versions/A/Headers/motion/MotionCV_core.h',
                       'Versions/A/Headers/motion/MotionCV_imgproc.h',
                       'Versions/A/Headers/motion/MotionCV_capi.h',
                       'Versions/A/Headers/motion/MotionCV_helper.h',
                       'Versions/A/Headers/motion/MotionMat.h'
                    ],
    :products    => ['opencv2'],
    :force_load  => false
  )
  app.frameworks += ['AVFoundation','AssetsLibrary']
  app.libs += ['-lc++']
end

task :clean do
  bs = File.join(lib_dir_path,
    '../framework/opencv2.framework', 'opencv2.framework.bridgesupport')
  puts "    Delete #{bs}"
  File.delete(bs) if File.exist?(bs)
end
