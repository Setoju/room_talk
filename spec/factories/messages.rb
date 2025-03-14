FactoryBot.define do
  factory :message do
    room
    user_name { Faker::Name.name }
    content { Faker::Quote.famous_last_words }
  end
end