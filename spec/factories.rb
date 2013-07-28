require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "testuser#{n}@test.test" }
    password "password"
    password_confirmation "password"
  end
end