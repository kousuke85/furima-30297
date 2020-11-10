FactoryBot.define do
  factory :item do
    name                {Faker::Name.initials(number: 2)}
    text                {Faker::Name.initials(number: 2)}
    category_id         {Faker::Number.between(from:1,to:10)}
    condition_id        {Faker::Number.between(from:1,to:6)}
    deliverycharge_id  {Faker::Number.between(from:1,to:2)}
    deliveryarea_id    {Faker::Number.between(from:1,to:48)}
    deliverydays_id    {Faker::Number.between(from:1,to:4)}
    price               {Faker::Number.between(from:300,to:9999999)}
    association :user 
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
