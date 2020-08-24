require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Mib
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    # config.autoload_paths += Dir[Rails.root.join('app', 'uploaders')]
   
    ###この1行が必要
    config.logger = Logger.new(STDOUT)

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end

module TimeFormatSandbox
  class Application < Rails::Application
    # ...

    # タイムゾーンを日本時間に設定
    config.time_zone = 'Asia/Tokyo'
    
    # デフォルトのロケールを日本（ja）に設定
    config.i18n.default_locale = :ja
  end
end
