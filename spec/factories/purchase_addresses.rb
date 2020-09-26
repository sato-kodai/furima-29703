FactoryBot.define do
  factory :purchase_addresses do
    postal_code    { '123-4567' }
    prefectures_id { Faker::Number.within(range: 1..47) }
    municipality   { Faker::Address.city }
    address        { Faker::Address.street_address }
    building_name  { 'aaaa' }
    phone_number   { Faker::Number.number(digits: 11) }
    token          { '00000000000000000000000' }
  end
end
