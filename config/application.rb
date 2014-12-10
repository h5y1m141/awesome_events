require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_model/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module AwesomeEvents
  class Application < Rails::Application
    config.time_zone = 'Tokyo'
    config.autoload_paths += Dir[Rails.root.join('app', 'uploaders')]

    I18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]
    I18n.available_locales = [:en, :ja]
    I18n.enforce_available_locales = true
    I18n.default_locale = :ja

  end
end
