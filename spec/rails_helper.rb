# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'

OmniAuth.config.test_mode = true
FACEBOOK_INFO = {
   "id"=> "220439",
   "email" => "johndoe@facebook.com",
 }

OmniAuth.config.mock_auth[:facebook] =  OmniAuth::AuthHash.new({
   "uid" => '12345',
   "provider" => 'facebook',
   "info" => {"name" => "John Doe", "email" => 'johndoe@gmail.com', "image" => 'photo.png'},
   "credentials" => {"token" => '#3248023580238402398409432', "expires_at" => 241241},
   "extra" => {"user_hash" => FACEBOOK_INFO, "raw_info" => { "timezone" => -4.0 } }
 })

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.use_transactional_fixtures = true

  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!
end
require "capybara/rails"
require "valid_attribute"

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end
