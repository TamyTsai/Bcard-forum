source "https://rubygems.org"

ruby "3.0.0"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.1.3", ">= 7.1.3.4"

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails"

# Use postgresql as the database for Active Record
gem "pg", "~> 1.1"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", ">= 5.0"

# Bundle and transpile JavaScript [https://github.com/rails/jsbundling-rails]
gem "jsbundling-rails"

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails"

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"

# Use Redis adapter to run Action Cable in production
# gem "redis", ">= 4.0.1"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ mswin mswin64 mingw x64_mingw jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# devise 會員系統
gem 'devise', '~> 4.9', '>= 4.9.4'

# aasm 有限狀態機
gem 'aasm', '~> 5.5'

# friendly id
gem 'friendly_id', '~> 5.5', '>= 5.5.1'

# babosa 處理friendly id 的編碼
gem 'babosa', '~> 2.0'

# paranoia 軟刪除
gem 'paranoia', '~> 2.6', '>= 2.6.3'

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# Active Storage 的各種功能仰賴 Rails 沒有安裝的第三方軟體，必須另外安裝 libvips v8.6+ 或 ImageMagick，用於影像分析和轉換
# 影像分析和轉換也需要 image_processing 這個 gem。
gem "image_processing", "~> 1.2"
# gem 'mini_magick', '~> 4.13', '>= 4.13.1'
# ImageMagick (in rails < 7)、libvips (in rails >= 7)
# https://stackoverflow.com/questions/74855530/resizing-images-with-variant-method-creates-broken-image-icon-in-rails
# To resize images ActiveStorage uses third-party libraries, by default
# libvips (in rails >= 7)
# $ brew install vips
# ImageMagick (in rails < 7)
# $ brew install imagemagick

# 開發群組
group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri mswin mswin64 mingw x64_mingw ]

  # 中控台套件
  gem 'hirb-unicode', '~> 0.0.5'
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver"
end
