require "codeclimate-test-reporter"
CodeClimate::TestReporter.start if String(ENV["CODECLIMATE_REPO_TOKEN"]).length > 0

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.filter_run :focus
  config.run_all_when_everything_filtered = true

  config.disable_monkey_patching!

  if config.files_to_run.one?
    config.default_formatter = 'doc'
  end

  config.profile_examples = false

  config.order = :random

  Kernel.srand config.seed
end
