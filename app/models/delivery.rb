class Delivery < ApplicationRecord
  belongs_to :purchase

  with_options presence: true do
    validates :post
    validates :prefecture_id
    validates :cities
    validates :address
    validates :phone_number
  end
end
