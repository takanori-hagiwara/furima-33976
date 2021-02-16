FactoryBot.define do
  factory :user do
    name {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password {"aaaaa1"}
    password_confirmation {password}
    last_name { "山田" }
    first_name {"太郎"}
    last_furigana {"ヤマダ"}
    first_furigana {"タロウ"}
    birth_date {Faker::Date.between(from: '1930-01-01', to: '2015-12-31')}
  end
end