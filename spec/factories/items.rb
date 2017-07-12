***spec/factories/items.rb***

FactoryGirl.define do
  factory :items do
    name       { Faker::Lorem.words(4) }
    description { Faker::Hacker.say_something_smart }
    type { Faker::Hacker.say_something_smart }
    unit { Faker::Hacker.say_something_smart }
  end
end
