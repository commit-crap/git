require 'rails/all'
require 'spec_helper'
require 'rspec/rails'
require 'devise'
require 'factory_girl'

RSpec.configure do |config|
  config.color     = true
  config.tty       = true
  config.formatter = :documentation

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  # factory_girl
  config.include FactoryGirl::Syntax::Methods

  config.include Devise::TestHelpers, type: :controller
  config.include Warden::Test::Helpers, type: :request
end
