class OrderDelivery
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post, :prefecture_id, :cities, :address, :building_name, :phone_number, :token

  with_options presence: true do
    validates :post
    validates :prefecture_id
    validates :cities
    validates :address
    validates :phone_number
    validates :token
  end
  validates :post,          format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
  validates :prefecture_id, numericality: { greater_than: 1 }
  validates :phone_number,  format: { with: /(0{1}\d{9,10})/ }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Delivery.create(post: post, prefecture_id: prefecture_id, cities: cities, address: address, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end
