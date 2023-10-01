Gem::Specification.new do |s|
  s.name        = 'freeleadsdata-api'
  s.version     = '1.0.1'
  s.date        = '2023-10-01'
  s.summary     = "Ruby Gem for Managing FreeLeadData API."
  s.description = "Ruby Gem for Managing FreeLeadData API."
  s.authors     = ["Leandro Daniel Sardi"]
  s.email       = 'leandro@connectionsphere.com'
  s.files       = [
    'lib/freeleadsdata-api.rb',
  ]
  s.homepage    = 'https://rubygems.org/gems/freeleadsdata-api'
  s.license     = 'MIT'
  s.add_runtime_dependency 'blackstack-core', '~> 1.2.14', '>= 1.2.14'
  s.add_runtime_dependency 'simple_cloud_logging', '~> 1.2.2', '>= 1.2.2'
  s.add_runtime_dependency 'colorize', '~> 0.8.1', '>= 0.8.1'
  s.add_runtime_dependency 'open-uri', '~> 0.2.0', '>= 0.2.0'
end