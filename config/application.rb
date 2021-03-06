require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module PalomLoja
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
    config.time_zone = 'Brasilia'
    config.i18n.available_locales = [:en, :'pt-BR']
    config.i18n.default_locale = :'pt-BR'
    config.encoding = 'utf-8'

    # Include all JS files, also those in subdolfer or javascripts assets folder
    # includes for exmaple applicant.js. JS isn't the problem so the catch all works.
    config.assets.precompile += %w(*.js)
    # Replace %w( *.css *.js *.css.scss) with complex regexp avoiding SCSS partials compilation
    config.assets.precompile += [/^[^_]\w+\.(css|css.scss)$/]
    #Adding active_admin JS and CSS to the precompilation list
    config.assets.precompile += %w( active_admin.css active_admin.js active_admin/print.css )
  end
end
