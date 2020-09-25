FactoryBot.define do
  factory :shipping_on do
    postal_code    { Faker::Address.postcode }
    prefectures_id { Faker::Number.within(range: 1..47) }
    municipality   { Faker::Address.city }
    address        { Faker::Address.street_address }
    building_name  { '' }
    phone_number   { Faker::Number.number(digits: 11) }
    association :purchase
  end
end
