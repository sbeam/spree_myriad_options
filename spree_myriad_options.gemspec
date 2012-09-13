# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_myriad_options'
  s.version     = '0.1.2'
  s.summary     = 'allow customers to add products with any combination of options to their cart. No variants needed!'
  s.description = 'lets the customer choose any combination of Option Values for a Product when adding to cart, and enter customized text for an option if needed. No maintenance of Spree Variants for every option combination is required.'
  s.required_ruby_version = '>= 1.9.2'

  s.author    = 'Samuel Z Beam'
  s.email     = 'sbeam@onsetcorps.net'
  s.homepage  = 'http://www.onsetdevelopment.com'

  s.files       = `git ls-files`.split("\n")
  s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")

  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core', '~> 1.1'

  s.add_development_dependency 'rspec-rails',  '~> 2.9.0'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'factory_girl_rails', '~> 1.7'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'shoulda-matchers',  '~> 1.0.0'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'guard-rspec', '~> 0.5.0'
end
