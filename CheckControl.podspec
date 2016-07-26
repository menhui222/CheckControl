

Pod::Spec.new do |s|

 

  s.name         = "CheckControl"
  s.version      = "0.0.1"
  s.summary      = "CAShapeLayer "

 
  s.description  = <<-DESC
                   DESC

  s.homepage     = "http://menhui222.github.io"
  



  s.license      = "MIT"
  
  s.author             = { "menghui" => "menhui222@163.com" }
s.platform    = :ios, "8.0"
  s.source       = { :git => "https://github.com/menhui222/CheckControl.git", :tag => s.version }



  s.source_files  =  'Classes',"CheckControl/CheckControl.{swift,h,m}"


  s.framework = 'UIKit'

  s.requires_arc = true  

  
end
