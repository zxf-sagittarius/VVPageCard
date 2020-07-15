#
# Be sure to run `pod lib lint VVPageCard.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'VVPageCard'
  s.version          = '0.0.1'
  s.summary          = 'A short description of VVPageCard.'
  s.description      = <<-DESC
将一个复杂页面分割成多个模块，每个模块作为一个card，页面由多个卡片进行组装，事件处理可以使用VVEventBus实现view到controller间的通信
                       DESC
  s.homepage         = 'https://github.com/zxf-sagittarius/VVPageCard'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'zxf-sagittarius' => 'zxf-sagittarius@qq.com' }
  s.source           = { :git => 'https://github.com/zxf-sagittarius/VVPageCard.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'VVPageCard/Classes/**/*.{h,m}'
  
  s.dependency 'YYModel'
  
end
