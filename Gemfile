source 'https://rubygems.org'

gem 'rails', github: "rails/rails"
gem 'mysql2', '>= 0.3.18', '< 0.5'          # Use mysql as the database for Active Record
gem 'puma', '~> 3.0'                        # Use Puma as the app server
gem 'rack-cors'                             # Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'



group :development, :test do
  gem 'byebug', platform: :mri              # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'dotenv-rails'                        # Load .env files
end

group :development do
  gem 'listen', '~> 3.0.5'
  gem 'spring'                              # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring-watcher-listen', '~> 2.0.0'   # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
