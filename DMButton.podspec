Pod::Spec.new do |s|

s.name         = "DMButton"
s.version      = "1.0.0"
s.license      = { :type => "MIT", :file => "LICENSE" }
s.summary      = "DMButton"
s.homepage     = "http://www.eebochina.com"
s.author       = { "eebochina" => "eeweibo@eebochina.com" }
s.source       = { :git => "https://github.com/eebochina/DMButton.git, :tag => s.version}
s.source_files  = 'DMButton/*.{h,m}'
s.platform     = :ios, "7.0"
s.requires_arc = true
s.framework  = "UIKit"

end