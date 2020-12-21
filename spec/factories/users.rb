FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    sequence(:email) { |n| "sample#{n}@tatoever.com" }
    encrypted_password { 'hogehoge' }
  end
end
