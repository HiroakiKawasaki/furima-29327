FactoryBot.define do
  factory :item do
    association :user
    name {"abc"}    
    price {"500"}
    category {"2"}
    status {"2"}
    fee {"2"}
    area {"2"}
    arrival {"2"}
    explanation {"商品です"}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
