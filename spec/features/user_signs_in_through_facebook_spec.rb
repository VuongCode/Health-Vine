require 'rails_helper'

feature 'user signs in or out', %Q{
  As a user
  I want to sign in
  So that my questions and answers can be associated to me
} do
  # Acceptance Criteria
  # * I must be able to sign in using either facebook, Twitter, or Facebook (choose one)

  before(:each) do
    Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook]
  end

  scenario 'user signs in' do
    # OmniAuth.config.mock_auth[:facebook] = nil
    visit root_path
    find("#sign_in").click

    expect(page).to have_content("Signed in")
  end

  scenario 'user signs out' do
    # OmniAuth.config.mock_auth[:facebook] = nil
    visit root_path
    find("#sign_in").click
    find("#sign_out").click

    expect(page).to have_content("Sign in with Facebook")
  end
end
