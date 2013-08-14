ENV["RAILS_ENV"] ||= 'test'
ENV["SECRET_TOKEN"] = "6751a8205bbfbe993ab4a09966c0d188"
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'capybara/rails'
require 'factory_girl'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.use_transactional_fixtures = true
  config.infer_base_class_for_anonymous_controllers = false
  config.order = "random"
end

def sign_in(user)
  visit '/users/sign_in'
  fill_in "user_email", :with => user.email
  fill_in "user_password", :with => user.password
  click_button "Sign in"
end
