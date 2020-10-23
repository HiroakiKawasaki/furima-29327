FactoryBot.define do
  factory :item do
    association :user
    name { 'abc' }
    price { '500' }
    category_id { '2' }
    status_id { '2' }
    fee_id { '2' }
    area_id { '2' }
    arrival_id { '2' }
    explanation { '商品です' }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
