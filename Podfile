source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '10.0'
use_frameworks!
inhibit_all_warnings!

target 'FacebookTestExample' do
  pod 'FacebookLogin'
end

target 'FacebookTestExampleTests' do
  pod 'FacebookLogin'
  pod 'Cuckoo'
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['SWIFT_VERSION'] = '3.0'
    end
  end
end
