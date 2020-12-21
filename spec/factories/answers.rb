FactoryBot.define do
  factory :answer do
    for_example { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph_by_chars }
    association :user
    association :question
  end
end
