# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Webapp::Application.initialize!

Rails::Initializer.run do |config|
	
  # Configure application for use with ambethia-recaptcha gem
  config.gem "ambethia-recaptcha", :lib => "recaptcha/rails", :source => "http://gems.github.com"
end