source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.2'

# Use Puma as the app server
gem 'puma', '~> 4.3'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'devise'
#ユーザ認証

gem 'bootstrap'
#bootstrap4

gem 'kaminari'
#ページネーション追加

gem 'ransack'
#検索機能追加

gem 'slim-rails'
#slimのジェネレータ

gem 'html2slim'
#erb->slimの変換

gem 'pry-rails'
gem 'pry-doc'
#DBを見やすく

gem 'better_errors'
# エラー画面をわかりやすく整形してくれる
gem 'binding_of_caller'
# better_errorsの画面上にirb/pry(PERL)を表示する

gem 'simple_calendar', '~> 2.0'
#simple calendar

gem "font-awesome-sass"

gem 'dropzonejs-rails'

gem 'pg', '~> 0.18', group: :production
gem 'rails_12factor', group: :production

gem 'selenium-webdriver'
gem 'webdrivers'
gem "aws-sdk-s3", require: false
group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'sqlite3', '~> 1.3.6'
end

group :development, :test do
  gem "rspec-rails", "~>3.7"
  #Rspecテスト用GEM
  gem "factory_bot_rails", "~>4.11"
  #テストデータ作成支援
  gem 'spring-commands-rspec'
  #rspecの起動時間短縮
  gem 'capybara', "~>2.15.2"
end
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

