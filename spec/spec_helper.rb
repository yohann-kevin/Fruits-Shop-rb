RSpec.configure do |config|

  #Use color in STDOUT
  config.color = true

  #Use color not only in STDOUT
  #but also in pagers and files
  config.tty = true

  #Use the specified formatter
  config.formatter = :documentation

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
