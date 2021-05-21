FactoryBot.define do
  factory :user do
    japanese_user = Gimei.name

    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    birth_day             {Faker::Date.birthday(min_age: 1, max_age: 91)}
    first_name            {japanese_user.last.kanji}
    last_name             {japanese_user.first.hiragana}
    first_name_kana       {japanese_user.last.katakana}
    last_name_kana        {japanese_user.first.katakana}
  end
end