Pod::Spec.new do |s|
  s.name         = "LCPullRefresh"
  s.version      = "1.0.0"
  s.summary      = "Give pull-to-refresh to any UIScrollView"
  s.homepage     = "https://github.com/iLiuChang/LCPullRefresh"
  s.license      = "MIT"
  s.author       = "LiuChang"
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/iLiuChang/LCPullRefresh.git", :tag => s.version }
  s.requires_arc = true
  s.source_files = "LCPullRefresh/**/*.{h,m}"
  s.framework    = "UIKit"
  s.requires_arc = true
end