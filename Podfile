# Uncomment the next line to define a global platform for your project
#cplatform :ios, '9.0'

target 'ParseLab' do
use_frameworks!
  pod 'Parse'
     post_install do |installer|
       installer.pods_project.targets.each do |target|
         target.build_configurations.each do |config|
           config.build_settings['SWIFT_VERSION'] = '3.2'
         end
       end
     end
  target 'ParseLabTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'ParseLabUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end
