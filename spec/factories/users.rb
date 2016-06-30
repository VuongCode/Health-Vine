FactoryGirl.define do
  factory :user do
    provider "facebook"
    uid "MyString"
    name "John Doe"
    oauth_token "MyString"
    oauth_expires_at "2016-06-27 23:04:02"
  end
end
