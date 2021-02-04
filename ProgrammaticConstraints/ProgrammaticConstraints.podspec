Pod::Spec.new do |s|
  s.name         = "ProgrammaticConstraints"
  s.version      = "0.0.1"
  s.summary      = "ProgrammaticConstraints"
  s.description  = "Quick and easy PRogrammtic Constraints for UIKit."
  s.license      = { :type => 'Copyright', :text => <<-LICENSE
                   Copyright 2018
                   Permission is granted to...
                  LICENSE
                }
  s.author       = { "Jack Smith" => "jack.a.smith@live.com" }
  s.platform     = :ios, "9.0"
  s.homepage     = "https://github.com/weAreJack/Programmatic-Constraints.git"
  s.source       = { :git => "https://github.com/weAreJack/Programmatic-Constraints", :tag => "#{s.version}" }
  s.source_files = "ProgrammaticConstraints/UIView+ProgrammaticConstraints/*.swift"
end
