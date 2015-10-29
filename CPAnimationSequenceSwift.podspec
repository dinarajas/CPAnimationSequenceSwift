Pod::Spec.new do |s|
  s.name         = "CPAnimationSequenceSwift"
  s.version      = "0.0.1"
  s.summary      = "Swift version of CPAnimationSequence"
  s.description  = <<-DESC
                   The CPAnimationSequenceSwift provides a ability to run animations 
                   one by one on iOS devices. This library is designed to make it quick and 
                   easy to create sequential animations for views.
                   DESC
  s.homepage     = "https://github.com/yangmeyer/CPAnimationSequence"
  s.license      = { :type => "APACHE", :file => "License.md" }
  s.author       = { "Dinesh Raja" => "dina.raja.s@gmail.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/dineshrajas/CPAnimationSequenceSwift.git", :tag => "0.0.1" }
  s.source_files  = "SwiftAnimation"
  s.requires_arc = true
end