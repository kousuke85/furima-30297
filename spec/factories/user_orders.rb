FactoryBot.define do
  factory :user_order do
      token                  {"aaaaaaaaaaaaaa"}
      postal_code            {"123-4567"}
      prefectures_id         {Faker::Number.between(from:1,to:48)}
      municipality           {"横浜市緑区"}
      address                {"青山1-1-1"}
      building_name          {"柳ビル103"}
      phone_number           {"09012345678"}
      association :user
      association :item
    end
end
