Pod::Spec.new do |s|
  s.name             = 'TempuraTesting'
  s.version          = File.read(".version-tempura-testing")
  s.summary          = 'UI Tests architecture for apps'

  s.homepage         = 'https://bendingspoons.com'
  s.license          = { :type => 'No License', :text => "Copyright 2018 BendingSpoons" }
  s.author           = { 'Bending Spoons' => 'team@bendingspoons.com' }
  s.source           = { :git => 'https://github.com/BendingSpoons/tempura-swift.git', :tag => 'tempura-testing-v' + s.version.to_s }

  s.ios.deployment_target = '11.0'
  s.user_target_xcconfig = { 'FRAMEWORK_SEARCH_PATHS' => '$(PLATFORM_DIR)/Developer/Library/Frameworks' }
  s.dependency 'Tempura', '>= 6.0', '< 7'
  s.swift_version = '5.0'

  s.ios.source_files = [
    'Tempura/UITests/**/*.swift',
  ]

  s.frameworks = "XCTest"
  s.pod_target_xcconfig = {
    'OTHER_SWIFT_FLAGS' => '$(inherited) -suppress-warnings',
    'FRAMEWORK_SEARCH_PATHS' => '$(inherited) "$(PLATFORM_DIR)/Developer/Library/Frameworks"',
    'ENABLE_BITCODE' => 'NO',
    'ENABLE_TESTING_SEARCH_PATHS' => 'YES',
  }
  
end
