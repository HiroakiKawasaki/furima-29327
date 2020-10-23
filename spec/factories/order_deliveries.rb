FactoryBot.define do
  factory :order_delivery do
    post { '123-4567' }
    prefecture_id { 2 }
    cities { 'あああ市' }
    address { '123-12' }
    building_name { 'あああビル' }
    phone_number { '08012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
