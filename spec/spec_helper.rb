require 'byebug'

Dir[File.join(File.dirname(__FILE__), '..', 'lib', 'board', '*.rb')].each { |f| require_relative f }
Dir[File.join(File.dirname(__FILE__), '..', 'lib', '*.rb')].each { |f| require_relative f }
Dir[File.join(File.dirname(__FILE__), '..', 'models', '*.rb')].each { |f| require_relative f }

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end
