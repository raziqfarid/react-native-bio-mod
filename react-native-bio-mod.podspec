require "json"

package = JSON.parse(File.read(File.join(__dir__, "package.json")))

Pod::Spec.new do |s|
  s.name         = "react-native-bio-mod"
  s.version      = package["version"]
  s.summary      = package["description"]
  s.description  = <<-DESC
                  react-native-bio-mod
                   DESC
  s.homepage     = "https://github.com/raziqfarid/react-native-bio-mod"
  s.license      = "MIT"
  # s.license    = { :type => "MIT", :file => "FILE_LICENSE" }
  s.authors      = { "Your Name" => "raziqfarid@email.com" }
  s.platforms    = { :ios => "9.0" }
  s.source       = { :git => "https://github.com/raziqfarid/react-native-bio-mod.git", :tag => "#{s.version}" }

  s.source_files = "ios/**/*.{h,m,swift}"
  s.requires_arc = true

  s.dependency "React"
  # ...
  # s.dependency "..."
end

