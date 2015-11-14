require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

module CommitCrap
  class Application < Rails::Application
    config.i18n.enforce_available_locales = true
    config.i18n.default_locale = :'pt-BR'
    config.encoding = 'utf-8'
    config.time_zone = 'Brasilia'
    config.active_record.raise_in_transactional_callbacks = true
  end
end

SECRETS = Rails.application.secrets
