source 'http://rubygems.org'

gem 'rails', '3.1.3'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.1.5'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
  gem 'twitter-bootstrap-rails'
end

gem 'jquery-rails'
gem 'haml-rails'
gem 'rails3-jquery-autocomplete'
gem 'thin'
gem 'oauth'
gem 'psych'
gem 'friendly_id', '~> 4.0.0.beta14'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :production do
  gem 'pg'
end

group :development do
  gem 'faker'
end

group :development, :test do
  gem 'sqlite3'
  gem 'rspec-rails', '~> 2.7'
  gem 'spork', '~> 0.9.0.rc'
end

group :test do
  gem 'factory_girl_rails'
  gem 'vcr'
  gem 'webmock'
  gem 'webrat'
end
