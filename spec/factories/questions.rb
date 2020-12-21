FactoryBot.define do
  factory :question do
    title { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph_by_chars }
    association :user

    trait :with_answers do
      transient do
        answers_length { 2 }
      end

      after(:create) do |_question, evaluator|
        FactoryBot.create_list(:answer, evaluator.answers_length, description: description)
      end
    end
  end
end
