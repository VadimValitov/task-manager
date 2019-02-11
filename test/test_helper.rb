ENV['RAILS_ENV'] ||= 'test'

if ENV['RAILS_ENV'] == 'test'
  if ENV['CI']
    require 'coveralls'
    Coveralls.wear!
  else
    require 'simplecov'
    SimpleCov.start 'rails'
  end
end

require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  include FactoryBot::Syntax::Methods
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end
