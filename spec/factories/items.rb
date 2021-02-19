FactoryBot.define do
  factory :item do
    title { "テスト" }
    price { 9999999 }
    description {"テスト"}
    category_id { 2 }
    condition_id { 2 }
    delivery_fee_id { 2 }
    shipment_area_id { 2 }
    shipment_date_id { 2 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end