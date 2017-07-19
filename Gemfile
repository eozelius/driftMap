source 'https://rubygems.org'

=begin
git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end
=end

gem 'rails', '~> 5.1.2'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'webpacker'
gem 'bcrypt', '~> 3.1.7'
gem 'pg'
gem 'geocoder'


# Bootstrap
gem 'sprockets-rails'
gem 'jquery-rails'
gem 'popper_js', '~> 1.9', '>= 1.9.9'
gem 'tether-rails'
gem 'bootstrap', '~> 4.0.0.alpha6'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  gem 'rspec-rails', '~> 3.6.0'
  gem 'web-console'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end