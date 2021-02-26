FactoryBot.define do
  factory :order_address do
    postal_code { '123-4567' }
    city { '福岡市' }
    street_address { 1 }
    shipment_area_id { 2 }
    phone { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
