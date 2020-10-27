FactoryBot.define do
  factory :item do
    name                {Faker::Name.initials(number: 2)}
    text                {Faker::Name.initials(number: 2)}
    category_id         {Faker::Number.between(from:1,to:10)}
    condition_id        {Faker::Number.between(from:1,to:6)}
    delivery_charge_id  {Faker::Number.between(from:1,to:2)}
    delivery_area_id    {Faker::Number.between(from:1,to:48)}
    delivery_days_id    {Faker::Number.between(from:1,to:4)}
    price               {Faker::Number.between(from:300,to:9999999)}
    association :user 
  end
end
