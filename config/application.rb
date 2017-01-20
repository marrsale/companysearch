require_relative 'boot'

require 'rails/all'

$VERBOSE = nil

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
# Bundler.require(*Rails.groups)
Kernel.silence_warnings do
  Bundler.require(:default, Rails.env) if defined?(Bundler)
end

ActiveSupport::Deprecation.silenced = true

module CompanySearch
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
