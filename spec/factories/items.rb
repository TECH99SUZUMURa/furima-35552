FactoryBot.define do
  factory :item do
    item_name                   {Faker::Name.initials(number: 3)}
    price                       {300 + Faker::Number.number(digits: 3)}
    text                        {Faker::Lorem.sentence}
    category_id                 {Faker::Number.between(from: 2, to: 11)}
    condition_id                {Faker::Number.between(from: 2, to: 7)}
    shipping_charge_id          {Faker::Number.between(from: 2, to: 3)}
    prefecture_id               {Faker::Number.between(from: 2, to: 48)}
    estimated_shipping_date_id  {Faker::Number.between(from: 2, to: 4)}
    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test-image.png'), filename: 'test-image.png')
    end
  end
end