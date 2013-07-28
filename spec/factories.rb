require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "testuser#{n}@test.test" }
    password "password"
    password_confirmation "password"
  end

  factory :product do
    sequence(:name) {|n| "TestProduct#{n}" }
    sequence(:description) {|n| "testdescription#{n}" }
    sequence(:part_number) {|n| "LSS#{n}" }
  end
end