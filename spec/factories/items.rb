FactoryBot.define do
  factory :item do
    name               { 'テスト' }
    comment            { 'テスト' }
    category_id        { Faker::Number.within(range: 1..10) }
    status_id          { Faker::Number.within(range: 1..6) }
    shipping_cost_id   { Faker::Number.within(range: 1..2) }
    shipment_source_id { Faker::Number.within(range: 1..47) }
    shipping_days_id   { Faker::Number.within(range: 1..3) }
    price              { Faker::Number.within(range: 300..9_999_999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpeg'), filename: 'test_image.jpeg')
    end
  end
end
