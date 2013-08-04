desc "Build OpenCV framework & motioncv gem"
task :build => [:"build:framework", :"build:gem"]

namespace :build do
  desc "Build OpenCV framework"
  task :framework do
    sh "python platforms/ios/build_framework.py gem/framework"
  end

  desc "Build motioncv gem"
  task :gem do
    sh "cd gem; gem build motioncv.gemspec"
  end
end
