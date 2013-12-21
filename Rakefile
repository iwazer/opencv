task "default" => "build"
desc "Build OpenCV framework & motioncv gem\n(ex: rake build:framework <target={onlysim|all}>)"
task :build => [:"build:framework", :"build:gem"]
desc "Clear OpenCV framework & motioncv gem build objects"
task :clean => [:"clean:framework", :"clean:gem"]

namespace :build do
  desc "Build OpenCV framework (ex: rake build:framework <target={onlysim|all}>)"
  task :framework do
    sh "python platforms/ios/build_framework.py gem/framework #{ENV['target']} | tee gem/framework/build.log"
  end

  desc "Build motioncv gem"
  task :gem do
    sh "cd gem; gem build motioncv.gemspec"
  end
end

namespace :clean do
  desc "Clear OpenCV framework build objects"
  task :framework do
    sh "rm -r gem/framework/opencv2.framework" if Dir.exists?('gem/framework/opencv2.framework')
    sh "rm -r gem/framework/build" if Dir.exists?('gem/framework/build')
  end

  desc "Clear motioncv gem build objects"
  task :gem do
    sh "rm gem/motioncv-*.gem" unless Dir.glob("gem/motioncv-*.gem").select{|s| File.exists?(s)}.empty?
  end
end
