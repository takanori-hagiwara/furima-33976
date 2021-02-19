FactoryBot.define do
  factory :item do
    image
    category
    condition
    price
    assosiation :users
  end
end
