require 'faker'

FactoryGirl.define do
  factory :message do
    content       { Faker::Lorem.sentence }
    ttl           { Faker::Number.number(4) }
    init_views    { Faker::Number.number(2) }
    viewed        -1
    unique_hash   nil
    has_password  false

    trait :with_password do
      has_password true
    end
  end
end