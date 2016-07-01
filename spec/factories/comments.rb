FactoryGirl.define do
  factory :comment do
    body "MyText"
    rating 1
    post nil
    user nil
  end
end
