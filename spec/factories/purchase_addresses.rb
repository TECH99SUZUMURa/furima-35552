FactoryBot.define do
  factory :purchase_address do
    postal_code { '123-4567' }
    prefecture_id { 2 }
    manucipality { '大田区あイ町' }
    address { 'あイ宇1-1-1' }
    building_name { 'コーポきら山田 B-206' }
    phone_num { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
