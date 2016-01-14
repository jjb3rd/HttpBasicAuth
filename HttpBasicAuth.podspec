Pod::Spec.new do |spec|
  spec.name = 'HttpBasicAuth'
  spec.version = '0.1.0'
  spec.summary = 'Generic basic http auth Authorization header field parser for swift.'
  spec.homepage = 'https://github.com/jjb3rd/HttpBasicAuth'
  spec.license = { :type => 'MIT', :file => 'LICENSE.md' }
  spec.author = { 'John Becker' => 'john@beckersoft.com' }
  spec.source = { :git => 'https://github.com/jjb3rd/HttpBasicAuth.git', :tag => "#{spec.version}" }
  spec.source_files = 'Sources/*.swift'
  spec.ios.deployment_target = '8.0'
  spec.osx.deployment_target = '10.9'
  spec.requires_arc = true
  spec.module_name = 'HttpBasicAuth'
end
