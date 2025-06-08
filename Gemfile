source "https://rubygems.org"

gem "rails", "~> 7.1.0"
gem "bootsnap"
gem "sprockets"


gem "erb"

gem "sass-rails"

gem "jquery-rails"

gem "slim-rails"

gem "rails-i18n"

gem "devise"
gem "devise-i18n"

gem "simple_form"

# Phone validation
gem "phony"
gem "phony_rails"

# Required for generating image proxies
gem "image_processing", "~> 1.2"

gem "globalize"

gem "bootstrap-sass"
gem "bootswatch-rails"
gem "autoprefixer-rails"
gem "font-awesome-sass", "~> 4.6.2"

gem "nested_form"

gem "jbuilder"

gem "search_object"

gem "faraday"

gem "rqrcode"

gem "draper"

# gem "icalendar", require: ['icalendar', 'icalendar/tzinfo']
gem "icalendar"

group :development do
  gem "spring"
  # gem "rails-erd"
  # gem "pry-rails"
  # gem "awesome_print"
  # gem "better_errors"
  # gem "binding_of_caller"
  # gem "i18n-tasks"
end

group :development, :test do
  gem "sqlite3"
  gem "spring-commands-rspec"
  gem "rspec-rails"
  gem "guard-rspec" # Continuous testing with Guard

  # gem "byebug" # Debugger
  # gem "simplecov" # Coverage

  gem "standard" # Linter
end

group :test do
  gem "faker"
  gem "capybara"
  gem "selenium-webdriver"
  gem "factory_bot_rails"
end

group :production do
  gem "pg" # Note: we can do this only for test/prod
  gem "puma"
end
