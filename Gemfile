source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
# Use sqlite3 as the database for Active Record
# Use SCSS for stylesheets
# Use Uglifier as compressor for JavaScript assets
# Use CoffeeScript for .coffee assets and views
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
# Use jquery as the JavaScript library
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
# bundle exec rake doc:rails generates the API under doc/api
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
# Use Unicorn as the app server
# gem 'unicorn'
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development


ruby '2.2.3'
gem 'google_drive'
gem 'geocoder'
gem 'geokit'
gem 'rails', '4.2.4'
gem 'sass-rails', '~> 5.0'
gem 'bootstrap-sass', '~> 3.3.5'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc


group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'sqlite3'
  gem 'pry'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :production do
  #PostGres replaces sqlLight in production
  gem 'pg'
  gem 'rails_12factor'
end
