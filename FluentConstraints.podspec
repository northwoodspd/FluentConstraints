Pod::Spec.new do |s|
  s.name         = "FluentConstraints"
  s.version      = "0.0.3"
  s.summary      = "A nicer way to build Auto Layout constraints in Swift"
  s.homepage     = "https://github.com/northwoodspd/FluentConstraints"
  s.license      = 'MIT'
  s.author       = { "Steve Madsen" => "steve.madsen@teamnorthwoods.com" }
  s.source       = { :git => "https://github.com/northwoodspd/FluentConstraints.git", :tag => '0.0.3' }
  s.platform     = :ios, '8.0'
  s.ios.frameworks = 'UIKit'
  s.source_files = 'FluentConstraints/*.swift'
  s.requires_arc = true
end
